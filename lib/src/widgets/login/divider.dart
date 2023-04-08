import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prueba_agence_br/src/common/constants.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 130),
      child: Row(children: [
        Flexible(
            child: Container(
          height: 1,
          color: kSecondaryColor,
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'O',
            style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        Flexible(
            child: Container(
          height: 1,
          color: kSecondaryColor,
        )),
      ]),
    );
  }
}
