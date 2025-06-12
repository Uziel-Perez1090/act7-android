import 'package:flutter/material.dart'; 

import 'package:myapp/services/firebase_services.dart'; 

 

class Home extends StatefulWidget { 

  const Home({super.key}); 

 

  @override 

  State<Home> createState() => _HomeState(); 

} 

 

class _HomeState extends State<Home> { 

  @override 

  Widget build(BuildContext context) { 

    return Scaffold( 

      appBar: AppBar( 

        title: Text("Mi CRUD", style: TextStyle(color: Colors.white)), 

        centerTitle: true, 

        backgroundColor: Colors.blue, 

      ), 

      body: FutureBuilder( 

        future: getClientes(), 

        builder: (context, snapshot) { 

          if (snapshot.hasData) { 

            return ListView.builder( 

              itemCount: snapshot.data?.length, 

              itemBuilder: (context, index) { 

                return Dismissible( 

                  onDismissed: (direction) async { 

                    await deleteClientes(snapshot.data?[index]['uid']); 

                    snapshot.data?.removeAt(index); 

                    setState(() { 

                       

                    }); 

                  }, 

                  confirmDismiss: (direction) async { 

                    bool result = false; 

                    result = await showDialog( 

                      context: context, 

                      builder: (context) { 

                        return AlertDialog( 

                          title: Text( 

                            "Eliminar ${snapshot.data?[index]['name']}", 

                          ), 

                          content: Text("¿Estas seguro?"), 

                          actions: [ 

                            TextButton( 

                              onPressed: () { 

                                Navigator.pop(context, false); 

                              }, 

                              child: Text("No"), 

                            ), 

                            TextButton( 

                              onPressed: () { 

                                Navigator.pop(context, true); 

                              }, 

                              child: Text("Si"), 

                            ), 

                          ], 

                        ); 

                      }, 

                    ); 

                    return result; 

                  }, 

                  background: Container( 

                    color: Colors.red, 

                    child: const Icon(Icons.delete, color: Colors.white), 

                  ), 

                  direction: DismissDirection.endToStart, 

 

                  key: Key(snapshot.data?[index]['uid']), 

                  child: ListTile( 

                        title: Text( 

                          snapshot.data?[index]['codigo'] ?? '', 

                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), 

                        ), 

                        subtitle: Column( 

                          crossAxisAlignment: CrossAxisAlignment.start, 

                          children: [ 

                            const SizedBox(height: 8), 

                            Row( 

                              children: [ 

                                Icon(Icons.person, size: 18, color: Color.fromARGB(255, 21, 97, 238)), 

                                const SizedBox(width: 6), 

                                Text('Nombre: ${snapshot.data?[index]['nombre'] ?? ''}'), 

                              ], 

                            ), 

                            Row( 

                              children: [ 

                                Icon(Icons.sell, size: 18, color: Color.fromARGB(255, 21, 97, 238)), 

                                const SizedBox(width: 6), 

                                Text('telefono: ${snapshot.data?[index]['telefono'] ?? ''}'), 

                              ], 

                            ), 

                            Row( 

                              children: [ 

                                Icon(Icons.aspect_ratio, size: 18, color: Color.fromARGB(255, 21, 97, 238)), 

                                const SizedBox(width: 6), 

                                Text('direccion: ${snapshot.data?[index][' direccion']?.toString() ?? ''}'), 

                              ], 

                            ), 

                            Row( 

                              children: [ 

                                Icon(Icons.border_color, size: 18, color: Color.fromARGB(255, 21, 97, 238)), 

                                const SizedBox(width: 6), 

                                Text('Apellido P: ${snapshot.data?[index]['apellidoP']?.toString() ?? ''}'), 

                              ], 

                            ), 

                            Row( 

                              children: [ 

                                Icon(Icons.man_4, size: 18, color: Color.fromARGB(255, 21, 97, 238)), 

                                const SizedBox(width: 6), 

                                Text('Apellido M: ${snapshot.data?[index]['apellidoM'] ?? ''}'), 

                              ], 

                            ),
                             Row( 

                              children: [ 

                                Icon(Icons.man_4, size: 18, color: Color.fromARGB(255, 21, 97, 238)), 

                                const SizedBox(width: 6), 

                                Text('Cuenta: ${snapshot.data?[index]['cuenta'] ?? ''}'), 

                              ], 

                            ), 

                          ], 

                        ), 

                    onTap: (() async { 

                      await Navigator.pushNamed( 

                        context, 

                        "/edit", 

                        arguments: { 

                              'codigo': snapshot.data?[index]['codigo'], 

                              'nombre': snapshot.data?[index]['nombre'], 

                              'telefono': snapshot.data?[index]['telefono'], 

                              'direccion': snapshot.data?[index]['direccion'], 

                              'apellidoP': snapshot.data?[index]['apellidoP'], 

                              'apellidoM': snapshot.data?[index]['apellidoM'], 

                              'cuenta': snapshot.data?[index]['cuenta'], 

                              'uid': snapshot.data?[index]['uid'], 

                            }, 

                      ); 

                      setState(() {}); 

                    }), 

                  ), 

                ); 

              }, 

            ); 

          } else { 

            return Center(child: CircularProgressIndicator()); 

          } 

        }, 

      ), 

      floatingActionButton: FloatingActionButton( 

        onPressed: () async { 

          await Navigator.pushNamed(context, '/add'); 

          setState(() {}); 

        }, 

        backgroundColor: Colors.lightBlueAccent, 

        child: Icon(Icons.add, color: Colors.white), 

      ), 

    ); 

  } 

}