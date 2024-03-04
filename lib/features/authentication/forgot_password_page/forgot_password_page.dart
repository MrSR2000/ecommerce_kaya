import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kaya/bloc/authentication/authentication_bloc.dart';
import 'package:kaya/config/theme/app_themes.dart';
import 'package:kaya/core/resources/components/elevated_button_style.dart';
import 'package:kaya/core/resources/components/rounded_border_container.dart';

import '../../../core/resources/components/gaps.dart';
import '../../../core/resources/components/text_form_widget.dart';
import '../../../core/resources/components/text_widget.dart';
import '../../../core/resources/screen_size.dart';
import '../../../injection_container.dart';

class ForgotPasswordPage extends StatefulWidget {
  final String email;
  const ForgotPasswordPage({
    super.key,
    required this.email,
  });

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late TextEditingController _emailController;
  late AuthenticationBloc _forgotPasswordBloc;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: roundedBorderContainer(
          width: getDeviceSize(context: context).deviceWidth / 1.1,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                TextFormWidget(
                  fillColor: Colors.white,
                  controller: _emailController,
                  hintText: "",
                  labelText: "Email",
                  customErrorMessage: "Email is required",
                  textInputType: TextInputType.emailAddress,
                ),
                gap15,
                ElevatedButton(
                  style: elevatedButtonStyle,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _forgotPasswordBloc.add(
                        ForgotPasswordEvent(email: _emailController.text),
                      );
                    }
                  },
                  child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
                    bloc: _forgotPasswordBloc,
                    listener: (context, state) {
                      if (state is ForgotPasswordErrorState) {
                        Fluttertoast.showToast(
                          msg: state.error,
                          gravity: ToastGravity.CENTER,
                        );
                      }

                      if (state is ForgotPasswordSuccessState) {
                        Fluttertoast.showToast(
                          msg: state.forgotPasswordResponse['message'],
                          gravity: ToastGravity.CENTER,
                        );

                        Navigator.pop(context);
                      }
                    },
                    builder: (context, state) {
                      if (state is ForgotPasswordLoadingState) {
                        return const SizedBox(
                          height: 15,
                          width: 15,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      }
                      return textWidget(
                        text: "Submit",
                        textSize: TextSize.small,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      );
                    },
                  ),
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
    _emailController = TextEditingController(text: widget.email);

    _forgotPasswordBloc = sl<AuthenticationBloc>();
  }
}
