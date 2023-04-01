import 'package:flutter/material.dart';
import 'EmployeeSoft.dart';
import 'TaskEmployee.dart';
import 'package:employeemanagement/Items/TablesItem.dart';
import 'Utils.dart';
import 'TextDialog.dart';
import 'OnlinePanel.dart';

class TaksTable extends StatefulWidget {
  List<Tasks> taks;
  TaksTable({super.key, required this.taks});

  @override
  State<TaksTable> createState() => _TaksTableState();
}

class _TaksTableState extends State<TaksTable> {
  // late List<Employee> employee;
  int? sortColumnsIndex;
  bool isAscending = false;

//Call Tasks panel
  final taskPanel = TasksEmply.taskPanel();
  late List<Tasks> taskss;

  // For selected row
  bool isRowSelected = false;

  // Controller variables
  final intituleController = TextEditingController();
  final dateController = TextEditingController();
  final RemunerationController = TextEditingController();
  final DescriptionController = TextEditingController();
  final idEmployeeController = TextEditingController();
  final dateFinController = TextEditingController();
  int indexStart = 10;

  @override
  void initState() {
    super.initState();
    taskss = Tasks.taksList();
  }

  @override
  Widget build(BuildContext context) {
    double mediaQueryWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: (0.2 * mediaQueryWidth), top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TasksPanel(
                    emply: taskPanel[0], onHover: _switchOnHover, onTap: () {}),
                TasksPanel(
                    emply: taskPanel[1],
                    onHover: _switchOnHover,
                    onTap: () {
                      addedBox();
                    }),
                TasksPanel(
                    emply: taskPanel[2], onHover: _switchOnHover, onTap: () {}),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OnlinePanel(),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: mediaQueryWidth - 0.20 * mediaQueryWidth),
                      child: Container(
                        margin: EdgeInsets.only(left: 20.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white,
                        ),
                        child: SingleChildScrollView(
                          child: buildDataTable(),
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  _switchOnHover(TasksEmply emply) {
    setState(() {
      // print(emply.isOnHove.toString());
      emply.isOnHove = !emply.isOnHove;
      emply.icolor = emply.isOnHove
          ? emply.icolor.withOpacity(0.65)
          : emply.icolor.withOpacity(1.0);
    });
  }

  Widget buildDataTable() {
    final columns = [
      "id_Taches",
      "intitule",
      "statut",
      "Matricule_employe",
      "Date de début",
      "Date de fin",
      "description",
      "remuneration",
    ];

    return DataTable(
        sortColumnIndex: sortColumnsIndex,
        sortAscending: isAscending,
        columns: getColumns(columns),
        rows: getRows(widget.taks));
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
          label: Text(
            column,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          onSort: onSort))
      .toList();

  List<DataRow> getRows(List<Tasks> tasks) => tasks.map((Tasks task) {
        final cells = [
          task.Id_Taches,
          task.Intitule,
          task.Statut,
          task.Matricule_employe,
          task.Date,
          task.DateFin,
          task.Description,
          task.Remuneration
        ];

        return DataRow(

            //onSelectChanged: (val) {},
            cells: Utils.modelBuilder(cells, (index, cell) {
          final showEditorIcon = index == 2 && cell.toString() != "Effectué";

          return DataCell(
            getWidget(
                child: Text(
              '$cell',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  color: ('$cell' == "Effectué")
                      ? Colors.green
                      : ('$cell' == "Annuler")
                          ? Colors.red
                          : Colors.black),
            )),
            showEditIcon: showEditorIcon,
            onTap: () {
              switch (index) {
                case 2:
                  editFirstName(task);
                  print("First");
                  break;
              }
            },
          );
        }));
      }).toList();

  Future editFirstName(Tasks editTask) async {
    final statut = await showTextDialog(
      context,
      title: "Mettre à jour le Statut",
      value: editTask.Statut,
    );
    setState(() => widget.taks = widget.taks.map((task) {
          final isEditedTask = task == editTask;
          return isEditedTask ? task.copy(statut: statut) : task;
          // return isEditedTask ? task : task;
        }).toList());
  }

  // List<DataRow> getRows(List<Tasks> rows) => rows
  //     .map((Tasks taks) => DataRow(
  //           cells: [
  //             DataCell(
  //                 getWidget(child: Text("${taks.id_Taches}"), maxWidth: 50.0)),
  //             DataCell(getWidget(child: Text(taks.intitule))),
  //             DataCell(getWidget(child: TableDropButton())
  //                 ),
  //             DataCell(getWidget(child: Text(taks.Matricule_employe))),
  //             DataCell(getWidget(child: Text(taks.date))),
  //             DataCell(
  //               getWidget(child: Text(taks.description)),
  //               onTapDown: (details) => details,
  //             ),
  //             DataCell(getWidget(child: Text("${taks.remuneration}"))),
  //           ],
  //         ))
  //     .toList();

  // Widget which contains the cell for easy editing
  Widget getWidget({Widget? child, double maxWidth = 200.0}) {
    return ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: maxWidth, maxHeight: double.infinity),
        child: child);
  }

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0 || columnIndex == 4) {
      widget.taks.sort((taks1, taks2) =>
          compareString(ascending, "${taks1.Id_Taches}", "${taks2.Id_Taches}"));
    }
    setState(() {
      sortColumnsIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

  //AddTaskBox
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
                          minWidth: 300.0,
                          maxHeight:
                              200), // we must adjust for responsive capacity
                      child: TextFormField(
                        controller: intituleController,
                        decoration: InputDecoration(
                          labelText: 'Intitulé',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          icon: Icon(Icons.menu_book),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    TextFormField(
                      controller: idEmployeeController,
                      decoration: InputDecoration(
                        labelText: 'Matricule Employé',
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
                        labelText: 'Date de debut',
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
                      controller: dateFinController,
                      decoration: InputDecoration(
                        labelText: 'Date de fin',
                        icon: Icon(Icons.edit_calendar),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    TextFormField(
                      controller: DescriptionController,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        icon: Icon(Icons.manage_search),
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
                        intituleController.text == "" ||
                        idEmployeeController.text == "") {
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
      widget.taks.add(Tasks(
        Id_Taches: indexStart++,
        Intitule: intituleController.text,
        Date: dateController.text,
        DateFin: dateFinController.text,
        Matricule_employe: idEmployeeController.text,
        Description: DescriptionController.text,
      ));
      intituleController.clear();
      dateController.clear();
      dateFinController.clear();
      idEmployeeController.clear();
      DescriptionController.clear();
    });
  }
}

// Summary tasks panel :
// TaskPanel : the tangible part of the tasks widgets
// TaskEmply : Soft part of the tasks widget
// The statefullWidget bridge

class TasksPanel extends StatelessWidget {
  final TasksEmply emply;
  final onHover;
  final onTap;

  const TasksPanel(
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
      },
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
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
