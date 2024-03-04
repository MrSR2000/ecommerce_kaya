import 'package:flutter/material.dart';
import 'package:kaya/core/resources/components/rounded_border_container.dart';

import '../../../core/resources/components/gaps.dart';
import '../../../core/resources/components/text_form_widget.dart';
import '../../../core/resources/components/text_widget.dart';
import '../../../core/resources/screen_size.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: roundedBorderContainer(
          width: getDeviceSize(context: context).deviceWidth / 1.1,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: textWidget(
                  text: "Forgot Password",
                  textSize: TextSize.large,
                  fontWeight: FontWeight.bold,
                ),
              ),
              gap20,
              // TextFormWidget(
              //   fillColor: Colors.white,
              //   controller: _fullNameController,
              //   hintText: "",
              //   labelText: "Full name",
              //   customErrorMessage: "Full name is required",
              // ),
              // gap15,
              // TextFormWidget(
              //   fillColor: Colors.white,
              //   controller: _emailController,
              //   hintText: "",
              //   labelText: "Email",
              //   customErrorMessage: "Email is required",
              //   textInputType: TextInputType.emailAddress,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
