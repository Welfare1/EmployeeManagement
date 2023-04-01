import 'package:flutter/material.dart';
import 'EmployeeSoft.dart';

class EmployeeTable extends StatefulWidget {
  final employee;
  const EmployeeTable({super.key, required this.employee});

  @override
  State<EmployeeTable> createState() => _EmployeeTableState();
}

class _EmployeeTableState extends State<EmployeeTable> {
  // late List<Employee> employee;
  int? sortColumnsIndex;
  bool isAscending = false;

  // @override
  // void initState() {
  //   super.initState();
  //   this.employee = Employee.employeeList();
  // }
  // void initState() {
  //   super.initState();
  //   this.employee = List.of(allUsers);
  // }

  @override
  Widget build(BuildContext context) {
    double mediaQueryWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      //margin: EdgeInsets.only(left: (0.2 * mediaQueryWidth), top: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal, child: buildDataTable()),
      ),
    );
  }

  Widget buildDataTable() {
    final columns = [
      "Matricule",
      "Nom",
      "Prénoms",
      "Date de Naissance",
      "Catégories",
      "Solde",
      "Nb de tâches"
    ];

    return DataTable(
        sortColumnIndex: sortColumnsIndex,
        sortAscending: isAscending,
        columns: getColumns(columns),
        rows: getRows(widget.employee));
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
          label: Text(
            column,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onSort: onSort))
      .toList();

  List<DataRow> getRows(List<Employee> rows) => rows.map((Employee employees) {
        final cell = [
          employees.Matricule,
          employees.Nom,
          employees.Prenom,
          employees.Date_Naissance,
          employees.Categorie,
          employees.Solde,
          employees.Nb_tache
        ];
        return DataRow(cells: getCells(cell));
      }).toList();
  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((dynamic cell) => DataCell(Text("$cell"))).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 1 || columnIndex == 5) {
      widget.employee.sort((employee1, employee2) =>
          compareString(ascending, "${employee1.Nom}", "${employee2.Nom}"));
    }
    setState(() {
      sortColumnsIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
