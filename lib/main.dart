import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_agence_br/src/common/constants.dart';
import 'package:prueba_agence_br/src/ui/pages/pages.dart';

void main() {
  //Añadimos ProviderScope en la raiz de nuestra app para usar Riverpod
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      title: 'Prueba Agence',
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: kPrimaryColor,
      ),
      routes: {
        'login': (context) => const LoginPage(),
        'home': (context) => HomePage(),
        'detail': (context) => const DetailPage(),
        'profile': (context) => const ProfilePage(),
        'settings': (context) => const SettingsPage(),
        'products': (context) => const ProductsPage()
      },
    );
  }
}
