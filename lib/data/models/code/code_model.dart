import 'package:barcode_reader/data/models/error/model_error.dart';
import 'package:barcode_reader/domain/entities/entities.dart';

extension CodeModel on CodeEntity {
  Map<String, dynamic> get toLocalMap {
    return {
      'id': id,
      'title': title,
      'code': code,
    };
  }

  static CodeEntity fromLocalMap(Map<String, dynamic> map) {
    if (!map.keys.toSet().containsAll(['title', 'code'])) {
      throw ModelError.missingKeysOnMap;
    }
    return CodeEntity(
      id: map['id'],
      title: map['title'],
      code: map['code'],
    );
  }
}
