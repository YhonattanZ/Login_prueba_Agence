import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prueba_agence_br/src/common/constants.dart';
import 'package:prueba_agence_br/src/widgets/login/divider.dart';
import 'package:prueba_agence_br/src/widgets/login/forms.dart';
import 'package:prueba_agence_br/src/widgets/login/header_info.dart';

import 'package:prueba_agence_br/src/widgets/login/login_fb_google.dart';

// enum Screens {
//   createAccount,
//   signIn,
// }

class LoginInfo extends StatelessWidget {
  const LoginInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        const Positioned(
            // top: 160, left: 30, child: HeaderInfo(screen: currentScreen)
            top: 160,
            left: 30,
            child: HeaderInfo()),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.40),
          child: Stack(
            children: [
              Column(
                children: [
                  SignUpForms(
                      autofocus: false,
                      obstext: false,
                      formTitle: 'Usuario',
                      formIcon:
                          const Icon(Icons.person, color: kSecondaryColor),
                      keyboardType: TextInputType.text),
                  SignUpForms(
                      autofocus: false,
                      obstext: false,
                      formTitle: 'Clave',
                      formIcon: const Icon(Icons.lock, color: kSecondaryColor),
                      keyboardType: TextInputType.text),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: SizedBox(
                      height: size.height * 0.07,
                      width: size.width * 0.6,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kSecondaryColor,
                          shape: const StadiumBorder(),
                        ),
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  const OrDivider(),
                  const LoginFbGoogle(),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
