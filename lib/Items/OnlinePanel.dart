import 'package:flutter/material.dart';
import 'TaskEmployee.dart';
import 'EmployeeSoft.dart';

class OnlinePanel extends StatelessWidget {
  const OnlinePanel({super.key});

  @override
  Widget build(BuildContext context) {
    // final list
    //List<Employee> finalList = [];
    List<Employee> finalList = Employee.employeeList();

    // For dimension
    double mediaQueryWidth = MediaQuery.of(context).size.width;
    return Container(
      // margin: EdgeInsets.only(
      //     right: mediaQueryWidth - (0.2 * mediaQueryWidth), top: 40.0),
      margin: EdgeInsets.only(left: 20.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),

      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "Employés connectés",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                margin: EdgeInsets.only(bottom: 10.0),
                padding: EdgeInsets.all(8.0),
              ),
              for (Employee emply in finalList)
                ListPrototype("${emply.Nom} ${emply.Prenom}", "${emply.online}",
                    emply.path, emply.online),
            ],
            mainAxisSize: MainAxisSize.min),
      ),
    );
  }

  Widget ListPrototype(String name, String statut, path, bool online) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 200.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.withOpacity(.1), width: 0.5)),
        child: ListTile(
          leading: onlinePick(path, online),
          title: Text(
            name,
            style: TextStyle(fontSize: 11.0),
          ),
          shape: RoundedRectangleBorder(),
          subtitle: online
              ? Text("En ligne", style: TextStyle(fontSize: 9.0))
              : Text("Déconnecté", style: TextStyle(fontSize: 9.0)),
          onTap: () {
            print("ListTile");
          },
        ),
      ),
    );
  }

  Widget onlinePick(path, bool online) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          color: Color.fromARGB(255, 235, 234, 234)),
      padding: EdgeInsets.all(3.0),
      child: CircleAvatar(
        child: Stack(
          children: [
            Container(
              child: Icon(
                Icons.circle,
                color: online ? Colors.green : Colors.red,
                size: 13.0,
              ),
              margin: EdgeInsets.only(top: 25.0, left: 25.0),
            )
          ],
        ),
        backgroundImage: AssetImage(path),
      ),
    );
  }
}
