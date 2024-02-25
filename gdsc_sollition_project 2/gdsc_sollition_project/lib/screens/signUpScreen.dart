import 'package:flutter/material.dart';
import 'package:gdsc_sollition_project/service/auth.firebase.dart';
import '../const/colors.dart';
import '../screens/loginScreen.dart';
import '../utils/helper.dart';
import '../widgets/customTextInput.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signUpScreen';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confPasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  FirebaseService firebaseService = FirebaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: Helper.getScreenWidth(context),
      height: Helper.getScreenHeight(context),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Column(
            children: [
              Text(
                "Sign Up",
                style: Helper.getTheme(context).headline6,
              ),
              const Spacer(),
              const Text(
                "Add your details to sign up",
              ),
              const Spacer(),
              CustomTextInput(
                hintText: "User name",
                controller: userNameController,
              ),
              const Spacer(),
              CustomTextInput(
                hintText: "Email",
                controller: emailController,
              ),
              // const Spacer(),
              // const CustomTextInput(hintText: "Mobile No"),
              // const Spacer(),
              // const CustomTextInput(hintText: "Address"),
              const Spacer(),
              CustomTextInput(
                hintText: "Password",
                controller: passwordController,
              ),
              const Spacer(),
              CustomTextInput(
                hintText: "Confirm Password",
                controller: confPasswordController,
              ),
              const Spacer(),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    firebaseService.createUser(
                      context,
                      userNameController.text,
                      emailController.text,
                      passwordController.text,
                      confPasswordController.text,
                    );
                  },
                  child: const Text("Sign Up"),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(LoginScreen.routeName);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an Account?"),
                    Text(
                      "Login",
                      style: TextStyle(
                        color: AppColor.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
