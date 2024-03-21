import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/Sqflite/sqldb.dart';
import 'package:notes_app/controller/home_page%20controller.dart';
import 'package:notes_app/wedigets/custom_app_bar.dart';

import '../wedigets/default_form_field.dart';

class EditNote1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SqlDb sqlDb = SqlDb();
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      body: SafeArea(
        child: GetX<HomePageController>(
          init: HomePageController(),
          builder: (bodyController) {
            bodyController.titleController.value.text =
                args['title'].toString();
            bodyController.textController.value.text = args['note'].toString();
            bodyController.dateController.value.text = args['date'].toString();
            return ListView(
              children: [
                appBarItem(
                    icon: Icons.edit,
                    title: 'Edit',
                    function: () async {
                      await sqlDb.updateData(
                          'UPDATE "notes" SET title = "${bodyController.titleController.value.text}",note = "${bodyController.textController.value.text}" WHERE id = ${args['id']}');
                      bodyController.getTasks();
                      bodyController.titleController.value.clear();
                      bodyController.dateController.value.clear();
                      bodyController.textController.value.clear();
                      Get.back();
                    }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultFormField(
                          controller: bodyController.titleController.value,
                          type: TextInputType.text,
                          labelText: 'title',
                          PrefixIcon: Icons.title,),
                      const SizedBox(
                        height: 30,
                      ),
                      DefaultFormField(
                          maxLines: 15,
                          controller: bodyController.textController.value,
                          type: TextInputType.text,
                          labelText: 'note',
                          PrefixIcon: Icons.copy,),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
