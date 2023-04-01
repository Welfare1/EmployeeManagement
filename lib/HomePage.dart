import 'package:employeemanagement/Items/Dashboard.dart';
import 'package:employeemanagement/Items/EmployeeBox.dart';
import 'package:employeemanagement/Items/EmployeeState.dart';
import 'package:flutter/material.dart';
import "Items/NavBarMenu.dart";
import 'Items/EmployeeCard.dart';
import 'Items/EMPloyeeCardPro.dart';
import 'Items/EmployeeSoft.dart';
import 'Items/EmployeeTable.dart';
import 'Items/NavBarItem.dart';
import 'Items/TaskEmployee.dart';
import 'Items/TaskTable.dart';
import 'Items/OnlinePanel.dart';
import 'Items/OnlinePanel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final emply = Emply.EmplyList();
  //Inital list of Employee controller
  final employees = Employee.employeeList();

  //Initial list of taks
  List<Tasks> tasks = Tasks.taksList();

// Controller variables
  final nomController = TextEditingController();
  final prenomsController = TextEditingController();
  final dateController = TextEditingController();
  final categorieController = TextEditingController();
  final habitationController = TextEditingController();

// final list
  //List<Employee> finalList = [];
  List<Employee> finalList = Employee.employeeList();

  int indexStart = 10;
  var currentPage = SelectedOption.personnel;
  @override
  Widget build(BuildContext context) {
    var body;
    if (currentPage == SelectedOption.personnel) {
      body = EmployeeMenu(context);
    } else if (currentPage == SelectedOption.taches) {
      body = TaksTable(taks: tasks);
    } else if (currentPage == SelectedOption.dashboard) {
      body = Dashoboard();
    } else {
      body = const Center(
        child: Text("Dashboard"),
      );
    }

    // For dimension
    double mediaQueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: createGradientSwatch(),
      body: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 900.0),
        child: Container(
          padding: const EdgeInsets.all(2.0),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 242, 255),
              Color.fromARGB(255, 241, 208, 239),
              Color.fromARGB(255, 237, 236, 236),
              Color.fromARGB(255, 225, 224, 224),
              //Color.fromARGB(255, 226, 224, 224),
              Color.fromARGB(255, 206, 206, 206)
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          )),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(left: (0.2 * mediaQueryWidth), top: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NavBarItem(
                        "01",
                        Icons.manage_accounts,
                        "Gestionnaire du personnel",
                        currentPage == SelectedOption.personnel ? true : false),
                    NavBarItem("02", Icons.task, "Gestion des tâches",
                        currentPage == SelectedOption.taches ? true : false),
                    NavBarItem("03", Icons.dashboard, "Dashboard",
                        currentPage == SelectedOption.dashboard ? true : false),
                    NavBarItem("04", Icons.settings, "Paramètre",
                        currentPage == SelectedOption.parametre ? true : false),
                  ],
                ),
              ),
              // OnlinePanel(),
              body
            ],
          )),
        ),
      ),
    );
  }

  Widget EmployeeMenu(BuildContext context) {
    double mediaQueryWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          //
          margin: EdgeInsets.only(left: (0.2 * mediaQueryWidth), top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ConstrainedBox(
                constraints:
                    const BoxConstraints(maxWidth: 250.0, maxHeight: 40.0),
                child: Container(
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Rechercher un employé",
                        hintStyle: TextStyle(fontSize: 11.0),
                        icon: const Icon(Icons.search),
                        fillColor: Color.fromARGB(255, 165, 165, 165),
                        // suffix: const Icon(Icons.search),
                        // prefixIcon: const Icon(Icons.search),
                        contentPadding: EdgeInsets.only(left: 20),
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0))),
                    onChanged: (value) => runFliter(value),
                  ),
                ),
              ),
              Row(
                children: [
                  EmployeeCardPro(
                    emply: emply[0],
                    onHover: _switchOnHover,
                    onTap: () {},
                  ),
                  EmployeeCardPro(
                    emply: emply[1],
                    onHover: _switchOnHover,
                    onTap: () {},
                  ),
                  EmployeeCardPro(
                    emply: emply[2],
                    onHover: _switchOnHover,
                    onTap: () {
                      addedBox();
                      print("Ajouter");
                    },
                  )
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [OnlinePanel(), EmployeeTable(employee: finalList)],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
        )
      ],
    );
    //EmpBoxfirst(),
  }

  _switchOnHover(Emply emply) {
    setState(() {
      // print(emply.isOnHove.toString());
      emply.isOnHove = !emply.isOnHove;
      emply.icolor = emply.isOnHove
          ? emply.icolor.withOpacity(0.65)
          : emply.icolor.withOpacity(1.0);
    });
  }

  addedBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text('Ajouter un employé', style: TextStyle(fontSize: 15)),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                          minWidth:
                              300.0), // we must adjust for responsive capacity
                      child: TextFormField(
                        controller: nomController,
                        decoration: InputDecoration(
                          labelText: 'Nom',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          icon: Icon(Icons.person),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    TextFormField(
                      controller: prenomsController,
                      decoration: InputDecoration(
                        labelText: 'Prénoms',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        icon: Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    TextField(
                      controller: dateController,
                      decoration: InputDecoration(
                        labelText: 'Date de naissance (jj/mm/aaaa)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        icon: Icon(Icons.calendar_today),
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    TextFormField(
                      controller: categorieController,
                      decoration: InputDecoration(
                        labelText: 'Catégorie',
                        icon: Icon(Icons.category),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    TextFormField(
                      controller: habitationController,
                      decoration: InputDecoration(
                        labelText: "Lieu d'habitation",
                        icon: Icon(Icons.location_on),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                  child: Text("Annuler"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              ElevatedButton(
                  child: Text("Ajouter"),
                  onPressed: () {
                    if (dateController.text == "" ||
                        nomController.text == "" ||
                        prenomsController.text == "" ||
                        categorieController.text == "" ||
                        habitationController.text == "") {
                      print("Faute");
                    } else {
                      addEmployee();
                      Navigator.of(context).pop();
                    }
                  }),
            ],
          );
        });
  }

  addEmployee() {
    setState(() {
      finalList.add(Employee(
          Matricule: "0${indexStart++}",
          Nom: nomController.text,
          Prenom: prenomsController.text,
          Date_Naissance: dateController.text,
          Categorie: categorieController.text,
          Lieu_habitation: habitationController.text,
          path: ""));
      print("Nom :${nomController.text} ");
      nomController.clear();
      prenomsController.clear();
      dateController.clear();
      categorieController.clear();
      habitationController.clear();
    });
  }

  runFliter(String keyWordEntry) {
    List<Employee> result = [];
    if (keyWordEntry.isEmpty) {
      result = employees;
    } else {
      result = employees
          .where((item) =>
              item.Nom.toLowerCase().contains(keyWordEntry.toLowerCase()))
          .toList();
    }
    setState(() {
      finalList = result;
    });
  }

  onTapNavBar(SelectedOption option) {
    setState(() {
      currentPage = option;
    });
  }

  testPrint(SelectedOption enu) {
    print(currentPage == enu);
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
