import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_sixteen/app/modules/welcome/controllers/welcome_controller.dart';

class CustomSnackbar extends GetView<WelcomeController> {
  CustomSnackbar({Key? key}) : super(key: key);

  // final WelcomeController welcomecontroller = Get.find();
  final WelcomeController welcomeController = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          height: 550,
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
              const SizedBox(
                height: 20,
              ),
              Form(
                key: welcomeController.formkey,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Column(
                    children: [
                      welcomeController.image == null
                          ? GestureDetector(
                              onTap: () => welcomeController.pickimage(),
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
                              init: welcomeController,
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
                        controller: welcomeController.namecontroller,
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
                        validator: (namevalue) {
                          return welcomeController.vaidateName(namevalue!);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: welcomeController.numbercontroller,
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
                        validator: (numbervalue) {
                          return welcomeController.validateNumber(numbervalue!);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: welcomeController.workcontroller,
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
                        validator: (workvalue) {
                          return welcomeController.validateWork(workvalue!);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: welcomeController.agecontroller,
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
                        validator: (agevalue) {
                          return welcomeController.validateAge(agevalue!);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.black,),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          onPressed: () {
                            welcomeController.fullValidation();
                            
                          },
                          child: const Text(
                            'CREATE',
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
