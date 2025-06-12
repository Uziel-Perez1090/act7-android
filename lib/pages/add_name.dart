
import 'package:flutter/material.dart'; 

import 'package:myapp/services/firebase_services.dart'; 

 

class AddName extends StatefulWidget { 

  const AddName({super.key}); 

 

  @override 

  State<AddName> createState() => _AddNameState(); 

} 

 

class _AddNameState extends State<AddName> { 

  final TextEditingController codigoController = TextEditingController(); 

  final TextEditingController nombreController = TextEditingController(); 

  final TextEditingController telefonoController = TextEditingController(); 

  final TextEditingController direccionController = TextEditingController(); 

  final TextEditingController apellidoMController = TextEditingController(); 

  final TextEditingController apellidoPController = TextEditingController(); 
  final TextEditingController cuentaController = TextEditingController(); 

  @override 

  Widget build(BuildContext context) { 

    return Scaffold( 

      appBar: AppBar( 

        title: Text("AGREGAR", style: TextStyle(color: Colors.white)), 

        centerTitle: true, 

        backgroundColor: Colors.blue, 

      ), 

      body: Padding( 

        padding: const EdgeInsets.all(20.0), 

        child: Column( 

          children: [ 

            TextField( 

              controller: codigoController, 

              decoration: InputDecoration(hintText: "Ingrese ID"), 

            ), 

            const SizedBox(height: 15), 

            TextField( 

              controller: nombreController, 

              decoration: const InputDecoration(hintText: 'Ingrese el nombre'), 

            ), 

            const SizedBox(height: 15), 

            TextField( 

              controller: telefonoController, 

              decoration: const InputDecoration(hintText: 'Ingrese el telefono'), 

            ), 

            const SizedBox(height: 15), 

            TextField( 

              controller: direccionController, 

              decoration: const InputDecoration(hintText: 'Ingrese la direccion'), 

            ), 

            const SizedBox(height: 15), 

            TextField( 

              controller: apellidoMController, 

              decoration: const InputDecoration(hintText: 'Ingrese el Apellido M'), 

            ), 

            const SizedBox(height: 15), 

            TextField( 

              controller: apellidoPController, 

              decoration: const InputDecoration(hintText: 'Ingrese el Apellido P'), 

            ), 

            const SizedBox(height: 15), 

            TextField( 

              controller: cuentaController, 

              decoration: const InputDecoration(hintText: 'Ingrese la cuenta'), 

            ), 

            const SizedBox(height: 30), 

            ElevatedButton( 

              style: ElevatedButton.styleFrom( 

                backgroundColor: Colors.lightBlueAccent, 

                foregroundColor: Colors.white, 

            ), 

              onPressed: () async { 

                await addClientes(codigoController.text, 

                  nombreController.text, 

                  telefonoController.text, 

                  direccionController.text, 

                  apellidoMController.text, 

                  apellidoPController.text, 

                  cuentaController.text, 

                ); 

                Navigator.pop(context); 

              }, 

              child: const Text("Guardar"), 

            ), 

          ], 

        ), 

      ), 

    ); 

  }
}