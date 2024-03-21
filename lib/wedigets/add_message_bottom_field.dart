import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../Sqflite/sqldb.dart';
import '../controller/home_page controller.dart';
import 'custom_app_bar.dart';
import 'default_button.dart';
import 'default_form_field.dart';

class AddMessageBottomField extends StatelessWidget {
  const AddMessageBottomField({super.key});

  @override
  Widget build(BuildContext context) {
    SqlDb sqlDb = SqlDb();
    return GetX<HomePageController>(
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
                DefaultFormField(
                    radius: 10,
                    controller: controller.titleController.value,
                    type: TextInputType.text,
                    labelText: "Title",
                    PrefixIcon: Icons.title),
                const SizedBox(
                  height: 10,
                ),
                DefaultFormField(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.parse("9999-11-11"),
                      ).then((value) {
                        controller.dateController.value.text =
                            DateFormat("EEEE/ dd , MM , yyyy").format(value!);
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
                DefaultFormField(
                    radius: 10,
                    maxLines: 5,
                    controller: controller.textController.value,
                    type: TextInputType.text,
                    labelText: "Content",
                    PrefixIcon: Icons.file_copy),
                const SizedBox(
                  height: 20,
                ),
                DefaultButton(
                    text: "ADD",
                    color: Colors.black.withOpacity(.5),
                    function: () async {
                      if (controller.dateController.value.text.isEmpty ||
                          controller.titleController.value.text.isEmpty ||
                          controller.textController.value.text.isEmpty) {
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
                        await controller.getTasks();
                      }
                    },)
              ],),
            ),
          ),
        );
      },
    );
  }
}
