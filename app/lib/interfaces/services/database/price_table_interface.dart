import 'package:sdi_pedidos/core_module/vos/int_vo.dart';
import 'package:sdi_pedidos/entities/price_table.dart';

abstract class IPriceTable {
  Future<dynamic> create(List<PriceTable> priceLists);
  Future<PriceTable?> getOne(IntVO codProduto);
  Future<List<PriceTable>> getAll();
  Future<dynamic> update(PriceTable priceTable);
  Future<dynamic> delete(IntVO codProduto);
  Future<dynamic> deleteAll();
}
