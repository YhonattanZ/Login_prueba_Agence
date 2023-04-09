import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prueba_agence_br/src/common/constants.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({super.key, required this.width, required this.image});

  final double width;

  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'detail');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
            width: width,
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: Image.asset(image)),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 12),
                            blurRadius: 15,
                            color: kTerciaryColor.withOpacity(0.45))
                      ]),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Product\n',
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: kSecondaryColor,
                                  fontWeight: FontWeight.w600)),
                          TextSpan(
                              text: 'Anime Poster',
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: kSecondaryColor,
                                  fontWeight: FontWeight.w600)),
                        ])),
                        const Spacer(),
                      ]),
                )
              ],
            )),
      ),
    );
  }
}
