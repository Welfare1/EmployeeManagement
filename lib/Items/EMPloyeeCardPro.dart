import 'package:flutter/material.dart';
import 'EmployeeSoft.dart';

class EmployeeCardPro extends StatelessWidget {
  final Emply emply;
  final onHover;
  final onTap;

  const EmployeeCardPro(
      {super.key,
      required this.emply,
      required this.onHover,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      // onHover: (val) {
      //   setState(() {
      //     icolor = val ? Color.fromARGB(255, 16, 16, 16) : icolor;
      //   });
      // },
      onHover: (val) {
        onHover(emply);
        //print("color:${emply.icolor} et val : $val");
      },
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: emply.icolor,
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          ),
        ),
        child: Row(
          children: [
            Text(
              emply.title,
              style: TextStyle(color: emply.textColor),
            ),
            IconButton(onPressed: () {}, icon: emply.icon),
          ],
        ),
      ),
    );
  }
}
