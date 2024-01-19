import 'package:sdi_pedidos/core_module/vos/int_vo.dart';
import 'package:sdi_pedidos/entities/city.dart';

abstract class ICity {
  Future<dynamic> create(List<City> cities);
  Future<City?> getOne(IntVO codCidade);
  Future<List<City>> getAll();
  Future<dynamic> update(City city);
  Future<dynamic> delete(IntVO codCidade);
  Future<dynamic> deleteAll();
}
