import 'package:flutter/material.dart';

import 'package:prueba_agence_br/src/widgets/home/drawer.dart';
import 'package:animate_do/animate_do.dart';
import '../../widgets/home/card_product.dart';
import '../../widgets/home/custom_app_bar.dart';
import '../../widgets/home/sugerences_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> products = List.generate(
      10,
      (index) =>
          const CardProduct(width: 40, image: 'assets/images/chifuyu2.jpg'));
  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      drawer: const DrawerMenu(),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(height / 6),
          child: const CustomAppBar()),
      body: Stack(children: [
        Column(children: [
          const SugerencesMenu(
            title: 'Trending',
          ),
          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: products.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return FadeIn(
                  delay: Duration(milliseconds: (500 + (200 * (index + 2)))),
                  child: CardProduct(
                      width: width * 0.40, image: 'assets/images/chifuyu2.jpg'),
                );
              },
            ),
          ),
          const SugerencesMenu(title: 'Recommended for you'),
          Expanded(
            flex: 4,
            child: ListView.builder(
              itemCount: products.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return FadeIn(
                  delay: Duration(milliseconds: (1000 + (200 * (index + 2)))),
                  child: CardProduct(
                      width: width * 0.40, image: 'assets/images/power.jpg'),
                );
              },
            ),
          ),
        ]),
      ]),
    );
  }
}
