import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kaya/config/routes/routes.dart';
import 'package:kaya/config/theme/app_themes.dart';
import 'package:kaya/core/resources/components/elevated_button_style.dart';
import 'package:kaya/core/resources/components/gaps.dart';
import 'package:kaya/core/resources/components/rounded_border_container.dart';
import 'package:kaya/core/resources/components/text_form_widget.dart';
import 'package:kaya/core/resources/components/text_widget.dart';
import 'package:kaya/core/resources/screen_size.dart';
import 'package:kaya/features/authentication/signup_page/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: roundedBorderContainer(
          width: getDeviceSize(context: context).deviceWidth / 1.1,
          bgColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              textWidget(
                text: "Sign In",
                textSize: TextSize.large,
                fontWeight: FontWeight.bold,
              ),
              gap20,
              TextFormWidget(
                fillColor: Colors.white,
                controller: _emailController,
                hintText: "",
                labelText: "Email",
              ),
              gap15,
              TextFormWidget(
                fillColor: Colors.white,
                controller: _passwordController,
                hintText: "",
                labelText: "Password",
                obstructText: !_showPassword,
                suffixWidget: IconButton(
                  onPressed: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                  icon: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                ),
              ),
              gap20,
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {},
                  style: elevatedButtonStyle,
                  child: textWidget(
                    text: "Sign In",
                    textSize: TextSize.medium,
                    color: Colors.white,
                  ),
                ),
              ),
              gap20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textWidget(
                    text: "Don't have an account ? ",
                    textSize: TextSize.small,
                  ),
                  InkWell(
                    onTap: () {
                      pushPage(
                        context: context,
                        page: const SignUpPage(),
                      );
                    },
                    child: textWidget(
                      text: "Sign Up",
                      textSize: TextSize.small,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              gap10,
              Center(
                child: InkWell(
                  onTap: () {},
                  child: textWidget(
                    text: "Forgot Your Password?",
                    textSize: TextSize.small,
                  ),
                ),
              ),
              gap15,
              Center()
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
