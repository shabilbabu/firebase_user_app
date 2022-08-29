import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:week_sixteen/app/modules/welcome/controllers/welcome_controller.dart';
import 'package:week_sixteen/app/modules/welcome/custom/usermodel/user_model.dart';

class UserUpdateController extends GetxController {
  WelcomeController welcome = Get.find<WelcomeController>();



// UserUpdateController(){
//   namecontroller.text = ;
// }

  final WelcomeController welcomecont = Get.find<WelcomeController>();

  final namecontroller = TextEditingController();
  final numbercontroller = TextEditingController();
  final workcontroller = TextEditingController();
  final agecontroller = TextEditingController();

  //********************** UPDATE USER DETAILS FROM FIREBASE ************************//
  updateUser(UserModel user) async {
    final documentuser = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.email.toString())
        .doc(user.id);
    await documentuser.update({
      'name': namecontroller.text.trim(),
      'number': numbercontroller.text.trim(),
      'work': workcontroller.text.trim(),
      'age': agecontroller.text.trim(),
      'image': welcomecont.image
    });
  }

  void changeTextfield({
     required name,
    required number,
    required work,
    required age,
  }) {
    namecontroller.text = name;
    numbercontroller.text = number;
    workcontroller.text = work;
    agecontroller.text = age;
  }
}
