import 'package:flutter/material.dart';


showSnackBar(
  BuildContext context,
  String content,
  Color color,
  bool type,
) {
  final snackBar = SnackBar(
    backgroundColor: Colors.transparent,
    padding: const EdgeInsets.all(10),
    content: Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        type? const Icon(
          Icons.done,
          color: Colors.white,
        ):const Icon(
          Icons.error,
          color: Colors.white,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          content,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ]),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}