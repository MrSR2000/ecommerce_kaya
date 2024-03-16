import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kaya/core/resources/functions/print_long_string.dart';

import '../../../injection_container.dart';
import '../../constants/constants.dart';

Future<String> getAccessTokenFormat() async {
  String? accessToken =
      await sl<FlutterSecureStorage>().read(key: accessTokenKey);

  // log("accessToken = $accessToken!");

  printLongString(accessToken!);

  return "Bearer $accessToken";
}
