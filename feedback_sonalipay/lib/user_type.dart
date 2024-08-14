import 'package:feedback_sonalipay/feedback_list.dart';
import 'package:feedback_sonalipay/feedback_view.dart';
import 'package:flutter/material.dart';

class UserType extends StatelessWidget {
  const UserType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FeedbackView(),
                    ),
                    (Route<dynamic> route) => false);
              },
              child: Text('Make a Complain'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FeedbackList(),
                      ),
                      (Route<dynamic> route) => false);
                },
                child: Text('List of Complain')),
          ],
        ),
      ),
    );
  }
}
