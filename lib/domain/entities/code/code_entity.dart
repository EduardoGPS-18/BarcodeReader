import 'package:equatable/equatable.dart';

class CodeEntity extends Equatable {
  final int id;
  final String title;
  final String code;

  const CodeEntity({
    required this.id,
    required this.title,
    required this.code,
  });

  @override
  List<Object?> get props => [title, code];
}
