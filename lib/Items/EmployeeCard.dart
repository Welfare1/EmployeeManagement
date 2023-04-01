import 'package:flutter/material.dart';

class EmployeeCard extends StatefulWidget {
  const EmployeeCard({super.key});

  @override
  State<EmployeeCard> createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard> {
  double testOpacity = 1.0;
  @override
  Widget build(BuildContext context) {
    double mediaQueryWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: (0.25 * mediaQueryWidth), top: 20.0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ConstrainedBox(
              constraints:
                  const BoxConstraints(maxWidth: 300.0, maxHeight: 40.0),
              child: Container(
                //padding: const EdgeInsets.all(5.0),
                child: TextField(
                  decoration: InputDecoration(
                      //icon: const Icon(Icons.search),
                      hintText: "Rechercher un employé",
                      //suffix: const Icon(Icons.search),
                      //contentPadding: const EdgeInsets.all(5.0),
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0))),
                ),
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OverItem(
                    Colors.white,
                    const Icon(
                      Icons.expand_more,
                      color: Colors.grey,
                    ),
                    "Catégorie : Tous",
                    Colors.black,
                    () {}),
                const SizedBox(
                  width: 8.0,
                ),
                OverItem(
                    Colors.white,
                    const Icon(
                      Icons.expand_more,
                      color: Colors.grey,
                    ),
                    "Trier par : Catégorie",
                    Colors.black, () {
                  print("Catégorie");
                }),
                const SizedBox(
                  width: 8.0,
                ),
                OverItem(
                    Colors.purple,
                    const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    "Ajouter Employé",
                    Colors.white,
                    () {})
              ],
            ),
          ],
        )
      ]),
    );
  }

  Widget OverItem(
      Color icolor, Icon icon, String title, Color textColor, onTap) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), color: icolor),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(color: textColor),
            ),
            IconButton(onPressed: () {}, icon: icon),
          ],
        ),
      ),
      onTap: onTap,
      // onHover: (val) {
      //   setState(() {
      //     icolor = val ? Color.fromARGB(255, 16, 16, 16) : icolor;
      //   });
      // },
      onHover: (val) {
        print(val.toString());
      },
    );
  }
}
