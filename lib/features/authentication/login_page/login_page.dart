import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kaya/bloc/authentication/authentication_bloc.dart';
import 'package:kaya/config/routes/routes.dart';
import 'package:kaya/config/theme/app_themes.dart';
import 'package:kaya/core/resources/components/elevated_button_style.dart';
import 'package:kaya/core/resources/components/gaps.dart';
import 'package:kaya/core/resources/components/rounded_border_container.dart';
import 'package:kaya/core/resources/components/text_form_widget.dart';
import 'package:kaya/core/resources/components/text_widget.dart';
import 'package:kaya/core/resources/screen_size.dart';
import 'package:kaya/features/authentication/forgot_password_page/forgot_password_page.dart';
import 'package:kaya/features/authentication/signup_page/signup_page.dart';
import 'package:kaya/main.dart';
import 'package:kaya/models/authentication_model/login_model.dart';

import '../../../injection_container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  bool _showPassword = false;

  final _formKey = GlobalKey<FormState>();

  late AuthenticationBloc _loginBloc;

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
          child: Form(
            key: _formKey,
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
                  textInputType: TextInputType.emailAddress,
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        LoginRequestModel loginRequestModel = LoginRequestModel(
                          emailOrContactNumber: _emailController.text,
                          password: _passwordController.text,
                        );

                        _loginBloc.add(
                          LoginEvent(loginRequestModel: loginRequestModel),
                        );
                      }
                    },
                    style: elevatedButtonStyle,
                    child:
                        BlocConsumer<AuthenticationBloc, AuthenticationState>(
                      bloc: _loginBloc,
                      listener: (context, state) {
                        if (state is LoginSuccessState) {
                          // pushReplacePage(context: context, page: page)

                          isLoggedIn = true;

                          handleLoginChange(isLoggedIn);

                          Navigator.pop(context, true);

                          Fluttertoast.showToast(
                            msg: "Login successful",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }

                        if (state is LoginErrorState) {
                          Fluttertoast.showToast(
                            msg: state.error,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is LoginLoadingState) {
                          return const SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }
                        return textWidget(
                          text: "Sign In",
                          textSize: TextSize.medium,
                          color: Colors.white,
                        );
                      },
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
                    onTap: () {
                      pushPage(
                        context: context,
                        page: ForgotPasswordPage(
                          email: _emailController.text,
                        ),
                      );
                    },
                    child: textWidget(
                      text: "Forgot Your Password?",
                      textSize: TextSize.small,
                    ),
                  ),
                ),
                gap15,
                // Center()
              ],
            ),
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

    _loginBloc = sl<AuthenticationBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
