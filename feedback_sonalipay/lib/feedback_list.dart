import 'package:feedback_sonalipay/declaration.dart';
import 'package:feedback_sonalipay/navigation_service.dart';
import 'package:feedback_sonalipay/user_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      body: Consumer(
        builder: (context, ref, _) {
          final controller = ref.watch(FeedbackListProvider);
          if (controller.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.error != null) {
            return Center(child: Text('Error: ${controller.error}'));
          } else if (!controller.complaints.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: controller.complaints.length,
                itemBuilder: (context, index) {
                  final complaint = controller.complaints[index];
                  return ListTile(
                    leading: Image.network(
                        complaint.image != null ? complaint.image! : ""),
                    title: Text(complaint.name),
                    subtitle: Text(complaint.complain),
                  );
                },
              ),
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Provider.of<ComplaintProvider>(context, listen: false).fetchComplaint();
      //   },
      //   child: Icon(Icons.refresh),
      // ),
    );
  }
}
