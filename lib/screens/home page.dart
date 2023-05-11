import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/Sqflite/sqldb.dart';
import 'package:notes_app/models/models.dart';
import 'package:notes_app/screens/show%20Note%20page.dart';
import '../controller/home_page controller.dart';
import '../theme/theme services.dart';
import 'Edit page.dart';

class HomePage extends StatelessWidget {
  SqlDb sqlDb = SqlDb();

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
                      title: "NOTES"),
                  bodyController.taskList.isEmpty
                      ? Expanded(
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'A7A',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 40),
                              ),
                              SizedBox(height: 20,),
                              Text(
                                'ADD THE FUCKEN NOTES',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30),
                              )

                            ],
                        ),
                          ))
                      : Expanded(
                          child: ListView.builder(
                              itemCount: bodyController.taskList.value.length,
                              itemBuilder: (context, i) {
                                bodyController.i = i;
                                return notesItem(
                                    function2: () {
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
                                    function1: () {
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
                                    function: () async {
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
          Get.bottomSheet(GetX<HomePageController>(
              init: HomePageController(),
              builder: (controller) {
                return SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Get.isDarkMode
                                ? const Color.fromRGBO(59, 59, 59, 1.0)
                                : const Color.fromRGBO(188, 188, 188, 1.0),
                            offset: const Offset(5, 5))
                      ],
                      borderRadius: BorderRadius.circular(16),
                      color: Get.isDarkMode
                          ? const Color.fromRGBO(49, 49, 49, 1)
                          : const Color.fromRGBO(249, 249, 249, 1.0),
                      // color: Color.fromRGBO(38, 103, 138, 1.0),
                    ),
                    height: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(children: [
                        defaultFormField(
                            radius: 10,
                            controller: controller.titleController.value,
                            type: TextInputType.text,
                            labelText: "Title",
                            PrefixIcon: Icons.title),
                        const SizedBox(
                          height: 10,
                        ),
                        defaultFormField(
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse("9999-11-11"),
                              ).then((value) {
                                controller.dateController.value.text =
                                    DateFormat("EEEE/ dd , MM , yyyy")
                                        .format(value!);
                              });
                            },
                            radius: 10,
                            controller: controller.dateController.value,
                            type: TextInputType.datetime,
                            labelText: "Date",
                            PrefixIcon: CupertinoIcons.clock_fill),
                        const SizedBox(
                          height: 10,
                        ),
                        defaultFormField(
                            radius: 10,
                            maxLines: 5,
                            controller: controller.textController.value,
                            type: TextInputType.text,
                            labelText: "Content",
                            PrefixIcon: Icons.file_copy),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultButton(
                            text: "ADD",
                            color: Colors.black.withOpacity(.5),
                            function: () async {
                              if (controller
                                      .dateController.value.text.isEmpty ||
                                  controller
                                      .titleController.value.text.isEmpty ||
                                  controller
                                      .textController.value.text.isEmpty) {
                                Get.snackbar(
                                  'Warning',
                                  'the title and content and date can\'t be null',
                                  icon: const Icon(
                                    Icons.warning,
                                    color: Colors.red,
                                  ),
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              } else {
                                int response = await sqlDb.insertData(
                                    'INSERT INTO "notes" ("title","note","date") VALUES ("${controller.titleController.value.text}","${controller.textController.value.text}","${controller.dateController.value.text}")');
                                controller.titleController.value.clear();
                                controller.dateController.value.clear();
                                controller.textController.value.clear();
                                Get.back();

                                print(
                                    '++++++++++++++$response+++++++++++++++++++++');
                                await controller.getTasks();
                                print(
                                    '++++++++++++${controller.taskList.value}');
                              }
                            })
                      ]),
                    ),
                  ),
                );
              }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
