import 'package:flutter/material.dart';

class ListEmployee extends StatelessWidget {
  const ListEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    double mediaQueryWidth = MediaQuery.of(context).size.width;
    return
        // Container(
        //     margin: EdgeInsets.only(left: (0.25 * mediaQueryWidth), top: 20.0),
        //     child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        //       Container(child: Text("data 1")),
        //       Container(child: Text("data 1")),
        //       Container(child: Text("data 1")),
        //       Container(child: Text("data 1")),
        //       Container(child: Text("data 1")),
        //     ]));

        Container(
            margin: EdgeInsets.only(left: (0.25 * mediaQueryWidth), top: 20.0),
            child: employeeStatefull());
  }

  Widget employeeState() {
    return Container(
        child: Row(children: const [
      Text("data 1"),
      Text("data 1"),
      Text("data 1"),
      Text("data 1"),
      Text("data 1"),
    ]));
  }

  Widget employeeStatefull() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Container(
        //   decoration: const BoxDecoration(
        //       image: DecorationImage(
        //           image: AssetImage(
        //             "assets/images/im1.jpg",
        //           ),
        //           fit: BoxFit.cover)),
        // ),
        ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 80.0, maxWidth: 70),
            child: Image.asset("assets/images/im1.jpg")),
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(child: Text("data 1")),
            Container(child: Text("data 1")),
            Container(child: Text("data 1")),
            Container(child: Text("data 1")),
            Container(child: Text("data 1")),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(child: Text("data 1")),
            Container(child: Text("data 1")),
            Container(child: Text("data 1")),
          ])
        ]),
      ],
    );
  }
}
