import 'package:flutter/material.dart';
import 'EmployeeSoft.dart';

// Summary tasks panel :
/* Tasks: Soft part the all tasks about our list of tasks
It's contains also a list of all the tasks.
*/

// TaskPanel : the tangible part of the tasks widgets
// TaskEmply : Soft part of the tasks widget

class Tasks {
  int Id_Taches;
  String Matricule_employe;
  String Date;
  String Intitule;
  String Description;
  double Remuneration;
  String Statut;
  String DateFin;

  Tasks(
      {required this.Id_Taches,
      required this.Matricule_employe,
      required this.Date,
      required this.Intitule,
      required this.Description,
      this.Remuneration = 5000,
      this.Statut = "En cours",
      required this.DateFin});

  static List<Tasks> taksList() {
    List<Map<String, dynamic>> tasks = [
      {
        "id_Taches": 1,
        "Matricule_employe": "E001",
        "date": "01/03/2022",
        "intitule": "Développement de la fonctionnalité de connexion",
        "description":
            "Ajout de la fonctionnalité de connexion pour les utilisateurs",
        "date1": "01/03/2022",
      },
      {
        "id_Taches": 2,
        "Matricule_employe": "E002",
        "date": "02/03/2022",
        "intitule": "Tests automatisés pour le module de facturation",
        "description":
            "Écriture de tests automatisés pour vérifier le fonctionnement du module de facturation",
        "date1": "01/03/2022",
      },
      {
        "id_Taches": 3,
        "Matricule_employe": "E003",
        "date": "03/03/2022",
        "intitule":
            "Design de l'interface utilisateur pour l'application mobile",
        "description":
            "Conception des maquettes pour l'interface utilisateur de l'application mobile",
        "date1": "01/03/2022",
      },
      {
        "id_Taches": 4,
        "Matricule_employe": "E004",
        "date": "04/03/2022",
        "intitule": "Déploiement de la mise à jour du serveur",
        "description":
            "Installation et configuration de la dernière mise à jour du serveur",
        "date1": "01/03/2022",
      },
      {
        "id_Taches": 5,
        "Matricule_employe": "E005",
        "date": "05/03/2022",
        "intitule": "Intégration du module de paiement en ligne",
        "description":
            "Intégration du module de paiement en ligne pour permettre aux utilisateurs de payer en ligne",
        "date1": "01/03/2022",
      },
      {
        "id_Taches": 6,
        "Matricule_employe": "E001",
        "date": "06/03/2022",
        "intitule": "Optimisation de la base de données",
        "description":
            "Optimisation des requêtes et de la structure de la base de données pour améliorer les performances",
        "date1": "01/03/2022",
      },
      {
        "id_Taches": 7,
        "Matricule_employe": "E003",
        "date": "07/03/2022",
        "intitule":
            "Développement de nouvelles fonctionnalités pour l'application mobile",
        "description":
            "Ajout de nouvelles fonctionnalités pour améliorer l'expérience utilisateur de l'application mobile",
        "date1": "01/03/2022",
      },
      {
        "id_Taches": 8,
        "Matricule_employe": "E006",
        "date": "08/03/2022",
        "intitule": "Mise en place de tests de sécurité",
        "description":
            "Mise en place de tests de sécurité pour s'assurer que l'application est sécurisée",
        "date1": "01/03/2022",
      },
      {
        "id_Taches": 9,
        "Matricule_employe": "E002",
        "date": "09/03/2022",
        "intitule": "Mise à jour de la documentation",
        "description":
            "Mise à jour de la documentation pour inclure les dernières fonctionnalités et modifications",
        "date1": "01/03/2022",
      },
    ];
    // List<Employee> employeelist = [];
    // employes.forEach((element) {
    //   employeelist.add(Employee(
    //       Matricule: element["Matricule"],
    //       Nom: element["Nom"],
    //       Prenom: element["Prenom"],
    //       Date_Naissance: element["Date_Naissance"],
    //       Categorie: element["Categorie"],
    //       Lieu_habitation: element["Lieu_habitation"],
    //       nb_tache: element["nb_tache"],
    //       solde: element["solde"]));
    // });
    // return employeelist;
    List<Tasks> employeeTaks = tasks
        .map((element) => Tasks(
            Id_Taches: element["id_Taches"],
            Matricule_employe: element["Matricule_employe"],
            Date: element["date"],
            Intitule: element["intitule"],
            Description: element["description"],
            DateFin: element["date1"]))
        .toList();
    return employeeTaks;
  }

  payementTaks(Employee employees, double montant) {
    employees.Solde += montant;
  }

  Tasks copy({
    int? id_Taches,
    String? matricule_employe,
    String? date,
    String? intitule,
    String? description,
    double? remuneration,
    String? statut,
    String? dateFin,
  }) =>
      Tasks(
          Id_Taches: id_Taches ?? Id_Taches,
          Matricule_employe: matricule_employe ?? Matricule_employe,
          Date: date ?? Date,
          Intitule: intitule ?? Intitule,
          Description: description ?? Description,
          Remuneration: remuneration ?? Remuneration,
          Statut: statut ?? Statut,
          DateFin: dateFin ?? DateFin);
}

class TasksEmply {
  Color icolor;
  Icon icon;
  String title;
  Color textColor;
  bool isOnHove;

  TasksEmply(
      {required this.icolor,
      required this.icon,
      required this.title,
      required this.textColor,
      this.isOnHove = false});

  static List<TasksEmply> taskPanel() {
    return [
      TasksEmply(
          icolor: Colors.white,
          icon: const Icon(
            Icons.calendar_month,
            color: Colors.grey,
          ),
          title: "Date",
          textColor: Colors.black),
      TasksEmply(
          icolor: Colors.purple,
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          title: "Affecter des tâches",
          textColor: Colors.white),
      TasksEmply(
          icolor: Colors.red,
          icon: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
          title: "Retirer une tâche",
          textColor: Colors.white),
      TasksEmply(
          icolor: Colors.purple,
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          title: "Ajouter des employés",
          textColor: Colors.white),
    ];
  }
}
