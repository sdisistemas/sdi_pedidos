import 'package:sdi_pedidos/core_module/vos/int_vo.dart';
import 'package:sdi_pedidos/core_module/vos/text_vo.dart';

class Client {
  IntVO _codCliente;
  TextVO _nome;
  TextVO _endereco;
  TextVO _numero;
  TextVO? _complemento;
  TextVO _bairro;
  TextVO _cep;
  TextVO _cnpj;
  TextVO _cpf;
  TextVO _fone;
  TextVO _email;

  IntVO get codCliente => _codCliente;
  void setCodCliente(int value) => _codCliente = IntVO(value);

  TextVO get nome => _nome;
  void setNome(String value) => _nome = TextVO(value);

  TextVO get endereco => _endereco;
  void setEndereco(String value) => _endereco = TextVO(value);

  TextVO get numero => _numero;
  void setNumero(String value) => _numero = TextVO(value);

  TextVO? get complemento => _complemento;
  void setComplemento(String? value) =>
      _complemento = value != null ? TextVO(value) : null;

  TextVO get bairro => _bairro;
  void setBairro(String value) => _bairro = TextVO(value);

  TextVO get cep => _cep;
  void setCep(String value) => _cep = TextVO(value);

  TextVO get cnpj => _cnpj;
  void setCnpj(String value) => _cnpj = TextVO(value);

  TextVO get cpf => _cpf;
  void setCpf(String value) => _cpf = TextVO(value);

  TextVO get fone => _fone;
  void setFone(String value) => _fone = TextVO(value);

  TextVO get email => _email;
  void setEmail(String value) => _email = TextVO(value);

  Client({
    required int codCliente,
    required String nome,
    required String endereco,
    required String numero,
    String? complemento,
    required String bairro,
    required String cep,
    required String cnpj,
    required String cpf,
    required String fone,
    required String email,
  })  : _codCliente = IntVO(codCliente),
        _nome = TextVO(nome),
        _endereco = TextVO(endereco),
        _numero = TextVO(numero),
        _complemento = complemento != null ? TextVO(complemento) : null,
        _bairro = TextVO(bairro),
        _cep = TextVO(cep),
        _cnpj = TextVO(cnpj),
        _cpf = TextVO(cpf),
        _fone = TextVO(fone),
        _email = TextVO(email);
}
