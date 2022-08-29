import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_sixteen/app/modules/welcome/controllers/welcome_controller.dart';
import 'package:week_sixteen/app/modules/welcome/custom%20user%20edit%20save%20/user_update.dart';
import 'package:week_sixteen/app/modules/welcome/custom%20user%20edit%20save%20/user_update_controller.dart';
import 'package:week_sixteen/app/modules/welcome/custom/usermodel/user_model.dart';

Widget userbuild(UserModel userobj) {
  final WelcomeController welcomecontroller = Get.find<WelcomeController>();
  final UserUpdateController userupdate = Get.put(UserUpdateController());
  return GestureDetector(
    onTap: () {
      Get.to(
        UserUpdate(
          user: userobj,
        ),
      );
      userupdate.changeTextfield(
        name: userobj.name,
        number: userobj.number,
        work: userobj.work,
        age: userobj.age,
      );
    },
    child: Card(
      color: Colors.black,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(height: 10,width: 10,),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: MemoryImage(Base64Decoder().convert(userobj.image.toString())),
                ),
                
                // Container(
                //   height: 100,
                //   width: 100,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(200),
                //     image: DecorationImage(image: MemoryImage(Base64Decoder().convert(userobj.image.toString()))
                //   ),
                // ),
                // ),
                
              // CircleAvatar(
              //         radius: 30,
              //         backgroundImage: MemoryImage(
              //           Base64Decoder().convert(userobj.image.toString()),
              //         ),
              //       ),
                 
               
                 SizedBox(
                  width: 15,
                ),
                Text(
                  userobj.name!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
               
                
                
               
               
               
                
            ],
            ),
            SizedBox(height: 10,),
            Container(height: 1,width: double.infinity, decoration: BoxDecoration(color: Colors.grey),),
            SizedBox(height: 10,),
             Text(userobj.number!,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
             SizedBox(height: 10,),
             Container(height: 1,width: double.infinity, decoration: BoxDecoration(color: Colors.grey),),
             SizedBox(height: 10,),
             Text(userobj.work!,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
             SizedBox(height: 10,),
             Container(height: 1,width: double.infinity, decoration: BoxDecoration(color: Colors.grey),),
             SizedBox(height: 10,),
              
                Text(userobj.age!,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    GestureDetector(
                  onTap: (() {
                    welcomecontroller.deleteUser(userobj);
                    
                  }),
                  child: Icon(
                    Icons.delete,
                    size: 20,
                    color: Colors.red,
                  ),
                ),
                  ],
                 )
          ],
        ),
      ),
    ),
  );
}
