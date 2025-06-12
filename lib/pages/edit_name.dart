import 'package:flutter/material.dart'; 

import 'package:myapp/services/firebase_services.dart'; 

 

class EditName extends StatefulWidget { 

  const EditName({super.key}); 

 

  @override 

  State<EditName> createState() => _EditNameState(); 

} 

 

class _EditNameState extends State<EditName> { 

  TextEditingController codigoController = TextEditingController(); 

  TextEditingController nombreController = TextEditingController(); 

  TextEditingController telefonoController = TextEditingController(); 

  TextEditingController direccionController = TextEditingController(); 

  TextEditingController apellidoMController = TextEditingController(); 

  TextEditingController apellidoPController = TextEditingController(); 

  TextEditingController cuentaController = TextEditingController(); 

 

  @override 

  void initState() { 

    super.initState(); 

  } 

 

  @override 

  void didChangeDependencies() { 

    super.didChangeDependencies(); 

 

    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map; 

    if (codigoController.text.isEmpty) { 

      codigoController.text = arguments['codigo'] ?? ''; 

      nombreController.text = arguments['nombre'] ?? ''; 

      telefonoController.text = arguments['telefono'] ?? ''; 

      direccionController.text = arguments['direccion'] ?? ''; 

      apellidoMController.text = arguments['apellidoM'] ?? ''; 

      apellidoPController.text = arguments['apellidoP'] ?? ''; 

      cuentaController.text = arguments['cuenta'] ?? ''; 

    } 

  } 

 

  @override 

  Widget build(BuildContext context) { 

    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map; 

   codigoController.text = arguments['codigo']; 

    return Scaffold( 

      appBar: AppBar( 

        title: Text("EDITAR", style: TextStyle(color: Colors.white)), 

        centerTitle: true, 

        backgroundColor: Colors.blue, 

      ), 

      body: Padding( 

        padding: const EdgeInsets.all(20.0), 

        child: Column( 

          children: [ 

            TextField( 

              controller: codigoController, 

              decoration: const InputDecoration(hintText: 'Ingrese la modificación'), 

            ), 

            const SizedBox(height: 15), 

            TextField( 

              controller: nombreController, 

              decoration: const InputDecoration(hintText: 'Ingrese la modificación'), 

            ), 

            TextField( 

              controller: telefonoController, 

              decoration: const InputDecoration(hintText: 'Ingrese la modificación'), 

            ), 

            TextField( 

              controller: direccionController, 

              decoration: const InputDecoration(hintText: 'Ingrese la modificación'), 

            ), 

            TextField( 

              controller: apellidoPController, 

              decoration: const InputDecoration(hintText: 'Ingrese la modificación'), 

            ), 

            TextField( 

              controller: apellidoMController, 

              decoration: const InputDecoration(hintText: 'Ingrese la modificación'), 

            ), 

            TextField( 

              controller: cuentaController, 

              decoration: const InputDecoration(hintText: 'Ingrese la modificación'), 
              ),

            const SizedBox(height: 30), 

            ElevatedButton( 

              style: ElevatedButton.styleFrom( 

                backgroundColor: Colors.lightBlueAccent, 

                foregroundColor: Colors.white, 

              ), 

              onPressed: () async { 

                final Map arguments = ModalRoute.of(context)!.settings.arguments as Map; 

 

                await updateCategoria( 

                  arguments['uid'], 

                  codigoController.text, 

                  nombreController.text, 

                  telefonoController.text, 

                  direccionController.text, 

                  apellidoMController.text, 

                  apellidoPController.text, 

                  cuentaController.text, 

                ); 

                Navigator.pop(context); 

              }, 

              child: const Text("Actualizar")), 

             

          ], 

        ), 

      ), 

    ); 

  } 

}