import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/Sqflite/sqldb.dart';
import 'package:notes_app/wedigets/custom_app_bar.dart';
import 'package:notes_app/screens/show%20Note%20page.dart';
import '../controller/home_page controller.dart';
import '../theme/theme services.dart';
import '../wedigets/add_message_bottom_field.dart';
import '../wedigets/notes_item.dart';
import 'Edit page.dart';

class HomePage extends StatelessWidget {
 final SqlDb sqlDb = SqlDb();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetX<HomePageController>(
            init: HomePageController(),
            builder: (bodyController) {
              bodyController.getTasks();
              return Column(
                children: [
                  appBarItem(
                    function: () {
                      ThemeService().switchTheme();
                    },
                    icon: Icons.brightness_4_outlined,
                    title: "NOTES",
                  ),
                  bodyController.taskList.isEmpty
                      ? Expanded(
                          child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'HAY',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'ADD THE NOTES',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              )
                            ],
                          ),
                        ))
                      : Expanded(
                          child: ListView.builder(
                              itemCount: bodyController.taskList.value.length,
                              itemBuilder: (context, i) {
                                return NotesItem(
                                    editItemOnPressed: () {
                                      Get.to(EditNote1(), arguments: {
                                        'id': bodyController.taskList[i]['id'],
                                        'title': bodyController.taskList[i]
                                            ['title'],
                                        'note': bodyController.taskList[i]
                                            ['note'],
                                        'date': bodyController.taskList[i]
                                            ['date'],
                                      });
                                    },
                                    onTap: () {
                                      Get.to(ShowNote(), arguments: {
                                        'id': bodyController.taskList[i]['id'],
                                        'title': bodyController.taskList[i]
                                            ['title'],
                                        'note': bodyController.taskList[i]
                                            ['note'],
                                        'date': bodyController.taskList[i]
                                            ['date'],
                                      });
                                    },
                                    date: bodyController.taskList[i]['date'],
                                    title: bodyController.taskList[i]['title'],
                                    notes: bodyController.taskList[i]['note'],
                                    deleteFunction: () async {
                                      await sqlDb.deleteData(
                                          'DELETE FROM "notes" WHERE id = ${bodyController.taskList[i]['id']}');
                                      await bodyController.getTasks();
                                    });
                              }),
                        )
                ],
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            AddMessageBottomField(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
