import 'package:flutter/material.dart';
import 'package:kaya/config/routes/routes.dart';
import 'package:kaya/config/theme/app_themes.dart';
import 'package:kaya/core/resources/components/body_padding.dart';
import 'package:kaya/core/resources/components/gaps.dart';
import 'package:kaya/core/resources/components/rounded_border_container.dart';
import 'package:kaya/core/resources/components/text_widget.dart';

import '../../search_page/search_page.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: bodyPadding(
        child: InkWell(
          onTap: () {
            // showSearch(
            //   context: context,
            //   delegate: Search(),
            // );

            pushPage(
              context: context,
              page: const SearchPage(),
            );
          },
          child: roundedBorderContainer(
            width: double.maxFinite,
            bgColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  size: 18,
                ),
                gap10,
                textWidget(
                  text: "Search...",
                  textSize: TextSize.small,
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
  }
}
