import 'package:feedback_sonalipay/feedback_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final feedbackProvider =
    ChangeNotifierProvider((ref) => new FeedbackController());
