import 'package:sdi_pedidos/entities/client.dart';

class ClientAdapter {
  static Map<String, dynamic> toMap(Client client) {
    return {
      'cod_cliente': client.codCliente.value,
      'nome': client.nome.value,
      if (client.endereco?.value != null) 'endereco': client.endereco?.value,
      if (client.numero?.value != null) 'numero': client.numero?.value,
      if (client.complemento?.value != null)
        'complemento': client.complemento?.value,
      if (client.cep?.value != null) 'cep': client.cep?.value,
      if (client.cnpj?.value != null) 'cnpj': client.cnpj?.value,
      if (client.cpf?.value != null) 'cpf': client.cpf?.value,
      if (client.fone?.value != null) 'fone': client.fone?.value,
      if (client.email?.value != null) 'email': client.email?.value,
    };
  }

  static Client fromMap(Map<String, dynamic> map) {
    return Client(
      codCliente: map['COD_CLIENTE'] as int? ?? 0,
      nome: map['NOME'] as String? ?? '',
      endereco: map['ENDERECO'] as String?,
      numero: map['NUMERO'] as String?,
      complemento: map['COMPLEMENTO'] as String?,
      bairro: map['BAIRRO'] as String?,
      cep: map['CEP'] as String?,
      cnpj: map['CNPJ'] as String?,
      cpf: map['CPF'] as String?,
      fone: map['FONE'] as String?,
      email: map['EMAIL'] as String?,
    );
  }

  static List<Client> toList(List<Map<String, dynamic>> result) {
    final List<Client> clients = [];
    for (Map<String, dynamic> map in result) {
      clients.add(fromMap(map));
    }
    return clients;
  }

  static List<Client> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => fromMap(map)).toList();
  }

  static Client empty() {
    return Client(
        codCliente: 0,
        bairro: '',
        cep: '',
        cnpj: '',
        cpf: '',
        endereco: '',
        email: '',
        fone: '',
        nome: '',
        numero: '');
  }
}
