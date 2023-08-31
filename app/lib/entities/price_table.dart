import 'package:sdi_pedidos/core_module/vos/int_vo.dart';
import 'package:sdi_pedidos/core_module/vos/double_vo.dart';
import 'package:sdi_pedidos/core_module/vos/text_vo.dart';

class PriceTable {
  IntVO _codProduto;
  IntVO _seqTabela;
  DoubleVO _precoVenda;
  TextVO _descrTabela;

  IntVO get codProduto => _codProduto;
  void setCodProduto(int value) => _codProduto = IntVO(value);

  IntVO get seqTabela => _seqTabela;
  void setSeqTabela(int value) => _seqTabela = IntVO(value);

  DoubleVO get precoVenda => _precoVenda;
  void setPrecoVenda(double value) => _precoVenda = DoubleVO(value);

  TextVO get descrTabela => _descrTabela;
  void setDescrTabela(String value) => _descrTabela = TextVO(value);

  PriceTable({
    required int codProduto,
    required int seqTabela,
    required double precoVenda,
    required String descrTabela,
  })  : _codProduto = IntVO(codProduto),
        _seqTabela = IntVO(seqTabela),
        _precoVenda = DoubleVO(precoVenda),
        _descrTabela = TextVO(descrTabela);

  // Adicione métodos e validações adicionais aqui, se necessário.
}
