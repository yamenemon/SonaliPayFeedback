import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';

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

  Future<String?> uploadAttachment(File file) async {
    try {
      String fileName = file.path.split('/').last;
      Reference ref =
          FirebaseStorage.instance.ref().child('attachments/$fileName');
      UploadTask uploadTask = ref.putFile(file);
      TaskSnapshot taskSnapshot = await uploadTask;
      return await taskSnapshot.ref.getDownloadURL();
    } catch (e) {
      print('Error uploading attachment: $e');
      return null;
    }
  }

  Future<void> storeUserInformation(
      String name, String email, String complaint, String attachmentUrl) async {
    try {
      await FirebaseFirestore.instance.collection('users').add({
        'name': name,
        'email': email,
        'complaint': complaint,
        'attachmentUrl': attachmentUrl,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error storing user information: $e');
    }
  }

  Future<void> handleUserInformation(
      String name, String email, String complaint) async {
    if (_formState.attachment != null) {
      String? attachmentUrl = await uploadAttachment(_formState.attachment!);
      if (attachmentUrl != null) {
        await storeUserInformation(name, email, complaint, attachmentUrl);
      } else {
        print('Failed to upload attachment');
      }
    } else {
      await storeUserInformation(name, email, complaint, '');
    }
  }
}
