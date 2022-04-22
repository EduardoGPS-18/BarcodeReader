import 'package:barcode_reader/data/usecases/launcher/url_launcher.dart';
import 'package:barcode_reader/domain/usecases/launch/launch.dart';
import 'package:barcode_reader/main/factories/adapters/url_launcher_adapter_factory.dart';

LauncherUsecase<String> makeLauncherUsecase() {
  return UrlLauncher(
    localLauncher: makeLocalLauncherAdapter(),
  );
}
