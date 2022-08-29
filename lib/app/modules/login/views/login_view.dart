import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_sixteen/auth_controller.dart';
import '../../signup/views/signup_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
   LoginView({Key? key}) : super(key: key);
   
   final LoginController logincontroller = Get.put(LoginController());
  // final AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/wp5602244-firewatch-cellphone-wallpapers.png'),
        fit: BoxFit.cover,),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 350,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.transparent
                  ),
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
                  'Login into your account',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller:logincontroller.loginemailcontroller,
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
                  TextField(
                    controller:logincontroller.loginpasswordcontroller,
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
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot password ?',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                 const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      onPressed: ()  {
                      AuthController.instance.login(
                        logincontroller.loginemailcontroller.text,
                         logincontroller.loginpasswordcontroller.text,
                         );
                      // if(res == false){
                      //   Get.snackbar(
                      //     "About User",
                      //     "User message",
                      //     backgroundColor: Colors.red,
                      //     snackPosition: SnackPosition.BOTTOM,
                      //     titleText: const Text(
                      //       "Enter valid email and password",
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
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange[700],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.080,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account ?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to( SignupView());
                          AuthController.instance.emailcontroller.clear();
                          AuthController.instance.passwordcontroller.clear();
                          AuthController.instance.confirmpasswordcontroller.clear();


                        },
                        child: const Text(
                          'Create',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
