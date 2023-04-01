import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'Items/NavBarMenu.dart';
import 'Items/EmployeeTable.dart';
import 'Test.dart';
import 'Items/addEMployee.dart';
import 'package:employeemanagement/HomePage.dart';
import 'Items/OnlinePanel.dart';
import 'LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Management',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reet back to zero; the application
          // is not restarted.
          //primarySwatch: createGradientSwatch(),
          primarySwatch: Colors.blue),
      //home: const HomePage(),
      //home: AddEmployee(),
      // home: OnlinePanel(),
      home: LoginPage(),
    );
  }
}
