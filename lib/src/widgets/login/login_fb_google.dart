import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prueba_agence_br/src/network/services/fb_login_services.dart';

class LoginFbGoogle extends StatefulWidget {
  const LoginFbGoogle({super.key});

  @override
  State<LoginFbGoogle> createState() => _LoginFbGoogleState();
}

class _LoginFbGoogleState extends State<LoginFbGoogle> {
  @override
  void initState() {
    super.initState();
    FbLogin().ifUserIsLoggedIn(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
              height: size.height * 0.060,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.white),
                  onPressed: () {
                    FbLogin().login(context);
                  },
                  child: const Icon(
                    FontAwesomeIcons.facebookF,
                    color: Color.fromRGBO(59, 89, 152, 1),
                    size: 30,
                  ))),
          SizedBox(
              height: size.height * 0.060,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.white),
                  onPressed: () {},
                  child: const Icon(
                    FontAwesomeIcons.google,
                    color: Colors.red,
                    size: 30,
                  ))),
        ]));
  }
}
