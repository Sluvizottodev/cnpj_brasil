import 'dart:convert';
import 'package:http/http.dart' as http;

import '../ModelEmpresa/Empresa.dart';


class BuscarEmpresaViewModel {
  Future<Empresa?> buscarDadosEmpresa(String cnpj) async {
    final response = await http.get(
      Uri.parse('https://brasilapi.com.br/api/cnpj/v1/${cnpj.replaceAll(RegExp(r'\D'), '')}'),
    );

    if (response.statusCode == 200) {
      return Empresa.fromJson(jsonDecode(response.body));
    } else {
      print('Erro ao buscar dados da empresa');
      return null;
    }
  }
}
