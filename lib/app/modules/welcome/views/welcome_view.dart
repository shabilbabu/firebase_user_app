import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_sixteen/app/modules/welcome/controllers/welcome_controller.dart';
import 'package:week_sixteen/app/modules/welcome/custom/usermodel/user_model.dart';
import 'package:week_sixteen/auth_controller.dart';
import '../custom/container for add user/custom_container.dart';
import '../custom_card/custom_card.dart';

class WelcomeView extends GetView<AuthController> {
  WelcomeView({Key? key, this.email = ''}) : super(key: key);
  String email;

  final WelcomeController welcomecontroller = Get.put(WelcomeController());
  // final AuthController authcontroller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
       
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: 400,
                decoration: const BoxDecoration(
                  
                    image: DecorationImage(
                        image:
                            AssetImage('assets/welcome-removebg-preview.png'))),
              ),
              Container(
                height: 35,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black,
                ),
                child: Center(child: Text(email,style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 20,),)),
              ),
              SizedBox(height: 20,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(CustomSnackbar());
                    },
                    child: Container(
                      height: 35,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add_box_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            'Add User',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(AuthController.instance.logout());
                    },
                    child: Container(
                      height: 35,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:const [
                          Icon(Icons.logout,color: Colors.white,),
                          Text('Logout' ,style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
             const SizedBox(height: 30,),
              StreamBuilder<List<UserModel>>(
                stream: welcomecontroller.readUserdata(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong ${snapshot.error}');
                  } else if (snapshot.data!.isEmpty) {
                    return const Center(
                      
                      child: Image(image: AssetImage('assets/page-not-found-3936853-3277293.webp')),
                    );
                  } else if (snapshot.hasData) {
                    final userdata = snapshot.data;
          
                    return GridView(
                      physics: ScrollPhysics(),
                      
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        mainAxisExtent: 200,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      shrinkWrap: true,
                      primary: false,
                      children: userdata!.map(userbuild).toList(),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
        
      ),
    );
  }
}
