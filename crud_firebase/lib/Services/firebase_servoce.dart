import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//Funcion que permite leer los datos de la base de datos

Future<List> getPeople () async{
  
  List people = [];

  QuerySnapshot querySnapshot = await db.collection('people').get();

  for (var doc in querySnapshot.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final person = {
      "name": data['name'],
      "uid": doc.id,
    };
      
    people.add(person);  
  }
  return people;
}

//Funcion que permite guardar nombre en la base de datos

Future<void> addPeople(String name) async {
  await db.collection("people").add({"name": name});

}


//Funcion que permite actualizar valores en la Base de Datos
Future<void> updatePeople(String uid, String newName) async {
  await db.collection("people").doc(uid).set({"name":newName});
}


//Funcion para eliminar datos Firebase
Future<void> deletepeople (String uid) async {
  await db.collection("people").doc(uid).delete();
}