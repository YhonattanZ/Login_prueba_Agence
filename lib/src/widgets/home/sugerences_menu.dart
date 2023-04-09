import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prueba_agence_br/src/common/constants.dart';

class SugerencesMenu extends StatelessWidget {
  const SugerencesMenu({
    required this.title,
    super.key,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title,
              style: GoogleFonts.lato(
                  shadows: [
                    Shadow(
                        color: kTerciaryColor.withOpacity(0.5),
                        offset: const Offset(3, 2),
                        blurRadius: 10)
                  ],
                  color: kSecondaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w400)),
          const Spacer(),
          SizedBox(
              height: 30,
              width: 90,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kSecondaryColor,
                      shadowColor: kTerciaryColor,
                      shape: const StadiumBorder()),
                  child: Text('More',
                      textAlign: TextAlign.center, style: GoogleFonts.lato()))),
        ],
      ),
    );
  }
}
