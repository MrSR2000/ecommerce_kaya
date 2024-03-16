import 'package:flutter/material.dart';

import 'widgets/home_page_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      appBar: appBar(context: context),
      body: body(),
      drawer: drawer(context),
    );
  }
}
