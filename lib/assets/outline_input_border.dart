import 'package:flutter/material.dart';

OutlineInputBorder myInputborder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    borderSide: BorderSide(
      color: Colors.redAccent,
      width: 3,
    ),
  );
}

OutlineInputBorder myFocusborder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    borderSide: BorderSide(
      color: Colors.redAccent,
      width: 3,
    ),
  );
}

TextStyle labelStyleText() {
  return TextStyle(
    color: Colors.white,
  );
}
