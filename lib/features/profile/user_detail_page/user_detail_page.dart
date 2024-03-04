import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaya/config/theme/app_themes.dart';
import 'package:kaya/core/resources/components/body_padding.dart';
import 'package:kaya/core/resources/components/center_circular_loading_widget.dart';
import 'package:kaya/core/resources/components/contact_developer_widget.dart';
import 'package:kaya/core/resources/components/text_widget.dart';
import 'package:kaya/models/user_model/user_detail_model.dart';

import '../../../bloc/authentication/authentication_bloc.dart';
import '../../../injection_container.dart';

class UserDetailpage extends StatelessWidget {
  const UserDetailpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text("User Information"),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => sl<AuthenticationBloc>()..add(UserDetailEvent()),
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is UserDetailLoadingState) {
                return centerCircularLoadingWidget();
              }

              if (state is UserDetailErrorState) {
                return textWidget(
                  text: state.error,
                  textSize: TextSize.medium,
                );
              }

              if (state is UserDetailSuccessState) {
                UserDetailModel userDetail = state.userDetail;

                return SingleChildScrollView(
                  child: bodyPadding(
                    child: Column(
                      children: [
                        Center(
                          child: Card(
                            surfaceTintColor: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  textWidget(
                                    text: userDetail.fullName!,
                                    textSize: TextSize.medium,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textWidget(
                                    text: userDetail.email!,
                                    textSize: TextSize.small,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return contactDeveloperWidget();
            },
          ),
        ),
      ),
    );
  }
}
