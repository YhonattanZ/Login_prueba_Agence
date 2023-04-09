import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prueba_agence_br/src/common/constants.dart';
import 'package:prueba_agence_br/src/network/services/fb_login_services.dart';
import 'package:prueba_agence_br/src/network/services/google_signin_services.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(color: kSecondaryColor),
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: CircleAvatar(),
              )),
          ListTile(
            leading: const Icon(Icons.person, color: kSecondaryColor),
            title: Text('Mi perfil',
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w500, fontSize: 16)),
            onTap: () {
              Navigator.pushNamed(context, 'profile');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shopping_bag, color: kSecondaryColor),
            title: Text('Mis productos',
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w500, fontSize: 16)),
            onTap: () {
              Navigator.pushNamed(context, 'products');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings, color: kSecondaryColor),
            title: Text('Configuraciones',
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w500, fontSize: 16)),
            onTap: () {
              Navigator.pushNamed(context, 'settings');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: kSecondaryColor),
            title: Text('Cerrar Sesion',
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w500, fontSize: 16)),
            onTap: () {
              if (GoogleSignInService().isLogged) {
                GoogleSignInService.signOut(context);
              } else {
                FbLogin().logout();
              }
            },
          ),
        ],
      ),
    );
  }
}
