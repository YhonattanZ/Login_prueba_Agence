import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prueba_agence_br/src/common/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: SingleChildScrollView(
          child: TextField(
            autofocus: false,
            decoration: InputDecoration(
              hintText: 'Search a product',
              hintStyle: GoogleFonts.lato(
                  fontSize: 20,
                  color: Colors.black38,
                  fontWeight: FontWeight.w400),
              suffixIcon: const Icon(
                Icons.search,
                color: kSecondaryColor,
                size: 30,
              ),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: kPrimaryColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: kPrimaryColor)),
              contentPadding: const EdgeInsets.all(15),
            ),
          ),
        ),
      ),
    );
  }
}
