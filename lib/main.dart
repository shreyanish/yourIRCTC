import 'package:flutter/material.dart';
import 'package:yourirctc/views/home.dart';
import 'package:yourirctc/views/search_form2.dart';
import 'package:yourirctc/views/widgets/train_card.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'your IRCTC',
      debugShowCheckedModeBanner: false,
      home: SearchForm()
    );
  }
}



