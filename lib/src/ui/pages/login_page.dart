import 'package:flutter/material.dart';
import 'package:prueba_agence_br/src/common/constants.dart';
import 'dart:math' as math;

import 'package:prueba_agence_br/src/widgets/login/center_widget.dart';

import '../../widgets/login/login_info.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
            child: SizedBox(
          height: size.height,
          child: Stack(children: [
            Positioned(top: -200, left: -60, child: topShape(size.width)),
            Positioned(bottom: -180, left: -40, child: bottomShape(size.width)),
            CenterShape(size: size),
            const LoginInfo(),
          ]),
        )));
  }

  Widget topShape(double width) {
    return Transform.rotate(
      angle: -35 * math.pi / 180,
      child: Container(
        width: 1.2 * width,
        height: 1.2 * width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            gradient: const LinearGradient(
                begin: Alignment(-0.2, -0.8),
                end: Alignment.bottomCenter,
                colors: [kPrimaryColor, kSecondaryColor])),
      ),
    );
  }

  Widget bottomShape(double width) {
    return Container(
      width: 1.5 * width,
      height: 1.5 * width,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: const Alignment(0.6, -1.1),
              end: const Alignment(0.7, 0.8),
              colors: [
                kSecondaryColor.withOpacity(0.2),
                kTerciaryColor.withOpacity(0.6)
              ])),
    );
  }
}
