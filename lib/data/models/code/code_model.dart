import 'package:barcode_reader/data/models/error/model_error.dart';
import 'package:barcode_reader/domain/entities/entities.dart';

extension CodeModel on CodeEntity {
  Map<String, dynamic> get toLocalMap {
    return {
      'title': title,
      'code': code,
      'imagePath': codeImagePath,
    };
  }

  static CodeEntity fromLocalMap(Map<String, dynamic> map) {
    if (!map.keys.toSet().containsAll(['title', 'code', 'imagePath'])) {
      throw ModelError.missingKeysOnMap;
    }
    return CodeEntity(
      title: map['title'],
      code: map['code'],
      codeImagePath: map['imagePath'],
    );
  }
}
