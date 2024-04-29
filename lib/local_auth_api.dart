/*import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_platform_interface/local_auth_platform_interface.dart';

class LocalAuthApi{
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    return await _auth.canCheckBiometrics;
  }

  static Future<bool>authenticate() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;


    try{
      return await _auth.authenticate(
      AuthMessages: AndroidAuthMessages(
        signInTitle: 'Face ID Required',
      ),
      localizedReason:'Scan Face to Authenticate',
      useErrorDialogs: true,
      stickyAuth: true,
    );
  } on PlatformException catch (e) {
    return false;
  }
}
}*/