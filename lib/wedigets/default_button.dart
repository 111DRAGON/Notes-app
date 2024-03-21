import 'package:flutter/cupertino.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({super.key, this.radius, required this.text, required this.color, this.function});
 final double? radius ;
   final    String text;
   final    Color color;
  final     Function()? function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius??16),
        ),
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),
          ),
        ),
      ),
    );
  }
}
