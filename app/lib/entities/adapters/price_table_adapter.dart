import 'package:sdi_pedidos/entities/price_table.dart';

class PriceTableAdapter {
  static Map<String, dynamic> toMap(PriceTable priceTable) {
    return {
      'cod_produto': priceTable.codProduto.value,
      'seq_tabela': priceTable.seqTabela.value,
      'preco_venda': priceTable.precoVenda.value,
      'descr_tabela': priceTable.descrTabela.value,
    };
  }

  static PriceTable fromMap(Map<String, dynamic> map) {
    return PriceTable(
      codProduto: map['COD_PRODUTO'] as int? ?? 0,
      seqTabela: map['SEQ_TABELA'] as int? ?? 0,
      precoVenda: (map['PRECO_VENDA'] as num?)?.toDouble() ?? 0.0,
      descrTabela: map['DESCR_TABELA'] as String? ?? '',
    );
  }

  static List<PriceTable> toList(List<Map<String, dynamic>> result) {
    final List<PriceTable> priceTables = [];
    for (Map<String, dynamic> map in result) {
      priceTables.add(fromMap(map));
    }
    return priceTables;
  }

  static List<PriceTable> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => fromMap(map)).toList();
  }

  static PriceTable empty() {
    return PriceTable(
      codProduto: 0,
      seqTabela: 0,
      precoVenda: 0.0,
      descrTabela: '',
    );
  }
}
