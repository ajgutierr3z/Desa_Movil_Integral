import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  // Asegura que los bindings de Flutter estén inicializados antes de Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MiAppEnLaNube());
}

class MiAppEnLaNube extends StatelessWidget {
  const MiAppEnLaNube({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Integración Cloud',
      home: Scaffold(
        appBar: AppBar(title: const Text('Prueba de Conexión Cloud')),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              // Operación de escritura en la nube
              CollectionReference registros = FirebaseFirestore.instance.collection('actividad_unidad2');
              await registros.add({
                "nombre": "Usuario Prueba",
                "matricula": "123456789",
                "curso": "Desarrollo Móvil Integral",
                "dispositivo": "Emulador Android",
                "timestamp": FieldValue.serverTimestamp(),
              });
              print("Datos enviados correctamente a la nube");
            },
            child: const Text('Enviar Datos a la Nube'),
          ),
        ),
      ),
    );
  }
}
