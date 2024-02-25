import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gdsc_sollition_project/screens/homeScreen.dart';
import 'package:gdsc_sollition_project/service/auth.firebase.dart';

import './landingScreen.dart';
import '../utils/helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;
  FirebaseService firebaseService = FirebaseService();
  @override
  void initState() {
    super.initState();

    if (mounted) {
      timer = Timer(const Duration(milliseconds: 4000), () async {
        String? userUID = firebaseService.getCurrrentUID();
        print(userUID);
        if (userUID != null) {
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        } else {
          Navigator.of(context).pushReplacementNamed(LandingScreen.routeName);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color(0xFF00BF63),
              child: Image.asset(
                Helper.getAssetName("splashIcon.png", "virtual"),
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                Helper.getAssetName("logo-new.png", "real"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
