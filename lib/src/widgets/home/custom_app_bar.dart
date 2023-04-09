import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prueba_agence_br/src/widgets/home/search_bar.dart';

import '../../common/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return PreferredSize(
      preferredSize: Size.fromHeight(height / 6),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [kTerciaryColor, kSecondaryColor]),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: height * 0.07),
                  child: SearchBar())
            ],
          ),
        ),
        title: Text(
          'Welcome back!',
          style: GoogleFonts.lato(
              fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
    );
  }
}
