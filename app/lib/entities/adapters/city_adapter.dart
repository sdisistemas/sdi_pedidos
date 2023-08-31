import 'package:sdi_pedidos/entities/city.dart';

class CityAdapter {
  static Map<String, dynamic> toMap(City city) {
    return {
      'cod_cidade': city.codCidade.value,
      'nome': city.nome.value,
      if (city.uf?.value != null) 'uf': city.uf?.value,
      if (city.codRegiao?.value != null) 'cod_regiao': city.codRegiao?.value,
      if (city.codNacional?.value != null)
        'cod_nacional': city.codNacional?.value,
      if (city.cep?.value != null) 'cep': city.cep?.value,
    };
  }

  static City fromMap(Map<String, dynamic> map) {
    return City(
      codCidade: map['COD_CIDADE'] as int? ?? 0,
      nome: map['NOME'] as String? ?? '',
      uf: map['UF'] as String?,
      codRegiao: map['COD_REGIAO'] as String?,
      codNacional: map['COD_NACIONAL'] as String?,
      cep: map['CEP'] as String?,
    );
  }

  static List<City> toList(List<Map<String, dynamic>> result) {
    final List<City> cities = [];
    for (Map<String, dynamic> map in result) {
      cities.add(fromMap(map));
    }
    return cities;
  }

  static List<City> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => fromMap(map)).toList();
  }

  static City empty() {
    return City(
      codCidade: 0,
      nome: '',
      uf: null,
      codRegiao: null,
      codNacional: null,
      cep: null,
    );
  }
}
