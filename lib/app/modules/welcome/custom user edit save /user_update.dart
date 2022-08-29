import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_sixteen/app/modules/welcome/controllers/welcome_controller.dart';
import 'package:week_sixteen/app/modules/welcome/custom%20user%20edit%20save%20/user_update_controller.dart';
import 'package:week_sixteen/app/modules/welcome/custom/usermodel/user_model.dart';

class UserUpdate extends GetView<WelcomeController> {
   UserUpdate({Key? key,required this.user}) : super(key: key);

   UserModel user;

  final UserUpdateController  userupdatecontroller = Get.put(UserUpdateController());
  final WelcomeController welcomecontroller = Get.find<WelcomeController>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 75, 197, 150),
      body: Center(
        
        child: Container(
          height: 500,
          width: 300,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(10),
            ),
          ),
          
          child: ListView(
            children: [
              const SizedBox(height: 20,),
              Form(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,),
                  child: Column(
                    children: [
                      welcomecontroller.image == null
                          ? GestureDetector(
                              onTap: () => welcomecontroller.pickimage(),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/man-person-setting-icon-with-png-and-vector-format-for-free-20857.png',
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : GetBuilder<WelcomeController>(
                              init: welcomecontroller,
                              builder: (controller) {
                                return Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    // borderRadius: BorderRadius.circular(50),
                                    image: DecorationImage(
                                      image: MemoryImage(
                                        Base64Decoder().convert(
                                          controller.image.toString(),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: userupdatecontroller.namecontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          prefixIcon: const Icon(Icons.person),
                          labelText: 'Enter your name',
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                       
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: userupdatecontroller.numbercontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          prefixIcon: const Icon(Icons.phone),
                          labelText: 'Enter your Number',
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: userupdatecontroller.workcontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          prefixIcon: const Icon(Icons.work),
                          labelText: 'Enter your Work',
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: userupdatecontroller.agecontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          prefixIcon: const Icon(Icons.date_range),
                          labelText: 'Enter your Age',
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                     
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 75, 197, 150)),
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          onPressed: () {
                            userupdatecontroller.updateUser(user);
                            Get.back();
                          },
                          child: const Text(
                            'SAVE',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
