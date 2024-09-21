import 'package:flutter/material.dart';

import 'View/BuscarEmpresa.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CNPJ App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BuscarEmpresa(),
    );
  }
}
