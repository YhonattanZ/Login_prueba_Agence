import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prueba_agence_br/src/network/services/google_maps_services.dart';

import 'package:prueba_agence_br/src/widgets/detail/card_info_product.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

@override
void initState() {
  GoogleMapsService().determinePosition();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        SizedBox(height: size.height * 0.64, child: _googleMap()),
        Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              _buttonBack(),
              // _centerMyLocation()
            ]),
            const Spacer(),
            const CardInfoProduct(),
          ],
        )
      ]),
    );
  }

  // Widget _centerMyLocation() {
  //   return GestureDetector(
  //     onTap: () {
  //       GoogleMapsService().determinePosition();
  //     },
  //     child: Container(
  //       alignment: Alignment.topRight,
  //       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
  //       child: Card(
  //         shape: const CircleBorder(),
  //         color: Colors.white,
  //         elevation: 4,
  //         child: Container(
  //           padding: const EdgeInsets.all(10),
  //           child: Icon(
  //             Icons.location_searching_rounded,
  //             color: Colors.grey[600],
  //             size: 25,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buttonBack() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      alignment: Alignment.topLeft,
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 30,
          )),
    );
  }

  Widget _googleMap() {
    return GoogleMap(
      initialCameraPosition: GoogleMapsService().initialPosition,
      mapType: MapType.normal,
      onMapCreated: (GoogleMapController controller) {
        GoogleMapsService().googleMapController.complete(controller);
      },
      myLocationEnabled: true,
    );
  }
}
