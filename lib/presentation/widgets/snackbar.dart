import 'package:flutter/material.dart';

// ignore: unused_element
showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      
      SnackBar(
        
        backgroundColor: Colors.grey.shade900,
        content: Text(message, style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),),
        duration: Duration(seconds: 2),
        padding: EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }