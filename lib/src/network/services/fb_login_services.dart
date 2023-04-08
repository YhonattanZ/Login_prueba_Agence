import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FbLogin {
  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;
  bool? _checking = true;

  ifUserIsLoggedIn(BuildContext context) async {
    final accessToken = await FacebookAuth.instance.accessToken;
    if (accessToken!.token.isNotEmpty) {
      _checking = false;
    }
    if (accessToken != null) {
      final userData = await FacebookAuth.instance.getUserData();
      _accessToken = accessToken;

      _userData = userData;
    } else {
      login(context);
    }
  }

  login(BuildContext context) async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult.status == LoginStatus.success) {
      _accessToken = loginResult.accessToken;
      final userInfo = await FacebookAuth.instance.getUserData();
      _userData = userInfo;
      Navigator.pushNamed(context, 'home');
    } else {
      print('ResultStatus: ${loginResult.status}');
      print('Message: ${loginResult.message}');
    }
  }

  logout() async {
    await FacebookAuth.instance.logOut();
    _accessToken = null;
    _userData = null;
  }
}
