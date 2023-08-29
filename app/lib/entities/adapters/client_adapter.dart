import 'package:sdi_pedidos/entities/client.dart';

class ClientAdapter {
  static Map<String, dynamic> toMap(Client client) {
    return {
      'codCliente': client.codCliente.value,
      'nome': client.nome.value,
      'endereco': client.endereco.value,
      'numero': client.numero.value,
      if (client.complemento?.value != null)
        'complemento': client.complemento?.value,
      'cep': client.cep.value,
      'cnpj': client.cnpj.value,
      'cpf': client.cpf.value,
      'fone': client.fone.value,
      'email': client.email.value,
    };
  }

  static Client fromMap(Map<String, dynamic> map) {
    return Client(
      codCliente: map['codcliente'] as int,
      nome: map['nome'] as String,
      endereco: map['endereco'] as String,
      numero: map['numero'] as String,
      complemento:
          map['complemento'] != null ? map['complemento'] as String : null,
      bairro: map['bairro'] as String,
      cep: map['cep'] as String,
      cnpj: map['cnpj'] as String,
      cpf: map['cpf'] as String,
      fone: map['fone'] as String,
      email: map['email'] as String,
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
