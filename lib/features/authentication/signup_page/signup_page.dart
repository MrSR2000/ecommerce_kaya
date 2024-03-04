import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kaya/config/theme/app_themes.dart';
import 'package:kaya/core/resources/components/rounded_border_container.dart';
import 'package:kaya/features/authentication/login_page/login_page.dart';
import 'package:kaya/models/authentication_model/signup_model.dart';

import '../../../bloc/authentication/authentication_bloc.dart';
import '../../../config/routes/routes.dart';
import '../../../core/resources/components/elevated_button_style.dart';
import '../../../core/resources/components/gaps.dart';
import '../../../core/resources/components/text_form_widget.dart';
import '../../../core/resources/components/text_widget.dart';
import '../../../core/resources/screen_size.dart';
import '../../../injection_container.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _fullNameController;

  bool _showPassword = false;

  late AuthenticationBloc _signUpBloc;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Form(
        key: _formKey,
        child: Center(
          child: roundedBorderContainer(
            width: getDeviceSize(context: context).deviceWidth / 1.1,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: textWidget(
                    text: "Sign Up",
                    textSize: TextSize.large,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                gap20,
                TextFormWidget(
                  fillColor: Colors.white,
                  controller: _fullNameController,
                  hintText: "",
                  labelText: "Full name",
                  customErrorMessage: "Full name is required",
                ),
                gap15,
                TextFormWidget(
                  fillColor: Colors.white,
                  controller: _emailController,
                  hintText: "",
                  labelText: "Email",
                  customErrorMessage: "Email is required",
                  textInputType: TextInputType.emailAddress,
                ),
                gap15,
                TextFormWidget(
                  fillColor: Colors.white,
                  controller: _passwordController,
                  hintText: "",
                  labelText: "Password",
                  obstructText: !_showPassword,
                  customErrorMessage: "Password is required",
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
                textWidget(
                  maxLine: 5,
                  text:
                      "By Clicking Create Account, You Agree To Our Terms & Conditions",
                  textSize: TextSize.small,
                ),
                gap15,
                BlocConsumer<AuthenticationBloc, AuthenticationState>(
                  bloc: _signUpBloc,
                  listener: (context, state) {
                    if (state is SignUpSuccessState) {
                      pushReplacePage(
                        context: context,
                        page: const LoginPage(),
                      );

                      Fluttertoast.showToast(
                        msg: "User successfully created",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }

                    if (state is SignUpErrorState) {
                      Fluttertoast.showToast(
                        msg: state.error,
                        gravity: ToastGravity.CENTER,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is SignUpLoadingState) {
                      return ElevatedButton(
                        onPressed: () {},
                        style: elevatedButtonStyle,
                        child: const SizedBox(
                          height: 15,
                          width: 15,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      );
                    }

                    return SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            SignUpRequestModel signUpRequestModel =
                                SignUpRequestModel(
                              emailOrContactNumber: _emailController.text,
                              password: _passwordController.text,
                              fullName: _fullNameController.text,
                            );

                            _signUpBloc.add(
                              SignUpEvent(
                                  signUpRequestModel: signUpRequestModel),
                            );
                          }
                        },
                        style: elevatedButtonStyle,
                        child: textWidget(
                          text: "Create Account",
                          textSize: TextSize.medium,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
                gap20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textWidget(
                      text: "Already have an account ? ",
                      textSize: TextSize.small,
                    ),
                    InkWell(
                      onTap: () {
                        pushReplacePage(
                          context: context,
                          page: const LoginPage(),
                        );
                      },
                      child: textWidget(
                        text: "Sign In",
                        textSize: TextSize.small,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
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
    _fullNameController = TextEditingController();

    _signUpBloc = sl<AuthenticationBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _fullNameController.dispose();
  }
}
