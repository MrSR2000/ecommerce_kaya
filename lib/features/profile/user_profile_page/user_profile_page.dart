import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kaya/bloc/authentication/authentication_bloc.dart';
import 'package:kaya/bloc/theme/theme_bloc.dart';
import 'package:kaya/config/routes/routes.dart';
import 'package:kaya/config/theme/app_themes.dart';
import 'package:kaya/core/resources/components/body_padding.dart';
import 'package:kaya/core/resources/components/elevated_button_style.dart';
import 'package:kaya/core/resources/components/gaps.dart';
import 'package:kaya/core/resources/components/text_widget.dart';
import 'package:kaya/features/authentication/login_page/login_page.dart';
import 'package:kaya/features/profile/user_detail_page/user_detail_page.dart';
import 'package:kaya/main.dart';

import '../../../injection_container.dart';
import 'widgets/user_profile_widgets.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late AuthenticationBloc _logoutBloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: isLoggedIn
          ? ifLoggedInBody(logoutBloc: _logoutBloc)
          : ifNotLoggedInBody(context, () async {
              bool? result =
                  await Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );

              log("login response = $result");

              if (result ?? false) {
                setState(() {});
              }
            }),
    );
  }

  @override
  void initState() {
    super.initState();
    _logoutBloc = sl<AuthenticationBloc>();
  }

  SafeArea ifLoggedInBody({required AuthenticationBloc logoutBloc}) {
    return SafeArea(
      child: bodyPadding(
        child: Card(
          surfaceTintColor: Colors.white,
          child: bodyPadding(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gap20,
                textWidget(
                  text: "Profile",
                  textSize: TextSize.large,
                  fontWeight: FontWeight.bold,
                  textDecoration: TextDecoration.underline,
                ),
                gap15,
                optionsWidget(
                    title: "Information",
                    ontap: () {
                      pushPage(context: context, page: const UserDetailpage());
                    }),
                gap5,
                optionsWidget(title: "Address Book", ontap: () {}),
                gap5,
                optionsWidget(title: "Reward Coins", ontap: () {}),
                gap5,
                optionsWidget(title: "Change Password", ontap: () {}),
                gap20,
                Divider(
                  color: Colors.grey[400]!,
                ),
                gap20,
                textWidget(
                  text: "Order",
                  textSize: TextSize.large,
                  fontWeight: FontWeight.bold,
                  textDecoration: TextDecoration.underline,
                ),
                optionsWidget(title: "My Orders", ontap: () {}),
                gap5,
                optionsWidget(title: "My Review", ontap: () {}),
                gap5,
                optionsWidget(title: "Wishlist", ontap: () {}),
                gap10,
                Row(
                  children: [
                    textWidget(
                      text: "Dark Mode",
                      textSize: TextSize.small,
                    ),
                    const Spacer(),
                    Switch(
                      value: context.read<ThemeBloc>().state == ThemeMode.dark,
                      onChanged: (value) {
                        setState(() {});
                        context
                            .read<ThemeBloc>()
                            .add(ThemeChanged(isDark: value));
                      },
                    ),
                  ],
                ),
                gap20,
                gap20,
                if (isLoggedIn)
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: elevatedButtonStyle,
                      onPressed: () {
                        logoutBloc.add(LogoutEvent());
                      },
                      child:
                          BlocConsumer<AuthenticationBloc, AuthenticationState>(
                        bloc: logoutBloc,
                        listener: (context, state) {
                          if (state is LogoutSuccessState) {
                            log("here");

                            Fluttertoast.showToast(
                              msg: "Logged Out Successful",
                              gravity: ToastGravity.CENTER,
                            );

                            setState(() {});
                          }
                        },
                        builder: (context, state) {
                          return textWidget(
                              text: "LOGOUT",
                              textSize: TextSize.medium,
                              color: Colors.white);
                        },
                      ),
                    ),
                  ),
                gap20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
