import 'package:flutter/material.dart';

Widget customButton({
  VoidCallback? onPressed,
  bool? status = false,
  String? text = "Save",
  BuildContext? context,
}) {
  return GestureDetector(
    onTap: status == true ? null : onPressed,
    child: Container(
      height: 48,
      margin: const EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: status == true ? Colors.grey : Colors.deepPurple,
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context!).size.width,
      child: Text(
        status == false ? text! : "Loading...",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
