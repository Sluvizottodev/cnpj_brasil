import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../MapaEmpresa.dart';

class BuscarEmpresa extends StatefulWidget {
  @override
  _BuscarEmpresaState createState() => _BuscarEmpresaState();
}

class _BuscarEmpresaState extends State<BuscarEmpresa> {
  final TextEditingController _cnpjController = TextEditingController();
  String? latitude;
  String? longitude;

  Future<void> _buscarDadosEmpresa() async {
    final String cnpj = _cnpjController.text;

    final response = await http.get(
      Uri.parse('https://brasilapi.com.br/api/cnpj/v1/$cnpj'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        latitude = data['latitude'].toString();
        longitude = data['longitude'].toString();
      });

      if (latitude != null && longitude != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MapaEmpresa(
              latitude: latitude!,
              longitude: longitude!,
            ),
          ),
        );
      }
    } else {
      print('Erro ao buscar dados da empresa');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar Empresa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cnpjController,
              decoration: InputDecoration(
                labelText: 'Digite o CNPJ da Empresa',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _buscarDadosEmpresa,
              child: Text('Buscar Empresa'),
            ),
          ],
        ),
      ),
    );
  }
}
