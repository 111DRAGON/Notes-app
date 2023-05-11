import 'package:flutter/material.dart';
import 'package:get/get.dart';

notesItem(
    {required String title,
    required String notes,
    required String date,
      required Function()? function2,
    required Function()? function,
    required Function()? function1}) {
  return GestureDetector(
    onTap: function1,
    child: Padding(
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
        child: Container(
          width: double.infinity,
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
                : const Color.fromRGBO(38, 103, 138, 1.0),
            // color: Color.fromRGBO(38, 103, 138, 1.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  trailing:  IconButton(
                      onPressed: function2,
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 35,
                      )),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(title,
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),

                  subtitle: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(notes,
                        maxLines: 4,
                        style: const TextStyle(
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                ),
               Row(
                 children: [
                   Expanded(
                     child: Text(
                       date,
                       style: const TextStyle(fontSize: 15, color: Colors.white),
                     ),
                   ),
                   const SizedBox(width: 10,),
                   IconButton(
                       onPressed: function,
                       icon: const Icon(
                         Icons.delete,
                         color: Colors.white,
                         size: 35,
                       )),
                   const SizedBox(width: 15,),
                 ],
               )
              ],
            ),
          ),
        )),
  );
}

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

Widget defaultFormField(
    {double radius = 16,
    bool isClickable = true,
    Function()? onTap,
    required TextEditingController controller,
    required TextInputType type,
    String? Function(String?)? validator,
    required String labelText,
    required IconData PrefixIcon,
    int maxLines = 1,
    IconData? suffixIcon,
    bool obscure = false}) {
  return TextFormField(
    enabled: isClickable,
    maxLines: maxLines,
    decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
        prefixIcon: Icon(PrefixIcon),
        suffixIcon: Icon(suffixIcon),
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: 18,
          color: Get.isDarkMode
              ? const Color.fromRGBO(253, 253, 253, 1.0)
              : const Color.fromRGBO(1, 29, 33, 1.0),
          fontWeight: FontWeight.bold,
        )),
    controller: controller,
    keyboardType: type,
    obscureText: obscure,
    validator: validator,
    onTap: onTap,
  );
}

defaultButton({
  double radius = 10,
  required String text,
  required Color color,
  required Function()? function,
}) {
  return GestureDetector(
    onTap: function,
    child: Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      height: 50,
      width: double.infinity,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
    ),
  );

  MaterialColor myColor = const MaterialColor(0xff26688B, <int, Color>{
    50: Color.fromARGB(255, 38, 104, 139),
    100: Color.fromARGB(255, 38, 104, 139),
    200: Color.fromARGB(255, 38, 104, 139),
    300: Color.fromARGB(255, 38, 104, 139),
    400: Color.fromARGB(255, 38, 104, 139),
    500: Color.fromARGB(255, 38, 104, 139),
    600: Color.fromARGB(255, 38, 104, 139),
    700: Color.fromARGB(255, 38, 104, 139),
    800: Color.fromARGB(255, 38, 104, 139),
    900: Color.fromARGB(255, 38, 104, 139),
  });
}

MaterialColor myColor = const MaterialColor(0xff26688B, <int, Color>{
  50: Color.fromARGB(255, 38, 104, 139),
  100: Color.fromARGB(255, 38, 104, 139),
  200: Color.fromARGB(255, 38, 104, 139),
  300: Color.fromARGB(255, 38, 104, 139),
  400: Color.fromARGB(255, 38, 104, 139),
  500: Color.fromARGB(255, 38, 104, 139),
  600: Color.fromARGB(255, 38, 104, 139),
  700: Color.fromARGB(255, 38, 104, 139),
  800: Color.fromARGB(255, 38, 104, 139),
  900: Color.fromARGB(255, 38, 104, 139),
});
