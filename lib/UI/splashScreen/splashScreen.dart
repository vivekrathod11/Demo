import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nike/UI/homeUI/homePage.dart';
import 'package:get/get.dart';
import 'package:nike/controllers/apiController.dart';
import 'package:nike/utils/appColors.dart';
import 'package:nike/utils/appFonts.dart';







class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  ApiController apiController = Get.put(ApiController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiController.fetchShoes();
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const MyHomePage()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        color:  AppColors.primaryColor,
        child: const Center(
          child: Text(
            "NIKEYBOOTS",
            style: TextStyle(
              color: AppColors.whiteColor,
              fontFamily: AppFonts.primaryFont,
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}

