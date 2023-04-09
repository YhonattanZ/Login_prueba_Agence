import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  bool isLogged = true;
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  static Future<GoogleSignInAccount?> signInWithGoogle(
      BuildContext context) async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn
          .signIn()
          .whenComplete(() => Navigator.pushNamed(context, 'home'));

      print(account);
      return account;
    } catch (e) {
      print('Error en Google Sign In');
      print(e);
      return null;
    }
  }

  static Future signOut(BuildContext context) async {
    await _googleSignIn
        .signOut()
        .whenComplete(() => Navigator.popAndPushNamed(context, 'login'));

    const SnackBar(content: Text('Has cerrado sesion'));
  }
}
