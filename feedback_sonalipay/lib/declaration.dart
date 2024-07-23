import 'package:feedback_sonalipay/feedback_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseDatabase database = FirebaseDatabase.instance;
final feedbackProvider =
    ChangeNotifierProvider((ref) => new FeedbackController());
