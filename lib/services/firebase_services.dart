import 'package:cloud_firestore/cloud_firestore.dart'; 
 
FirebaseFirestore db = FirebaseFirestore.instance; 

 

Future<List> getClientes() async { 

  List clientes= []; 

  QuerySnapshot queryClientes = await db.collection("clientes").get(); 

  for (var doc in queryClientes.docs) { 

    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>; 

    final cat = { 

    'nombre': data['nombre'], 

    'uid': doc.id, 

    'codigo': data['codigo'], 

    'telefono': data['telefono'], 

    'direccion': data['direccion'], 

    'apellidoP': data['apellidoP'], 

    'apellidoM': data['apellidoM'], 

    'cuenta': data['cuenta'], 

  }; 

    clientes.add(cat); 

  } 

  return clientes; 

} 

 

Future<void> addClientes( 

  String codigo,  

  String nombre,  

  String telefono,  

  String direccion,  

  String apellidoP,  

  String apellidoM, 

  String cuenta, 

) async { 

  await FirebaseFirestore.instance.collection('clientes').doc().set({ 

    'codigo': codigo, 

    'nombre': nombre, 

    'telefono': telefono, 

    'direccion': direccion, 

    'apellidoP': apellidoP, 

    'apellidoM': apellidoM, 

    'cuenta': cuenta, 

  }); 

} 

 

 

Future<void> updateCategoria( 

  String uid, 

  String newCodigo, 

  String newNombre, 

  String newTelefono, 

  String newDireccion, 

  String newApellidoP, 

  String newApellidoM, 

  String newCuenta 

) async { 

  await db.collection("clientes").doc(uid).update({ 

    "codigo": newCodigo, 

    "nombre": newNombre, 

    "telefono": newTelefono, 

    "direccion": newDireccion, 

    "apellidoP": newApellidoP, 

    "apellidoM": newApellidoM, 

    "Cuenta": newCuenta 

  }); 

} 

 

 

Future<void> deleteClientes(String uid) async { 

  await db.collection("clientes").doc(uid).delete(); 

}