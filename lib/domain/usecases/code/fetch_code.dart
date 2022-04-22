import '../../entities/code/code.dart';
import '../core/core.dart';

abstract class FetchBarCodes implements WithoutInUseCase<Future<List<CodeEntity>>> {}
