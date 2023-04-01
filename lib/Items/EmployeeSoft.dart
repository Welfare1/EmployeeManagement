import 'package:flutter/material.dart';

// Emply represent the widget of the employee Menu prototype
class Emply {
  Color icolor;
  Icon icon;
  String title;
  Color textColor;
  bool isOnHove;

  Emply(
      {required this.icolor,
      required this.icon,
      required this.title,
      required this.textColor,
      this.isOnHove = false});

  static List<Emply> EmplyList() {
    return [
      Emply(
          icolor: Colors.white,
          icon: const Icon(
            Icons.expand_more,
            color: Colors.grey,
          ),
          title: "Catégorie : Tous",
          textColor: Colors.black),
      Emply(
          icolor: Colors.white,
          icon: const Icon(
            Icons.expand_more,
            color: Colors.grey,
          ),
          title: "Trier par: A-Z",
          textColor: Colors.black),
      Emply(
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

class Employee {
  String Matricule;
  String Nom;
  String Prenom;
  String Date_Naissance;
  String Categorie;
  String Lieu_habitation;
  int Nb_tache;
  double Solde;
  bool online;
  String path;

  Employee(
      {required this.Matricule,
      required this.Nom,
      required this.Prenom,
      required this.Date_Naissance,
      required this.Categorie,
      required this.Lieu_habitation,
      this.Nb_tache = 0,
      this.Solde = 0.0,
      this.online = true,
      required this.path});

  static List<Employee> employeeList() {
    List<Map<String, dynamic>> employes = [
      {
        "Matricule": "E001",
        "Nom": "Kouadio",
        "Prenom": "Aïcha",
        "Date_Naissance": "01/01/1980",
        "Categorie": "GRADE B",
        "Lieu_habitation": "Abidjan, Côte d'Ivoire",
        "Image": "assets/images/profil1.jpg",
        "online": true,
        "Solde": 75000.0,
        "Nb_tache": 9
      },
      {
        "Matricule": "E002",
        "Nom": "Ndiaye",
        "Prenom": "Amadou",
        "Date_Naissance": "05/06/1985",
        "Categorie": "GRADE A",
        "Lieu_habitation": "Dakar, Sénégal",
        "Image": "assets/images/profil2.jpg",
        "online": true,
        "Solde": 86000.0,
        "Nb_tache": 10
      },
      {
        "Matricule": "E003",
        "Nom": "Abdullahi",
        "Prenom": "Fatima",
        "Date_Naissance": "10/11/1978",
        "Categorie": "GRADE C",
        "Lieu_habitation": "Lagos, Nigeria",
        "Image": "assets/images/profil3.jpg",
        "online": true,
        "Solde": 45000.0,
        "Nb_tache": 5
      },
      {
        "Matricule": "E004",
        "Nom": "Ntumba",
        "Prenom": "Jacques",
        "Date_Naissance": "15/03/1990",
        "Categorie": "GRADE C",
        "Lieu_habitation": "Kinshasa, République Démocratique du Congo",
        "Image": "assets/images/profil4.jpg",
        "online": false,
        "Solde": 30000.0,
        "Nb_tache": 4
      },
      {
        "Matricule": "E005",
        "Nom": "Njoroge",
        "Prenom": "Wanjiru",
        "Date_Naissance": "20/08/1973",
        "Categorie": "GRADE A",
        "Lieu_habitation": "Nairobi, Kenya",
        "Image": "assets/images/profil5.jpg",
        "online": true,
        "Solde": 400000.0,
        "Nb_tache": 80
      },
      {
        "Matricule": "E006",
        "Nom": "Sylla",
        "Prenom": "Kadiatou",
        "Date_Naissance": "25/12/1987",
        "Categorie": "GRADE A",
        "Lieu_habitation": "Bamako, Mali",
        "Image": "assets/images/face1.jpg",
        "online": false,
        "Solde": 145000.0,
        "Nb_tache": 25
      },
      {
        "Matricule": "E007",
        "Nom": "Keïta",
        "Prenom": "Sekou",
        "Date_Naissance": "01/01/1980",
        "Categorie": "GRADE B",
        "Lieu_habitation": "Conakry, Guinée",
        "Image": "assets/images/face2.jpg",
        "online": true,
        "Solde": 90000.0,
        "Nb_tache": 20
      },
      {
        "Matricule": "E008",
        "Nom": "Moussa",
        "Prenom": "Fatoumata",
        "Date_Naissance": "05/06/1985",
        "Categorie": "GRADE B",
        "Lieu_habitation": "Niamey, Niger",
        "Image": "assets/images/face3.jpg",
        "online": false,
        "Solde": 74000.0,
        "Nb_tache": 15
      },
      {
        "Matricule": "E009",
        "Nom": "Gueye",
        "Prenom": "Moussa",
        "Date_Naissance": "10/11/1978",
        "Categorie": "GRADE C",
        "Lieu_habitation": "Dakar, Sénégal",
        "Image": "assets/images/face4.jpg",
        "online": false,
        "Solde": 25000.0,
        "Nb_tache": 11
      },
      {
        "Matricule": "E010",
        "Nom": "Diop",
        "Prenom": "Aminata",
        "Date_Naissance": "15/03/1990",
        "Categorie": "GRADE D",
        "Lieu_habitation": "Dakar, Sénégal",
        "Image": "assets/images/face5.jpg",
        "online": false,
        "Solde": 78500.0,
        "Nb_tache": 17
      },
      {
        "Matricule": "E011",
        "Nom": "Bakari",
        "Prenom": "Saidou",
        "Date_Naissance": "20/08/1982",
        "Categorie": "GRADE B",
        "Lieu_habitation": "Bamako, Mali",
        "Image": "assets/images/face6.jpg",
        "online": false,
        "Solde": 96000.0,
        "Nb_tache": 20
      },
      {
        "Matricule": "E012",
        "Nom": "Amara",
        "Prenom": "Annicet",
        "Date_Naissance": "20/08/1982",
        "Categorie": "GRADE C",
        "Lieu_habitation": "Bamako, Mali",
        "Image": "assets/images/face6.jpg",
        "online": false,
        "Solde": 28000.0,
        "Nb_tache": 10
      },
      {
        "Matricule": "E015",
        "Nom": "Entolo",
        "Prenom": "Norbert",
        "Date_Naissance": "20/11/1988",
        "Categorie": "GRADE B",
        "Lieu_habitation": "Bamako, Mali",
        "Image": "assets/images/face6.jpg",
        "online": false,
        "Solde": 96000.0,
        "Nb_tache": 25
      },
      {
        "Matricule": "E016",
        "Nom": "Dicou",
        "Prenom": "Loulard",
        "Date_Naissance": "20/07/1985",
        "Categorie": "GRADE C",
        "Lieu_habitation": "Bamako, Mali",
        "Image": "assets/images/face6.jpg",
        "online": false,
        "Solde": 15000.0,
        "Nb_tache": 10
      }
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
    List<Employee> employeelist = employes
        .map((element) => Employee(
            Matricule: element["Matricule"],
            Nom: element["Nom"],
            Prenom: element["Prenom"],
            Date_Naissance: element["Date_Naissance"],
            Categorie: element["Categorie"],
            Lieu_habitation: element["Lieu_habitation"],
            path: element["Image"],
            online: element["online"],
            Solde: element["Solde"],
            Nb_tache: element["Nb_tache"]))
        .toList();
    return employeelist;
  }

  addNewEmployee(Employee employee) {
    employeeList().add(employee);
  }

  paiement(double montant) {
    this.Solde += montant;
  }

  Employee copy({
    String? matricule,
    String? nom,
    String? prenom,
    String? date_Naissance,
    String? categorie,
    String? lieu_habitation,
    int? nb_tache,
    double? solde,
    String? image,
  }) =>
      Employee(
          Matricule: matricule ?? Matricule,
          Nom: nom ?? Nom,
          Prenom: prenom ?? Prenom,
          Date_Naissance: date_Naissance ?? Date_Naissance,
          Categorie: categorie ?? Categorie,
          Lieu_habitation: lieu_habitation ?? Lieu_habitation,
          Solde: solde ?? Solde,
          Nb_tache: nb_tache ?? Nb_tache,
          path: image ?? path);
}
//Employee(Matricule:employ["Matricule"] , Nom: employ["Nom"], Prenom: employ["Prenom"], Date_Naissance: employ["Date_Naissance"], Categorie: employ["Categorie"], Lieu_habitation: employ["Lieu_habitation"],nb_tache: employ["nb_tache"],solde: employ["solde"])
//employ for employ in employes

final allUsers = <Employee>[
  Employee(
      Matricule: "011",
      Nom: "Bakari",
      Prenom: "Saidou",
      Date_Naissance: "20/08/1982",
      Categorie: "Cadre",
      Lieu_habitation: "Bamako, Mali",
      path: ""),

  // User(firstName: 'Max', lastName: 'Stone', age: 27),
  // User(firstName: 'Sarah', lastName: 'Winter', age: 20),
  // User(firstName: 'James', lastName: 'Summer', age: 21),
  // User(firstName: 'Lorita', lastName: 'Wilcher', age: 18),
  // User(firstName: 'Anton', lastName: 'Wilbur', age: 32),
  // User(firstName: 'Salina', lastName: 'Monsour', age: 24),
  // User(firstName: 'Sunday', lastName: 'Salem', age: 42),
  // User(firstName: 'Alva', lastName: 'Cowen', age: 47),
  // User(firstName: 'Jonah', lastName: 'Lintz', age: 18),
  // User(firstName: 'Kimberley', lastName: 'Kelson', age: 33),
  // User(firstName: 'Waldo', lastName: 'Cybart', age: 19),
  // User(firstName: 'Garret', lastName: 'Hoffmann', age: 27),
  // User(firstName: 'Margaret', lastName: 'Yarger', age: 25),
  // User(firstName: 'Foster', lastName: 'Lamp', age: 53),
  // User(firstName: 'Samuel', lastName: 'Testa', age: 58),
  // User(firstName: 'Sam', lastName: 'Schug', age: 44),
  // User(firstName: 'Alise', lastName: 'Bryden', age: 41),
];
