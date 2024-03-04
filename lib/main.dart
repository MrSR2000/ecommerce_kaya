import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kaya/config/theme/app_themes.dart';
import 'package:kaya/core/constants/constants.dart';
import 'package:kaya/features/main_page.dart';
import 'package:kaya/injection_container.dart';
import 'package:loader_overlay/loader_overlay.dart';

bool isLoggedIn = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

handleLoginChange(bool loggedIn) {
  isLoggedIn = loggedIn;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KAYA',
      theme: theme(),
      home: LoaderOverlay(
        useDefaultLoading: false,
        overlayWidgetBuilder: (_) {
          //ignored progress for the moment
          return const Center(
            child: CupertinoActivityIndicator(
              color: Colors.black,
              radius: 30,
            ),
          );
        },
        child: const MainPage(),
        // child: const LoginPage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    checkUserLoggedIn();
  }

  checkUserLoggedIn() async {
    String? accessToken =
        await sl<FlutterSecureStorage>().read(key: accessTokenKey);

    if (accessToken != null && accessToken.isNotEmpty) {
      isLoggedIn = true;
    }
  }
}
