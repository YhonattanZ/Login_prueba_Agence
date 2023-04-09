import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prueba_agence_br/src/common/constants.dart';
import 'package:prueba_agence_br/src/ui/components/alert_dialog.dart';

class CardInfoProduct extends StatelessWidget {
  const CardInfoProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height / 2.75,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3))
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            children: [
              _productInfo(context),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                child: _buyPoster(context, size),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buyPoster(BuildContext context, Size size) {
    return SizedBox(
        height: size.height * 0.06,
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () {
              showAlertDialog(context);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: kSecondaryColor,
                shadowColor: kTerciaryColor,
                elevation: 10,
                shape: const StadiumBorder()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Buy this poster',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(fontSize: 25)),
                const Icon(Icons.shopping_cart_outlined, size: 25)
              ],
            )));
  }

  Widget _productInfo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _imageClient(),
          const SizedBox(width: 15),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Poster Anime',
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  )),
              SizedBox(
                height: size.height * 0.14,
                width: size.width * 0.4,
                child: Text(
                  'Power (パワー, Pawā) era la Mujer Demonio Sangre (血ちの魔ま人じん, Chi no majin) y una Cazadora de Demonios de Seguridad Pública',
                  style: GoogleFonts.lato(
                      color: kSecondaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _imageClient() {
    return SizedBox(
      height: 150,
      width: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: const FadeInImage(
          image: AssetImage('assets/images/power.jpg'),
          fit: BoxFit.cover,
          fadeInDuration: Duration(milliseconds: 50),
          placeholder: AssetImage('assets/images/power.jpg'),
        ),
      ),
    );
  }
}
