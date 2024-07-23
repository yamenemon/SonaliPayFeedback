import 'package:feedback_sonalipay/declaration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedbackView extends StatelessWidget {
  FeedbackView({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void _dismissKeyboard() {
      FocusScope.of(context).unfocus();
    }

    return GestureDetector(
      onTap: _dismissKeyboard,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Complaint Form'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Consumer(builder: (context, ref, _) {
            {
              final formController = ref.watch(feedbackProvider);
              final formState = formController.formState;
              return Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Name'),
                      initialValue: formState.name,
                      onChanged: formController.updateName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      initialValue: formState.email,
                      onChanged: formController.updateEmail,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Complaint'),
                      maxLines: 5,
                      initialValue: formState.complaint,
                      onChanged: formController.updateComplaint,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your complaint';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: formController.pickFile,
                      child: Text('Attach File'),
                    ),
                    if (formState.attachment != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                            'File: ${formState.attachment!.path.split('/').last}'),
                      ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () => formController.submitForm(context),
                      child: Text('Submit'),
                    ),
                    SizedBox(height: 50.0),
                  ],
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
