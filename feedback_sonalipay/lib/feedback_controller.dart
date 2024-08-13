import 'dart:io';
import 'package:feedback_sonalipay/declaration.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path/path.dart';
// To handle JSON encoding and decoding

class FeedbackFormState {
  String name = '';
  String email = '';
  String complaint = '';
  File? attachment;

  FeedbackFormState({
    required this.name,
    required this.email,
    required this.complaint,
    this.attachment,
  });
}

class FeedbackController extends ChangeNotifier {
  FeedbackFormState _formState =
      FeedbackFormState(name: '', email: '', complaint: '');

  FeedbackFormState get formState => _formState;

  void updateName(String name) {
    _formState.name = name;
    notifyListeners();
  }

  void updateEmail(String email) {
    _formState.email = email;
    notifyListeners();
  }

  void updateComplaint(String complaint) {
    _formState.complaint = complaint;
    notifyListeners();
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'jpeg',
        'png',
        'mp3',
        'mp4',
        'wav'
      ], // Allowed file types
    );

    if (result != null) {
      _formState.attachment = File(result.files.single.path!);
      notifyListeners();
    } else {
      print('User canceled file picking');
    }
  }

  Future<void> handleUserInformation(
      String name, String email, String complaint) async {
    print(name);
    print(email);
    print(complaint);

    final url = Uri.parse('https://churchapp.nzian.xyz/complains');

    try {
      var request = http.MultipartRequest('POST', url);

      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('$username:$password'));
      // Add authentication header
      request.headers['Authorization'] = basicAuth;
      // request.headers['Authorization'] = 'Bearer $token';

      // Add text fields
      request.fields['name'] = name;
      request.fields['email'] = email;
      request.fields['complain'] = complaint;
      request.fields['created_at'] = DateTime.now().toString();

      // Add file if available
      if (formState.attachment != null) {
        // Get the file name and mime type
        final fileName = basename(formState.attachment!.path);
        final fileStream = http.ByteStream(formState.attachment!.openRead());
        final fileLength = await formState.attachment!.length();

        request.files.add(
          http.MultipartFile(
            'image', // This is the field name that your backend expects
            fileStream,
            fileLength,
            filename: fileName,
          ),
        );
      }

      // Send the request
      final response = await request.send();

      // Check for the response status
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Handle the response, for example:
        final responseBody = await response.stream.bytesToString();
        print('Response: $responseBody');
      } else {
        print(
            'Failed to submit complaint. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error submitting complaint: $e');
    }
  }
}
