import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mapping_app/screen/map_screen/map_screen.dart';
import 'package:mapping_app/view_model/splash_view_model.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
       create: (context) => SplashViewModel(),
       builder: (context,child) {
        return Scaffold(
          body: Consumer<SplashViewModel>(
            builder: ((context, splashViewModel, child) {
               WidgetsBinding.instance.addPostFrameCallback(
                (timeStamp) { 
                  if(splashViewModel.latlong != null){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => 
                    MapScreen(latLong: splashViewModel.latlong!,),
                    ));
                  }
                });
              return  Center(
                child: Text("Splash Screen"));
            })),
        );
       
         
       },
    );
  }
}