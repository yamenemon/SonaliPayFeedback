import 'dart:io';

import 'package:feedback_sonalipay/feedback_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FeedbackController extends ChangeNotifier {
  FeedbackFormState _formState = FeedbackFormState();
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

  void updateAttachment(File? attachment) {
    _formState.attachment = attachment;
    notifyListeners();
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      updateAttachment(File(result.files.single.path!));
    }
  }

  void submitForm(BuildContext context) {
    if (_formState.isValid) {
      // Process the form data
      print('Form Submitted');
      print('Name: ${_formState.name}');
      print('Email: ${_formState.email}');
      print('Complaint: ${_formState.complaint}');
      if (_formState.attachment != null) {
        print('Attachment: ${_formState.attachment!.path}');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form Submitted')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields correctly')),
      );
    }
  }
}
