import 'package:flutter/material.dart';
import 'package:get/get.dart';



appBarItem(
    {required IconData icon,
    required String title,
    required Function()? function}) {
  return Padding(
    padding: const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 10),
    child: Row(
      children: [
        Expanded(
          child: Text(title,
              style:
                  const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        ),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Get.isDarkMode
                      ? const Color.fromRGBO(59, 59, 59, 1.0)
                      : const Color.fromRGBO(188, 188, 188, 1.0),
                  offset: const Offset(5, 5))
            ],
            color: Get.isDarkMode
                ? const Color.fromRGBO(49, 49, 49, 1)
                : const Color.fromRGBO(249, 249, 249, 1.0),
            borderRadius: BorderRadius.circular(18),
          ),
          height: 45,
          width: 45,
          child: IconButton(
            icon: Icon(icon),
            onPressed: function,
          ),
        )
      ],
    ),
  );
}





