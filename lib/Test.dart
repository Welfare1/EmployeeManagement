// // Je laisse cela à titre de conservation de la tentative de de MENU bart

// import 'package:employeemanagement/Items/EmployeeBox.dart';
// import 'package:employeemanagement/Items/EmployeeState.dart';
import 'package:flutter/material.dart';
// import "Items/NavBarMenu.dart";
// import 'Items/EmployeeCard.dart';
// import 'Items/EMPloyeeCardPro.dart';
// import 'Items/EmployeeSoft.dart';
// import 'Items/EmployeeTable.dart';
// import 'Items/NavBarItem.dart';
import 'Items/Dashboard.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final emply = Emply.EmplyList();
//   //Inital list of Employee controller
//   final employees = Employee.employeeList();

// // Controller variables
//   final nomController = TextEditingController();
//   final prenomsController = TextEditingController();
//   final dateController = TextEditingController();
//   final categorieController = TextEditingController();
//   final habitationController = TextEditingController();

// // final list
//   //List<Employee> finalList = [];
//   List<Employee> finalList = Employee.employeeList();

//   int indexStart = 10;
//   var currentPage = SelectedOption.personnel;
//   @override
//   Widget build(BuildContext context) {
//     double mediaQueryWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       // backgroundColor: createGradientSwatch(),
//       body: ConstrainedBox(
//         constraints: BoxConstraints(minHeight: 900.0),
//         child: Container(
//           padding: const EdgeInsets.all(8.0),
//           decoration: const BoxDecoration(
//               gradient: LinearGradient(
//             colors: [
//               Color.fromARGB(255, 255, 242, 255),
//               Color.fromARGB(255, 241, 208, 239),
//               Color.fromARGB(255, 237, 236, 236),
//               Color.fromARGB(255, 225, 224, 224),
//               //Color.fromARGB(255, 226, 224, 224),
//               Color.fromARGB(255, 206, 206, 206)
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.topRight,
//           )),
//           child: SingleChildScrollView(
//               child: Column(
//             children: [
//               Container(
//                 margin:
//                     EdgeInsets.only(left: (0.2 * mediaQueryWidth), top: 40.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     NavBarItem(
//                       idem: "01",
//                       icon: Icons.manage_accounts,
//                       option: "Gestion du personnel",
//                       selected: (currentPage == SelectedOption.personnel)
//                           ? true
//                           : false,
//                       navState: onTapNavBar(SelectedOption.personnel),
//                     ),
//                     NavBarItem(
//                       idem: "02",
//                       icon: Icons.manage_accounts,
//                       option: "Gestion des tâches",
//                       selected:
//                           (currentPage == SelectedOption.taches) ? true : false,
//                       navState: onTapNavBar(SelectedOption.taches),
//                     ),
//                     NavBarItem(
//                       idem: "03",
//                       icon: Icons.manage_accounts,
//                       option: "Dashboard",
//                       selected: (currentPage == SelectedOption.dashboard)
//                           ? true
//                           : false,
//                       navState: onTapNavBar(SelectedOption.dashboard),
//                     ),
//                     NavBarItem(
//                         idem: "04",
//                         icon: Icons.manage_accounts,
//                         option: "Paramètre",
//                         selected: (currentPage == SelectedOption.parametre)
//                             ? true
//                             : false,
//                         navState: testPrint(SelectedOption.parametre)),
//                   ],
//                 ),
//               ),
//               EmployeeMenu(context)
//             ],
//           )),
//         ),
//       ),
//     );
//   }

//   Widget EmployeeMenu(BuildContext context) {
//     double mediaQueryWidth = MediaQuery.of(context).size.width;
//     return Column(
//       children: [
//         Container(
//           margin: EdgeInsets.only(left: (0.2 * mediaQueryWidth), top: 40.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               ConstrainedBox(
//                 constraints:
//                     const BoxConstraints(maxWidth: 250.0, maxHeight: 40.0),
//                 child: Container(
//                   //padding: const EdgeInsets.all(5.0),
//                   child: TextField(
//                     decoration: InputDecoration(
//                         hintText: "Rechercher un employé",
//                         icon: const Icon(Icons.search),
//                         //suffix: const Icon(Icons.search),
//                         //contentPadding: const EdgeInsets.all(5.0),
//                         alignLabelWithHint: true,
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(40.0))),
//                     onChanged: (value) => runFliter(value),
//                   ),
//                 ),
//               ),
//               Row(
//                 children: [
//                   EmployeeCardPro(
//                     emply: emply[0],
//                     onHover: _switchOnHover,
//                     onTap: () {},
//                   ),
//                   EmployeeCardPro(
//                     emply: emply[1],
//                     onHover: _switchOnHover,
//                     onTap: () {},
//                   ),
//                   EmployeeCardPro(
//                     emply: emply[2],
//                     onHover: _switchOnHover,
//                     onTap: () {
//                       addedBox();
//                       print("Ajouter");
//                     },
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//         EmployeeTable(employee: finalList)
//       ],
//     );
//     //EmpBoxfirst(),
//   }

//   _switchOnHover(Emply emply) {
//     setState(() {
//       // print(emply.isOnHove.toString());
//       emply.isOnHove = !emply.isOnHove;
//       emply.icolor = emply.isOnHove
//           ? emply.icolor.withOpacity(0.65)
//           : emply.icolor.withOpacity(1.0);
//     });
//   }

//   addedBox() {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             scrollable: true,
//             title: Text('Ajouter un employé'),
//             content: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Form(
//                 child: Column(
//                   children: <Widget>[
//                     ConstrainedBox(
//                       constraints: const BoxConstraints(
//                           minWidth:
//                               300.0), // we must adjust for responsive capacity
//                       child: TextFormField(
//                         controller: nomController,
//                         decoration: InputDecoration(
//                           labelText: 'Nom',
//                           border: OutlineInputBorder(),
//                           icon: Icon(Icons.account_box),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 6.0,
//                     ),
//                     TextFormField(
//                       controller: prenomsController,
//                       decoration: InputDecoration(
//                         labelText: 'Prénoms',
//                         border: OutlineInputBorder(),
//                         icon: Icon(Icons.email),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 6.0,
//                     ),
//                     TextField(
//                       controller: dateController,
//                       decoration: InputDecoration(
//                         labelText: 'Date de naissance (jj/mm/aaaa)',
//                         border: OutlineInputBorder(),
//                         icon: Icon(Icons.message),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 6.0,
//                     ),
//                     TextFormField(
//                       controller: categorieController,
//                       decoration: InputDecoration(
//                         labelText: 'Catégorie',
//                         icon: Icon(Icons.message),
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 6.0,
//                     ),
//                     TextFormField(
//                       controller: habitationController,
//                       decoration: InputDecoration(
//                         labelText: "Lieu d'habitation",
//                         icon: Icon(Icons.message),
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             actions: [
//               ElevatedButton(child: Text("Annuler"), onPressed: () {}),
//               ElevatedButton(
//                   child: Text("Soumettre"),
//                   onPressed: () {
//                     addEmployee();
//                     print("Nom : ");
//                   }),
//             ],
//           );
//         });
//   }

//   addEmployee() {
//     setState(() {
//       employees.add(Employee(
//           Matricule: "0${indexStart++}",
//           Nom: nomController.text,
//           Prenom: prenomsController.text,
//           Date_Naissance: dateController.text,
//           Categorie: categorieController.text,
//           Lieu_habitation: habitationController.text));
//       print("Nom :${nomController.text} ");
//       nomController.clear();
//       prenomsController.clear();
//       dateController.clear();
//       categorieController.clear();
//       habitationController.clear();
//     });
//   }

//   runFliter(String keyWordEntry) {
//     List<Employee> result = [];
//     if (keyWordEntry.isEmpty) {
//       result = employees;
//     } else {
//       result = employees
//           .where((item) =>
//               item.Nom.toLowerCase().contains(keyWordEntry.toLowerCase()))
//           .toList();
//     }
//     setState(() {
//       finalList = result;
//     });
//   }

//   onTapNavBar(SelectedOption option) {
//     setState(() {
//       currentPage = option;
//     });
//   }

//   testPrint(SelectedOption enu) {
//     print(currentPage == enu);
//   }
// }

class TestChart extends StatelessWidget {
  const TestChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("test"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: PageView(
          children: [
            LineChartWidget(),
          ],
        ),
      ),
    );
  }
}
