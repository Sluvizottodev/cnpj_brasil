import 'Sócio.dart';

class Empresa {
  final String cnpj;
  final String razaoSocial;
  final String nomeFantasia;
  final String situacaoCadastral;
  final String endereco;
  final String telefone;
  final String dataInicioAtividade;
  final String cnaePrincipal;
  final List<Socio> socios;

  Empresa({
    required this.cnpj,
    required this.razaoSocial,
    required this.nomeFantasia,
    required this.situacaoCadastral,
    required this.endereco,
    required this.telefone,
    required this.dataInicioAtividade,
    required this.cnaePrincipal,
    required this.socios,
  });

  factory Empresa.fromJson(Map<String, dynamic> json) {
    var sociosList = json['qsa'] as List;
    List<Socio> socios = sociosList.map((socio) => Socio.fromJson(socio)).toList();

    return Empresa(
      cnpj: json['cnpj'],
      razaoSocial: json['razao_social'],
      nomeFantasia: json['nome_fantasia'],
      situacaoCadastral: json['descricao_situacao_cadastral'],
      endereco: '${json['descricao_tipo_de_logradouro']} ${json['logradouro']}, ${json['numero']}, ${json['complemento']}, ${json['bairro']}, ${json['municipio']} - ${json['uf']}',
      telefone: json['ddd_telefone_1'],
      dataInicioAtividade: json['data_inicio_atividade'],
      cnaePrincipal: '${json['cnae_fiscal']} - ${json['cnae_fiscal_descricao']}',
      socios: socios,
    );
  }
}