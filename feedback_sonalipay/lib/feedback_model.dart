import 'dart:io';

class FeedbackFormState {
  String name;
  String email;
  String complaint;
  File? attachment;

  FeedbackFormState({
    this.name = '',
    this.email = '',
    this.complaint = '',
    this.attachment,
  });

  bool get isValid {
    return name.isNotEmpty &&
        email.isNotEmpty &&
        RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email) &&
        complaint.isNotEmpty;
  }
}
