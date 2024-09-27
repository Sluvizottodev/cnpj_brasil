import 'package:flutter/material.dart';
import 'View/BuscarEmpresa.dart';
import 'const/Routes.dart';
import 'const/TokenJWT.dart';

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
      home: FutureBuilder<String?>(
        future: _obterToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Mostra um carregando enquanto espera o token
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao obter token')); // Exibe erro, se houver
          } else {
            return BuscarEmpresa(); // Navega para a tela de busca de empresa
          }
        },
      ),
      onGenerateRoute: PageRoutes.generateRoute,
    );
  }

  Future<String?> _obterToken() async {
    final tokenService = TokenService();
    final tokenStorage = TokenStorage();

    // Substitua pelos seus valores reais
    final clientId = 'SEU_CLIENT_ID';
    final clientSecret = 'SEU_CLIENT_SECRET';

    final token = await tokenService.obterToken(clientId, clientSecret);
    if (token != null) {
      await TokenStorage.salvarToken(token); // Salva o token se obtido com sucesso
    }
    return token;
  }
}
