import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_sixteen/app/modules/login/views/login_view.dart';
import 'package:week_sixteen/app/modules/welcome/views/welcome_view.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var confirmpasswordcontroller = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginView());
    } else {
      emailcontroller.clear();
      passwordcontroller.clear();
      Get.offAll(() => WelcomeView(email: user.email!));
    }
  }

  register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
          

    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "About User",
        "User message",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          e.message.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        messageText: const Text(
          '',
        ),
      );
    }
  }

  Future login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About Login",
        "Login message",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Login failed",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        messageText: const Text(
          '',
        ),
      );
    }
  }

  void fullRegisterValidate() {
    if (formkey.currentState!.validate() == false) {
      return;
    } else {
      register(
        emailcontroller.text,
        passwordcontroller.text,
      );
    }
  }

   logout() async {
    await auth.signOut();
  }
}
