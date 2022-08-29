import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_sixteen/auth_controller.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  SignupView({Key? key}) : super(key: key);

  final AuthController authcontroller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/wp5388725-4k-iphone-amoled-wallpapers.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                Container(
                  height: 350,
                  color: Colors.transparent,
                ),
                const Text(
                  'Hello',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Create your account',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: authcontroller.formkey,
                  child: Column(
                  children: [
                    TextFormField(
                  controller: AuthController.instance.emailcontroller,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    hintText: 'your email',
                    hintStyle: const TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: AuthController.instance.passwordcontroller,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    hintText: 'password',
                    hintStyle: const TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  validator: (value) {
                    if(AuthController.instance.passwordcontroller.text != value){
                      return 'Missmatch password';
                    }
                  },
                  controller: AuthController.instance.confirmpasswordcontroller,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    hintText: 'Confirm Password',
                    hintStyle: const TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                  ],
                ),),
                 SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    onPressed: () {
                      AuthController.instance.fullRegisterValidate();
                      // if (response == false) {
                      //   Get.snackbar(
                      //     "About User",
                      //     "User message",
                      //     backgroundColor: Colors.red,
                      //     snackPosition: SnackPosition.BOTTOM,
                      //     titleText: const Text(
                      //       "Account creation failed",
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.bold,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //     messageText: const Text(
                      //       '',
                      //       style: TextStyle(
                      //         fontSize: 0,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   );
                      // }
                      //  Get.to( LoginView());
                    },
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Sign up with Google',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                ),
                Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
