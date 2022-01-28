import 'package:flutter/material.dart';
import 'package:to_do_list/pages/home.dart';
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primaryColor: Colors.pink
  ),
  home: const Home(),
));


