import 'Sócio.dart';

// Classe que contém informações sobre uma empresa
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

  // Construtor que inicializa os atributos da empresa
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

  // Método para criar uma instância da classe a partir de um JSON
  factory Empresa.fromJson(Map<String, dynamic> json) {
    var sociosList = json['qsa'] as List;//Extrai e converte a lista de sócios
    List<Socio> socios = sociosList.map((socio) => Socio.fromJson(socio)).toList();

    // Retorna uma nova instância de Empresa com base nos dados JSON
    return Empresa(
      cnpj: json['cnpj'],
      razaoSocial: json['razao_social'],
      nomeFantasia: json['nome_fantasia'],
      situacaoCadastral: json['descricao_situacao_cadastral'],
      endereco: '${json['descricao_tipo_de_logradouro']} ${json['logradouro']}, ${json['numero']}, ${json['complemento']}, ${json['bairro']}, ${json['municipio']} - ${json['uf']}',  // Concatena informações de endereço
      telefone: json['ddd_telefone_1'],
      dataInicioAtividade: json['data_inicio_atividade'],
      cnaePrincipal: '${json['cnae_fiscal']} - ${json['cnae_fiscal_descricao']}',
      socios: socios,
    );
  }
}