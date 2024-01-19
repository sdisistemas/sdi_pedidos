import 'package:sdi_pedidos/core_module/vos/int_vo.dart';
import 'package:sdi_pedidos/entities/product.dart';

abstract class IProduct {
  Future<dynamic> create(List<Product> products);
  Future<Product?> getOne(IntVO codProduto);
  Future<List<Product>> getAll();
  Future<dynamic> update(Product product);
  Future<dynamic> delete(IntVO codProduto);
  Future<dynamic> deleteAll();
}
