import 'dart:convert';
import 'package:feedback_sonalipay/declaration.dart';
import 'package:feedback_sonalipay/feedback_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class FeedbackListController extends ChangeNotifier {
  List<Complaint> _complaints = [];
  bool _loading = false;
  String? _error;

  List<Complaint> get complaints => _complaints;
  bool get loading => _loading;
  String? get error => _error;

  FeedbackListController() {
    fetchComplaint();
  }

  Future<void> fetchComplaint() async {
    _loading = true;
    _error = null;
    notifyListeners();

    final url = Uri.parse('https://churchapp.nzian.xyz/complains');

    try {
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('$username:$password'));
      // Add authentication header
      Response r =
          await get(url, headers: <String, String>{'authorization': basicAuth});

      if (r.statusCode == 200) {
        print(r.body.toString());
        final List<dynamic> jsonList = json.decode(r.body);
        _complaints = Complaint.fromJsonList(jsonList);
      } else {
        _error = 'Failed to load complaint';
      }
    } catch (e) {
      _error = 'Failed to load complaint: $e';
    }
    _loading = false;
    notifyListeners();
  }
}
