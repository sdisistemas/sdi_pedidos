import 'package:sdi_pedidos/core_module/vos/int_vo.dart';
import 'package:sdi_pedidos/core_module/vos/text_vo.dart';

class City {
  IntVO _codCidade;
  TextVO _nome;
  TextVO? _uf;
  TextVO? _codRegiao;
  TextVO? _codNacional;
  TextVO? _cep;

  IntVO get codCidade => _codCidade;
  void setCodCidade(int value) => _codCidade = IntVO(value);

  TextVO get nome => _nome;
  void setNome(String value) => _nome = TextVO(value);

  TextVO? get uf => _uf;
  void setUf(String? value) => _uf = value != null ? TextVO(value) : null;

  TextVO? get codRegiao => _codRegiao;
  void setCodRegiao(String? value) =>
      _codRegiao = value != null ? TextVO(value) : null;

  TextVO? get codNacional => _codNacional;
  void setCodNacional(String? value) =>
      _codNacional = value != null ? TextVO(value) : null;

  TextVO? get cep => _cep;
  void setCep(String? value) => _cep = value != null ? TextVO(value) : null;

  City({
    required int codCidade,
    required String nome,
    String? uf,
    String? codRegiao,
    String? codNacional,
    String? cep,
  })  : _codCidade = IntVO(codCidade),
        _nome = TextVO(nome),
        _uf = uf != null ? TextVO(uf) : null,
        _codRegiao = codRegiao != null ? TextVO(codRegiao) : null,
        _codNacional = codNacional != null ? TextVO(codNacional) : null,
        _cep = cep != null ? TextVO(cep) : null;
}
