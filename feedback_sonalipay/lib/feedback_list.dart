import 'package:feedback_sonalipay/navigation_service.dart';
import 'package:feedback_sonalipay/user_type.dart';
import 'package:flutter/material.dart';

class FeedbackList extends StatelessWidget {
  const FeedbackList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Feedback List'),
          leading: InkWell(
            onTap: () {
              NavigationService().navigateToScreen(UserType());
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            ),
          ),
        ),
        body: Container());
  }
}
