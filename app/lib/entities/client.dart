import 'package:sdi_pedidos/core_module/vos/int_vo.dart';
import 'package:sdi_pedidos/core_module/vos/text_vo.dart';

class Client {
  IntVO _codCliente;
  TextVO _nome;
  TextVO? _endereco;
  TextVO? _numero;
  TextVO? _complemento;
  TextVO? _bairro;
  TextVO? _cep;
  TextVO? _cnpj;
  TextVO? _cpf;
  TextVO? _fone;
  TextVO? _email;

  IntVO get codCliente => _codCliente;
  void setCodCliente(int value) => _codCliente = IntVO(value);

  TextVO get nome => _nome;
  void setNome(String value) => _nome = TextVO(value);

  TextVO? get endereco => _endereco;
  void setEndereco(String? value) =>
      _endereco = value != null ? TextVO(value) : null;

  TextVO? get numero => _numero;
  void setNumero(String? value) =>
      _numero = value != null ? TextVO(value) : null;

  TextVO? get complemento => _complemento;
  void setComplemento(String? value) =>
      _complemento = value != null ? TextVO(value) : null;

  TextVO? get bairro => _bairro;
  void setBairro(String? value) =>
      _bairro = value != null ? TextVO(value) : null;

  TextVO? get cep => _cep;
  void setCep(String? value) => _cep = value != null ? TextVO(value) : null;

  TextVO? get cnpj => _cnpj;
  void setCnpj(String? value) => _cnpj = value != null ? TextVO(value) : null;

  TextVO? get cpf => _cpf;
  void setCpf(String? value) => _cpf = value != null ? TextVO(value) : null;

  TextVO? get fone => _fone;
  void setFone(String? value) => _fone = value != null ? TextVO(value) : null;

  TextVO? get email => _email;
  void setEmail(String? value) => _email = value != null ? TextVO(value) : null;

  Client({
    required int codCliente,
    required String nome,
    String? endereco,
    String? numero,
    String? complemento,
    String? bairro,
    String? cep,
    String? cnpj,
    String? cpf,
    String? fone,
    String? email,
  })  : _codCliente = IntVO(codCliente),
        _nome = TextVO(nome),
        _endereco = endereco != null ? TextVO(endereco) : null,
        _numero = numero != null ? TextVO(numero) : null,
        _complemento = complemento != null ? TextVO(complemento) : null,
        _bairro = bairro != null ? TextVO(bairro) : null,
        _cep = cep != null ? TextVO(cep) : null,
        _cnpj = cnpj != null ? TextVO(cnpj) : null,
        _cpf = cpf != null ? TextVO(cpf) : null,
        _fone = fone != null ? TextVO(fone) : null,
        _email = email != null ? TextVO(email) : null;
}
