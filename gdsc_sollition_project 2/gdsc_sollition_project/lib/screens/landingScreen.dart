import 'package:flutter/material.dart';
import 'package:gdsc_sollition_project/screens/loginScreen.dart';
import 'package:gdsc_sollition_project/screens/signUpScreen.dart';

import '../const/colors.dart';
import '../utils/helper.dart';

class LandingScreen extends StatelessWidget {
  static const routeName = "/landingScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.placeholder,
                      offset: Offset(0, 15),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Container(
                  width: double.infinity,
                  height: Helper.getScreenHeight(context) * 0.5,
                  decoration: ShapeDecoration(
                    color: AppColor.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Image.asset(
                    Helper.getAssetName("login_bg.png", "virtual"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 140,
              left: 0,
              right: 0,
              child: Image.asset(
                Helper.getAssetName("logo-new.png", "real"),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: Helper.getScreenHeight(context) * 0.3,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                margin: const EdgeInsets.only(bottom: 45),
                child: Column(
                  children: [
                    const Text(
                      "NeighMeal Every Plate Tells a Story, Every Moment a Flavor!",
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(LoginScreen.routeName);
                        },
                        child: const Text("Login"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          foregroundColor:
                              MaterialStateProperty.all(AppColor.orange),
                          shape: MaterialStateProperty.all(
                            const StadiumBorder(
                              side: BorderSide(
                                  color: AppColor.orange, width: 1.5),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(SignUpScreen.routeName);
                        },
                        child: const Text("Create an Account"),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomClipperAppBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset controlPoint = Offset(size.width * 0.24, size.height);
    Offset endPoint = Offset(size.width * 0.25, size.height * 0.96);
    Offset controlPoint2 = Offset(size.width * 0.3, size.height * 0.78);
    Offset endPoint2 = Offset(size.width * 0.5, size.height * 0.78);
    Offset controlPoint3 = Offset(size.width * 0.7, size.height * 0.78);
    Offset endPoint3 = Offset(size.width * 0.75, size.height * 0.96);
    Offset controlPoint4 = Offset(size.width * 0.76, size.height);
    Offset endPoint4 = Offset(size.width * 0.79, size.height);
    Path path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width * 0.21, size.height)
      ..quadraticBezierTo(
        controlPoint.dx,
        controlPoint.dy,
        endPoint.dx,
        endPoint.dy,
      )
      ..quadraticBezierTo(
        controlPoint2.dx,
        controlPoint2.dy,
        endPoint2.dx,
        endPoint2.dy,
      )
      ..quadraticBezierTo(
        controlPoint3.dx,
        controlPoint3.dy,
        endPoint3.dx,
        endPoint3.dy,
      )
      ..quadraticBezierTo(
        controlPoint4.dx,
        controlPoint4.dy,
        endPoint4.dx,
        endPoint4.dy,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
