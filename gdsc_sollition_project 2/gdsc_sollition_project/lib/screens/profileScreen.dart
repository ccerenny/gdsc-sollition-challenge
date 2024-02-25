import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_sollition_project/utils/helper.dart';
import 'package:gdsc_sollition_project/const/colors.dart';
import 'package:gdsc_sollition_project/widgets/customNavBar.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = "/profileScreen";

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = '';
  String email = '';
  String password = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> getUserProfileData() async {
    // Kullanıcının oturum açtığından emin olun
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Kullanıcının UID'sini alın
      String userId = user.uid;

      // Firestore bağlantısını oluşturun
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Kullanıcının profili için belge referansı
      DocumentReference userDocRef = firestore.collection("Person").doc(userId);

      try {
        // Belgeyi getirin
        DocumentSnapshot docSnapshot = await userDocRef.get();

        if (docSnapshot.exists) {
          // Belge mevcutsa, kullanıcı verilerini alın
          Map<String, dynamic> userData =
              docSnapshot.data() as Map<String, dynamic>;
          setState(() {
            userName = userData['userName'];
            email = userData['email'];
            password = userData['password'];

            nameController.text = userName;
            emailController.text = email;
            passwordController.text = password;
          });
          // Kullanıcı verilerini kullanın
          print("Kullanıcı Adı: $userName");
          print("E-posta: $email");
          print("Profil Resmi URL'si: $password");
          // ve diğer bilgileri kullan...
        } else {
          print("Kullanıcı belgesi bulunamadı!");
        }
      } catch (e) {
        print("Belge alınırken bir hata oluştu: $e");
      }
    } else {
      print("Oturum açmış bir kullanıcı bulunamadı!");
    }
  }

  @override
  void initState() {
    super.initState();
    getUserProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: SizedBox(
                height: Helper.getScreenHeight(context),
                width: Helper.getScreenWidth(context),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Profile",
                              style: Helper.getTheme(context).headline5,
                            ),
                            Image.asset(
                              Helper.getAssetName("cart.png", "virtual"),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ClipOval(
                          child: Stack(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                child: Image.asset(
                                  Helper.getAssetName(
                                    "images.png",
                                    "real",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  height: 20,
                                  width: 80,
                                  color: Colors.black.withOpacity(0.3),
                                  child: Image.asset(Helper.getAssetName(
                                      "camera.png", "virtual")),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Helper.getAssetName("edit_filled.png", "virtual"),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "Edit Profile",
                              style: TextStyle(color: AppColor.orange),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Hi $userName!",
                          style: Helper.getTheme(context).headline4?.copyWith(
                                color: AppColor.primary,
                              ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("Sign Out"),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomFormImput(
                          label: "Name",
                          value: userName,
                          controller: nameController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomFormImput(
                          label: "Email",
                          value: email,
                          controller: emailController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const CustomFormImput(
                          label: "Address",
                          value: "No 23, 6th Lane, Colombo 03",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomFormImput(
                          label: "Password",
                          value: password,
                          controller: passwordController,
                          isPassword: true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomFormImput(
                          label: "Confirm Password",
                          value: password,
                          controller: passwordController,
                          isPassword: true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text("Save"),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(
              profile: true,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomFormImput extends StatefulWidget {
  const CustomFormImput({
    super.key,
    required String label,
    required String value,
    bool isPassword = false,
    this.controller,
  })  : _label = label,
        value = value,
        _isPassword = isPassword;

  final String _label;
  final String value;
  final bool _isPassword;
  final TextEditingController? controller;

  @override
  State<CustomFormImput> createState() => _CustomFormImputState();
}

class _CustomFormImputState extends State<CustomFormImput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.only(left: 40),
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColor.placeholderBg,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: widget._label,
          contentPadding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
        ),
        controller: widget.controller,
        obscureText: widget._isPassword,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
