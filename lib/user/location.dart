import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class location extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        title: Text("Location",style: TextStyle(fontSize: 25),),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[

            Container(
              width: 400,
              height: 500,
              child: GoogleMap(
                onMapCreated: (controller){

                },
                initialCameraPosition: CameraPosition(
                  target:LatLng(30.1, 30.7),
                  zoom:8,
                ),

                markers: {
                  Marker(markerId: MarkerId('1'),
                    position: LatLng(40.2, 40.2),
                    icon:BitmapDescriptor.defaultMarker,
                    infoWindow: InfoWindow(
                      title: 'we are here',
                      snippet: 'BabyGarden',
                    ),
                  ),

                  Marker(markerId: MarkerId('2'),
                    position: LatLng(50.2, 50.2),
                    icon:BitmapDescriptor.defaultMarker,
                    infoWindow: InfoWindow(
                      title: 'we are here',
                      snippet: 'BabyGarden',
                    ),
                  ),
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}