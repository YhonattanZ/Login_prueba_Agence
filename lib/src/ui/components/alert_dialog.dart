import 'package:flutter/material.dart';
import 'package:prueba_agence_br/src/common/constants.dart';

void showAlertDialog(BuildContext context) {
  Widget noButton = ElevatedButton(
    style: ElevatedButton.styleFrom(
        backgroundColor: kSecondaryColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)))),
    onPressed: () {
      Navigator.pop(context);
    },
    child: const Text('No'),
  );
  Widget yesButton = ElevatedButton(
    style: ElevatedButton.styleFrom(
        backgroundColor: kSecondaryColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)))),
    onPressed: () {
      Navigator.pushNamed(context, 'home');
    },
    child: const Text('Yes'),
  );

  AlertDialog alertDialog = AlertDialog(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
    title: const Text('You want to confirm the purchase?'),
    actions: [noButton, yesButton],
  );

  showDialog(
    context: context,
    builder: (context) {
      return alertDialog;
    },
  );
}
