import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapping_app/data/api/api_service.dart';
import 'package:mapping_app/data/geocoding/geocoding.dart';
import 'package:mapping_app/data/models/lat_long.dart';
import 'package:mapping_app/data/repositories/geociding_repository.dart';
import 'package:mapping_app/view_model/map_view_model.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  final LatLong latLong;
  const MapScreen({super.key, required this.latLong});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
       create: (context) => MapViewModel(geocodingRepo: GeocodingRepo(apiService: ApiService())),
       builder: (context, child) {
         return Scaffold(
          appBar: AppBar(
            title: Text('Map ${widget.latLong.lattiitude},${widget.latLong.longitude}'),
          ),
          body: Consumer<MapViewModel>(
            builder: (context, viewModel, child) {
             return Center(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(children: [
                  Text(
                        "Map Screen:${viewModel.addressText}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                        ),
                      ),
                    ElevatedButton(
                        onPressed: () {
                          context.read<MapViewModel>().fetchAddress(
                              latLong: widget.latLong, kind: "house");
                        },
                        child: Text("Map"),
                      ),
                    Expanded(child: GoogleMap(
                      mapType: MapType.satellite,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(widget.latLong.lattiitude,widget.latLong.longitude),
                        zoom: 19),
                      onMapCreated:(controller) {
                        
                      },
                    ))
                ]),
              ),
             );

          },),
         );
       },
    );
  }
}