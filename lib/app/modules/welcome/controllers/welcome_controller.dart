import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:week_sixteen/app/modules/welcome/custom/usermodel/user_model.dart';

class WelcomeController extends GetxController {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String? image;

  final namecontroller = TextEditingController();
  final numbercontroller = TextEditingController();
  final workcontroller = TextEditingController();
  final agecontroller = TextEditingController();

  String? vaidateName(String name) {
    if (name.isEmpty) {
      return "Name can not be empty";
    }
    return null;
  }

  String? validateNumber(String number) {
    if (number.isEmpty) {
      return "Number can not be empty";
    }
    return null;
  }

  String? validateWork(String work) {
    if (work.isEmpty) {
      return "Work can not be empty";
    }
    return null;
  }

  String? validateAge(String age) {
    if (age.isEmpty) {
      return "Age can not be empty";
    }
    return null;
  }

  void fullValidation() async {
    if (formkey.currentState!.validate() == false) {
      return;
    } else {
      createUserdetails(
          namecontroller.text.trim(),
          numbercontroller.text.trim(),
          workcontroller.text.trim(),
          agecontroller.text.trim(),
          image);
      Get.back();
    }
  }

  //********************* ADD USER DATA TO FIREBASE ************************//
  Future createUserdetails(name, number, work, age, image) async {
    final documentUser = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.email.toString())
        .doc();

    final user = UserModel(
        id: documentUser.id,
        name: name,
        number: number,
        work: work,
        age: age,
        image: image);

    final jasonData = user.tojason();

    await documentUser.set(jasonData);
    
    namecontroller.clear();
    numbercontroller.clear();
    workcontroller.clear();
    agecontroller.clear();
    
  }
  

  //***************************** GET USER DATA FROM FIREBASE *************************//
  Stream<List<UserModel>> readUserdata() {
    return FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.email.toString())
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => UserModel.fromJason(doc.data()))
            .toList());
  }

  // ***************************** PUT IMAGE FROM GALLARY *****************************//
  pickimage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img == null) {
      return;
    } else {
      final byte = File(img.path).readAsBytesSync();
      update();
      image = base64Encode(byte) ;
    }
  }

  //*******************************DELETE  USER FROM FIREBASE ********************************//
  deleteUser(UserModel user)async {
    final documentuser = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.email.toString())
        .doc(user.id);
        await documentuser.delete();
        Get.back();
  }
}
