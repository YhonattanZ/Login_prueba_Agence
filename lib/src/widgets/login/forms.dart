import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpForms extends StatelessWidget {
  SignUpForms({
    Key? key,
    required this.autofocus,
    this.focusNode,
    this.controller,
    this.lines,
    this.onTap,
    this.suffixIcon,
    required this.obstext,
    required this.formTitle,
    required this.formIcon,
    required this.keyboardType,
  }) : super(key: key);

  final String formTitle;

  final Widget? suffixIcon;
  final Icon formIcon;
  final TextInputType keyboardType;
  bool? obstext;
  final int? lines;

  final TextEditingController? controller;
  final bool autofocus;
  final FocusNode? focusNode;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.10, vertical: size.height * 0.015),
      child: Material(
        elevation: 8,
        shadowColor: Colors.black26,
        color: Colors.transparent,
        child: TextField(
          onTap: onTap,
          focusNode: focusNode,
          autofocus: autofocus,
          maxLines: lines,
          controller: controller,
          scrollPhysics: const BouncingScrollPhysics(),
          obscureText: obstext!,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            errorStyle: const TextStyle(color: Colors.red),
            labelStyle: GoogleFonts.lato(color: Colors.black),
            hintText: formTitle,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: formIcon,
          ),
        ),
      ),
    );
  }
}
