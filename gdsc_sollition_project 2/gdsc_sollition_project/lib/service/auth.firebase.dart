import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<User?> signIn(String email, String password) async {
    var user =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return user.user;
  }

  signOut() async {
    return auth.signOut();
  }

  String? getCurrrentUID() {
    return auth.currentUser?.uid;
  }

  Future<User?> createUser(
    BuildContext context,
    String userName,
    String email,
    String password,
    String confirmPassword,
  ) async {
    try {
      var user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await firestore.collection("Person").doc(user.user?.uid).set({
        "userName": userName,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword
      });
      return user.user;
    } catch (e) {
      // Handle specific Firebase Authentication exceptions
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.orange,
              content: Text('The email address is already in use.'),
              duration: Duration(seconds: 2),
            ),
          );
          // You can handle this case according to your application's logic
        } else {
          print('Error creating user: ${e.message}');
        }
      } else {
        print('Unexpected error: $e');
      }
      return null; // Return null or handle the error in your application
    }
  }

  Future<void> saveUserToSharedPreference(String uid) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('userUID', uid);
  }

  Future<String?> getUserFromSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('userUID');
  }

  
}
