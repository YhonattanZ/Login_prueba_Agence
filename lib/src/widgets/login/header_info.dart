import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prueba_agence_br/src/common/constants.dart';

class HeaderInfo extends StatelessWidget {
  // final Screens screen;

  // const HeaderInfo({Key? key, required this.screen}) : super(key: key);
  const HeaderInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      // screen == Screens.signIn ? 'Inicia\nSesion' : 'Registrate',
      'Inicia\nSesion',
      style: GoogleFonts.lato(
          fontSize: 35, fontWeight: FontWeight.w500, color: kBackgroundColor),
    );
  }
}
