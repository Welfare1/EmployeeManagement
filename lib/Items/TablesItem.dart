import 'package:flutter/material.dart';

class TableDropButton extends StatefulWidget {
  const TableDropButton({super.key});

  @override
  State<TableDropButton> createState() => _TableDropButtonState();
}

class _TableDropButtonState extends State<TableDropButton> {
  dynamic chooseValue = "En cours";
  List<String> itemList = ["En cours", "Effectué", "Annuler"];
  Color containerColor = Colors.white.withOpacity(0.0);
  Color textColor = Colors.black;
  bool enableState = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: containerColor),
      child: DropdownButton(
        underline: SizedBox(),
        hint: const Text(
          "En cours",
        ),
        focusColor: Colors.white.withOpacity(0.0),
        style: TextStyle(color: textColor),
        value: chooseValue,
        dropdownColor: Colors.white,
        //icon: const Icon(Icons.arrow_drop_down),
        onChanged: (newValue) {
          setState(() {
            chooseValue = newValue;
          });
          addedBox();
          _onChangedColor();
        },
        items: itemList.map((item) {
          return DropdownMenuItem(
            value: item,
            enabled: enableState,
            child: Text(
              item,
              style: TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
      ),
    );
  }

  _onChangedColor() {
    setState(() {
      if (chooseValue == "En cours") {
        containerColor = Colors.purple;
        textColor = Colors.white;
      } else if (chooseValue == "Annuler") {
        containerColor = Colors.red;
        textColor = Colors.white;
      } else if (chooseValue == "Effectué") {
        containerColor = Color.fromARGB(255, 29, 159, 33);
        textColor = Colors.white;
      }
    });
  }

  addedBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text('Ajouter un employé'),
            content: Container(
              padding: const EdgeInsets.all(8.0),
              child: Text("Confirmation"),
            ),
            actions: [
              TextButton(
                  child: Text("Annuler"),
                  onPressed: () {
                    setState(() {
                      containerColor = Colors.white;
                      textColor = Colors.black;
                      chooseValue = "En cours";
                    });
                    Navigator.of(context).pop();
                  }),
              TextButton(
                  child: Text("Confirmation"),
                  onPressed: () {
                    setState(() {
                      enableState = (chooseValue != "En cours") ? false : true;
                      if (chooseValue != "En cours") {
                        itemList
                            .removeWhere((element) => element != chooseValue);
                      }
                      Navigator.of(context).pop();
                    });
                  }),
            ],
          );
        });
  }

// FOr cases when we confirm or cancel.
  stateConfirmation(ctx) {
    enableState = false;
    itemList.removeWhere((element) => element != chooseValue);
    Navigator.of(ctx).pop();
  }

  stateCancel(ctx) {
    Navigator.of(ctx).pop();
  }
}
