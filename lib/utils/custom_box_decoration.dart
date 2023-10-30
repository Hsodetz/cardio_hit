import 'package:flutter/material.dart';

BoxDecoration customBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(20),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.shade300,
      blurRadius: 4,
      offset: const Offset(4, 8), // Shadow position
    ),
  ],
);
