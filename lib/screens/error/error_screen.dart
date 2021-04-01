import 'package:animated_error_page/screens/error/components/body.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFCC02),
      body: Body(),
    );
  }
}