import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kaya/core/resources/functions/authorization_format.dart';
import 'package:kaya/core/resources/functions/print_long_string.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String accessToken = '';

  @override
  void initState() {
    super.initState();

    getAccessToken();
  }

  getAccessToken() async {
    accessToken = await getAccessTokenFormat();

    printLongString("access token = $accessToken");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("notification"),
    );
  }
}
