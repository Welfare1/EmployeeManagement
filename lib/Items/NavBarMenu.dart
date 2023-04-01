import 'package:flutter/material.dart';

class NavBarMenu extends StatefulWidget {
  const NavBarMenu({super.key});

  @override
  State<NavBarMenu> createState() => _NavBarMenuState();
}

class _NavBarMenuState extends State<NavBarMenu> {
  var currentPage = SelectedOption.personnel;
  @override
  Widget build(BuildContext context) {
    double mediaQueryWidth = MediaQuery.of(context).size.width;

    String pop = "abc";
    //double mediaQueryHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(left: (0.2 * mediaQueryWidth), top: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavBarItem("01", Icons.manage_accounts, "Gestionnaire du personnel",
              currentPage == SelectedOption.personnel ? true : false),
          NavBarItem("02", Icons.task, "Gestion des tâches",
              currentPage == SelectedOption.taches ? true : false),
          NavBarItem("03", Icons.dashboard, "Dashboard",
              currentPage == SelectedOption.dashboard ? true : false),
          NavBarItem("04", Icons.settings, "Paramètre",
              currentPage == SelectedOption.parametre ? true : false),
        ],
      ),
    );
  }

  Widget NavBarItem(String idem, IconData icon, String option, bool selected) {
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
          setState(() {
            if (idem == "01") {
              currentPage = SelectedOption.personnel;
            }
            if (idem == "02") {
              currentPage = SelectedOption.taches;
            }
            if (idem == "03") {
              currentPage = SelectedOption.dashboard;
            }
            if (idem == "04") {
              currentPage = SelectedOption.parametre;
            }
          });
        },
      ),
    );
  }
}

enum SelectedOption {
  personnel,
  taches,
  dashboard,
  parametre,
}
