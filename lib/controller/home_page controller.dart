import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/Sqflite/sqldb.dart';

class HomePageController extends GetxController {
  SqlDb sqlDb = SqlDb();
  RxList taskList = [].obs;
  getTasks() async {
    List tasks = await sqlDb.readData('SELECT * FROM "notes" ');
    taskList.assignAll(tasks);
  }

  var titleController = TextEditingController().obs;
  var textController = TextEditingController().obs;
  var dateController = TextEditingController().obs;
}
