import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controller/home_page%20controller.dart';
import 'package:notes_app/models/models.dart';

class ShowNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     var args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBarItem(
              function: () {
                Get.back();
              },
              icon: Icons.check,
              title: args['title'].toString(),),
            Padding(
              padding: const EdgeInsets.only(right: 20,left: 20,bottom: 20),
              child: Text(args['date'].toString(),
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    args['note'].toString(),
                    style: const TextStyle(fontSize: 35),
                  ),
                ),
              ),),
          ],
        ),
      ),
    );
  }
}
