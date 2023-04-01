import 'EmployeeSoft.dart';
import 'package:flutter/material.dart';

class EmpBoxfirst extends StatelessWidget {
  const EmpBoxfirst({super.key});

  @override
  Widget build(BuildContext context) {
    double mediaQueryWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: (0.25 * mediaQueryWidth), top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 40.0,
            width: 40.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/BackDraw1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(child: Text("Matricule")),
          Container(child: Text("Nom et Prénoms")),
          Container(child: Text("Date de naissance")),
          Container(child: Text("Categorie")),
        ],
      ),
    );
  }
}
