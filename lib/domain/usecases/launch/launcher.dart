import 'package:barcode_reader/domain/usecases/core/core.dart';

abstract class LauncherUsecase<T> implements UseCase<LauncherParam<T>, Future<void>> {}

class LauncherParam<T> {
  final T toLaunch;

  LauncherParam({required this.toLaunch});
}
