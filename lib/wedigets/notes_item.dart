import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({
    super.key,
    required this.title,
    required this.notes,
    required this.date,
    required this.editItemOnPressed,
    required this.deleteFunction,
    required this.onTap,
  });

  final String title;
  final String notes;
  final String date;
  final Function()? editItemOnPressed;
  final Function()? deleteFunction;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                  trailing: IconButton(
                      onPressed: editItemOnPressed,
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 35,
                      )),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
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
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: deleteFunction,
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
