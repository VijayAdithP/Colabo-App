import 'package:colabomobileapp/Constants/colors.dart';
import 'package:colabomobileapp/Pages/Auth%20Screen/AuthScreen.dart';
// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(ProviderScope(
      child:

          // DevicePreview(builder: (context) {
          //   return

          const MainClass()

      // }),
      ));
}

class MainClass extends StatelessWidget {
  const MainClass({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: ConstantColors.scaffoldBackgroundColor,
      ),
      home: const Authscreen(),
    );
  }
}
