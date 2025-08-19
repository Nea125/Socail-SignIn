import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:social_sigin/const/const.dart';

class NotificationService {
  Future<void> sendPushNotification(
      {required String orderId,
      required String ticketType,
      required String ticket}) async {
    final url = Uri.parse(AppConstant.oneSignalURL);

    final body = {
      "app_id": AppConstant.oneSignalId,
      "included_segments": ["All"], // send to all users
      "headings": {"en": "New Order"},
      "contents": {"en": "Order ID: $orderId"},
      "big_picture":
          "https://media.istockphoto.com/id/1500283713/vector/cinema-ticket-on-white-background-movie-ticket-on-white-background.jpg?s=612x612&w=0&k=20&c=4J15lHFXyjEs6xBoagcZqq5GYHKk5sMwCJRP8pNM3Zg=",
      // Optionally, add additionalData for routing
      "data": {
        "order_id": orderId,
        "ticket_type": ticketType,
        "ticket": ticket
      },
    };

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Basic ${AppConstant.oneSignalAPIKey}",
      },
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      print("Notification sent!");
    } else {
      print("Error sending notification: ${response.body}");
    }
  }
}
