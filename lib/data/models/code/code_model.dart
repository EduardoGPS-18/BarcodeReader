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
    return CodeEntity(
      title: map['title'],
      code: map['code'],
      codeImagePath: map['imagePath'],
    );
  }
}
