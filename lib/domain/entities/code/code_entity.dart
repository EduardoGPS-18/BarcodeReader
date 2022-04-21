import 'package:equatable/equatable.dart';

class CodeEntity extends Equatable {
  final String title;
  final String code;
  final String codeImagePath;

  const CodeEntity({
    required this.title,
    required this.code,
    required this.codeImagePath,
  });

  @override
  List<Object?> get props => [title, code, codeImagePath];
}
