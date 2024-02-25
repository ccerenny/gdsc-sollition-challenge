import 'package:flutter/material.dart';
import 'package:gdsc_sollition_project/screens/forgetPwScreen.dart';
import 'package:gdsc_sollition_project/screens/introScreen.dart';
import 'package:gdsc_sollition_project/service/auth.firebase.dart';

import '../const/colors.dart';
import '../screens/signUpScreen.dart';
import '../utils/helper.dart';
import '../widgets/customTextInput.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/loginScreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FirebaseService firebaseService = FirebaseService();
  FocusNode focusNode = FocusNode();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 30,
            ),
            child: Column(
              children: [
                Text(
                  "Login",
                  style: Helper.getTheme(context).headline6,
                ),
                const Spacer(),
                const Text('Add your details to login'),
                const Spacer(),
                CustomTextInput(
                  hintText: "Your email",
                  controller: emailController,
                ),
                const Spacer(),
                CustomTextInput(
                  hintText: "Password",
                  controller: passwordController,
                  focusNode: focusNode,
                ),
                const Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      firebaseService
                          .signIn(emailController.text, passwordController.text)
                          .then((value) {
                        return Navigator.of(context)
                            .pushReplacementNamed(IntroScreen.routeName);
                      });
                    },
                    child: const Text("Login"),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(ForgetPwScreen.routeName);
                  },
                  child: const Text("Forget your password?"),
                ),
                const Spacer(
                  flex: 2,
                ),
                const Text("or Login With"),
                const Spacer(
                  flex: 2,
                ),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xFF367FC0),
                      ),
                      child: Image.asset(
                        Helper.getAssetName(
                          "fb.png",
                          "virtual",
                        ),
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xFFDD4B39),
                      ),
                      child: Image.asset(
                        Helper.getAssetName(
                          "google.png",
                          "virtual",
                        ),
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColor.orange,
                      ),
                      child: const Icon(
                        Icons.apple,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 3,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(SignUpScreen.routeName);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an Account?"),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          color: AppColor.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
