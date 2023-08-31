import 'package:sdi_pedidos/core_module/vos/int_vo.dart';
import 'package:sdi_pedidos/core_module/vos/double_vo.dart';
import 'package:sdi_pedidos/core_module/vos/text_vo.dart';

class Product {
  IntVO _codProduto;
  IntVO _codEmpresa;
  TextVO _produtoTipo;
  IntVO _codBarras;
  TextVO _descricao;
  TextVO? _complemento;
  IntVO _codSecao;
  IntVO _codGrupo;
  IntVO _codUnid;
  TextVO _tipoProd;
  DoubleVO _precoVenda;

  IntVO get codProduto => _codProduto;
  void setCodProduto(int value) => _codProduto = IntVO(value);

  IntVO get codEmpresa => _codEmpresa;
  void setCodEmpresa(int value) => _codEmpresa = IntVO(value);

  TextVO get produtoTipo => _produtoTipo;
  void setProdutoTipo(String value) => _produtoTipo = TextVO(value);

  IntVO get codBarras => _codBarras;
  void setCodBarras(int value) => _codBarras = IntVO(value);

  TextVO get descricao => _descricao;
  void setDescricao(String value) => _descricao = TextVO(value);

  TextVO? get complemento => _complemento;
  void setComplemento(String? value) =>
      _complemento = value != null ? TextVO(value) : null;

  IntVO get codSecao => _codSecao;
  void setCodSecao(int value) => _codSecao = IntVO(value);

  IntVO get codGrupo => _codGrupo;
  void setCodGrupo(int value) => _codGrupo = IntVO(value);

  IntVO get codUnid => _codUnid;
  void setCodUnid(int value) => _codUnid = IntVO(value);

  TextVO get tipoProd => _tipoProd;
  void setTipoProd(String value) => _tipoProd = TextVO(value);

  DoubleVO get precoVenda => _precoVenda;
  void setPrecoVenda(double value) => _precoVenda = DoubleVO(value);

  Product({
    required int codProduto,
    required int codEmpresa,
    required String produtoTipo,
    required int codBarras,
    required String descricao,
    String? complemento,
    required int codSecao,
    required int codGrupo,
    required int codUnid,
    required String tipoProd,
    required double precoVenda,
  })  : _codProduto = IntVO(codProduto),
        _codEmpresa = IntVO(codEmpresa),
        _produtoTipo = TextVO(produtoTipo),
        _codBarras = IntVO(codBarras),
        _descricao = TextVO(descricao),
        _complemento = complemento != null ? TextVO(complemento) : null,
        _codSecao = IntVO(codSecao),
        _codGrupo = IntVO(codGrupo),
        _codUnid = IntVO(codUnid),
        _tipoProd = TextVO(tipoProd),
        _precoVenda = DoubleVO(precoVenda);
}
