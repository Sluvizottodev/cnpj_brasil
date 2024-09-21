import 'package:flutter/material.dart';
import '../ModelEmpresa/Empresa.dart';

class EmpresaInfoCard extends StatelessWidget {
  final Empresa empresa;

  const EmpresaInfoCard({Key? key, required this.empresa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.grey[900], // Fundo escuro do card
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Adicionando scroll
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Informações da Empresa',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
              SizedBox(height: 12.0),
              _buildInfoRow('CNPJ:', empresa.cnpj, Icons.business),
              Divider(color: Colors.grey), // Divisor cinza
              _buildInfoRow('Razão Social:', empresa.razaoSocial, Icons.apartment),
              Divider(color: Colors.grey),
              _buildInfoRow('Nome Fantasia:', empresa.nomeFantasia, Icons.store),
              Divider(color: Colors.grey),
              _buildInfoRow('Situação Cadastral:', empresa.situacaoCadastral, Icons.check_circle),
              Divider(color: Colors.grey),
              _buildInfoRow('Endereço:', empresa.endereco, Icons.location_on),
              Divider(color: Colors.grey),
              _buildInfoRow('Telefone:', empresa.telefone, Icons.phone),
              Divider(color: Colors.grey),
              _buildInfoRow('Data de Início da Atividade:', empresa.dataInicioAtividade, Icons.calendar_today),
              Divider(color: Colors.grey),
              _buildInfoRow('CNAE Principal:', empresa.cnaePrincipal, Icons.code),
              SizedBox(height: 12.0),
              if (empresa.socios.isNotEmpty) ...[
                Text('Sócios:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(height: 8.0),
                ...empresa.socios.map<Widget>((socio) {
                  return Column(
                    children: [
                      _buildInfoRow('Nome do Sócio:', socio.nomeSocio, Icons.person),
                      Divider(color: Colors.grey),
                    ],
                  );
                }).toList(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent, size: 24), // Ícone em azul claro
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)), // Rótulo em branco
                Text(value, textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[400])), // Valor em cinza claro
              ],
            ),
          ),
        ],
      ),
    );
  }
}
