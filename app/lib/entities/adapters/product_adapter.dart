import 'package:sdi_pedidos/entities/product.dart';

class ProductAdapter {
  static Map<String, dynamic> toMap(Product product) {
    return {
      'COD_PRODUTO': product.codProduto.value,
      'COD_EMPRESA': product.codEmpresa.value,
      'PRODUTO_TIPO': product.produtoTipo.value,
      'COD_BARRAS': product.codBarras.value,
      'DESCRICAO': product.descricao.value,
      if (product.complemento?.value != null)
        'COMPLEMENTO': product.complemento?.value,
      'COD_SECAO': product.codSecao.value,
      'COD_GRUPO': product.codGrupo.value,
      'COD_UNID': product.codUnid.value,
      'TIPO_PROD': product.tipoProd.value,
      'PRECO_VENDA': product.precoVenda.value,
    };
  }

  static Product fromMap(Map<String, dynamic> map) {
    return Product(
      codProduto: map['COD_PRODUTO'] as int,
      codEmpresa: map['COD_EMPRESA'] as int,
      produtoTipo: map['PRODUTO_TIPO'] as String,
      codBarras: map['COD_BARRAS'] as int,
      descricao: map['DESCRICAO'] as String,
      complemento: map['COMPLEMENTO'] as String?,
      codSecao: map['COD_SECAO'] as int,
      codGrupo: map['COD_GRUPO'] as int,
      codUnid: map['COD_UNID'] as int,
      tipoProd: map['TIPO_PROD'] as String,
      precoVenda: double.parse(map['PRECO_VENDA'] as String),
    );
  }

  static List<Product> toList(List<Map<String, dynamic>> result) {
    final List<Product> products = [];
    for (Map<String, dynamic> map in result) {
      products.add(fromMap(map));
    }
    return products;
  }

  static List<Product> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => fromMap(map)).toList();
  }

  static Product empty() {
    return Product(
      codProduto: 0,
      codEmpresa: 0,
      produtoTipo: '',
      codBarras: 0,
      descricao: '',
      complemento: null,
      codSecao: 0,
      codGrupo: 0,
      codUnid: 0,
      tipoProd: '',
      precoVenda: 0.0,
    );
  }
}
