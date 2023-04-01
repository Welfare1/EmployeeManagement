import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  String idem;
  IconData icon;
  String option;
  bool selected;
  final navState;
  NavBarItem(
      {super.key,
      required this.idem,
      required this.icon,
      required this.option,
      required this.selected,
      required this.navState});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  right: 10.0, left: 10.0, bottom: 4.0, top: 4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: selected
                    ? Colors.black
                    : Color.fromARGB(255, 242, 240, 240).withOpacity(0.5),
                // gradient: LinearGradient(
                //   colors: selected
                //       ? [
                //           Colors.black,
                //           Colors.black,
                //         ]
                //       : [
                //           Color.fromARGB(255, 242, 241, 241),
                //           Color.fromARGB(255, 242, 241, 241),
                //           Color.fromARGB(255, 244, 243, 243)
                //         ],
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                // ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CircleAvatar(
                      backgroundColor:
                          selected ? Colors.white : Colors.transparent,
                      child: Icon(
                        icon,
                        color: Colors.black,
                      )),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(option,
                      style: TextStyle(
                          color: selected ? Colors.white : Colors.black))
                ],
              ),
            ),
          ],
        ),
        onTap: () {
          navState;
        },
      ),
    );
  }
}

// (String idem, IconData icon, String option, bool selected) 

// setState(() {
//             if (idem == "01") {
//               currentPage = SelectedOption.personnel;
//             }
//             if (idem == "02") {
//               currentPage = SelectedOption.taches;
//             }
//             if (idem == "03") {
//               currentPage = SelectedOption.dashboard;
//             }
//             if (idem == "04") {
//               currentPage = SelectedOption.parametre;
//             }
//           }