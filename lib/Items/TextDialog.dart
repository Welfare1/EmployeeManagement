import 'dart:async';

import 'package:flutter/material.dart';

Future<T?> showTextDialog<T>(
  BuildContext context, {
  required String title,
  required String value,
}) =>
    showDialog<T>(
      context: context,
      builder: (context) => TextDialogWidget(
        title: title,
        value: value,
      ),
    );

class TextDialogWidget extends StatefulWidget {
  final String title;
  final String value;

  const TextDialogWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  _TextDialogWidgetState createState() => _TextDialogWidgetState();
}

class _TextDialogWidgetState extends State<TextDialogWidget> {
  //For DropButton
  late dynamic chooseValue;
  List<String> itemList = ["En cours", "Effectué", "Annuler"];

  late TextEditingController controller;

  // For submitting
  bool isConfirmed = true;
  bool isDone = false;

  @override
  void initState() {
    super.initState();
    chooseValue = widget.value;
    controller = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text(widget.title),
        titleTextStyle: const TextStyle(
            fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold),
        // content: TextField(
        //   controller: controller,
        //   decoration: InputDecoration(
        //     border: OutlineInputBorder(),
        //   ),
        // ),
        content: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 30.0),
          child: DropdownButton(
            underline: SizedBox(),
            hint: const Text(
              "En cours",
            ),
            focusColor: Colors.white.withOpacity(0.0),
            style: TextStyle(color: Colors.black),
            value: chooseValue,
            dropdownColor: Colors.white,
            //icon: const Icon(Icons.arrow_drop_down),
            onChanged: (newValue) {
              setState(() {
                chooseValue = newValue;
                if (chooseValue == "Effectué") {
                  paidBox(context);
                }
              });
            },
            items: itemList.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(color: Colors.black),
                ),
                enabled: (isDone) ? false : true,
                onTap: () {},
              );
            }).toList(),
          ),
        ),
        actions: [
          TextButton(
            child: Text('Annuler'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text('Valider'),
            onPressed: () {
              print("isDOne:$isDone");
              // Navigator.of(context).pop(chooseValue);
              setState(() {
                if (chooseValue == "Effectué") {
                  itemList.removeWhere((element) => element != chooseValue);
                }
                isConfirmed = true;
              });

              isConfirmed
                  ? Navigator.of(context).pop(chooseValue)
                  : Navigator.of(context).pop();
            },
          ),
        ],
      );

  paidBox(context) {
    return showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            scrollable: true,
            title: Text('Confirmation'),
            content: Container(
              padding: const EdgeInsets.all(8.0),
              child:
                  Text("Vous allez effectuer un paiement \n confirmez-vous ?"),
            ),
            actions: [
              TextButton(
                  child: Text("Annuler"),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  }),
              TextButton(
                  child: Text("Confirmation"),
                  onPressed: () {
                    isDone = true;
                    Navigator.of(ctx).pop();
                    print("isDOne 2 :$isDone");
                  }),
            ],
          );
        });
  }
}
