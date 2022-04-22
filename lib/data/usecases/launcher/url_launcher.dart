import 'package:barcode_reader/domain/error/domain_error.dart';
import 'package:barcode_reader/domain/usecases/launch/launch.dart';

import '../../local_launcher/local_launcher.dart';

class UrlLauncher implements LauncherUsecase<String> {
  LocalLauncher localLauncher;

  UrlLauncher({
    required this.localLauncher,
  });

  @override
  Future<void> call({required LauncherParam param}) async {
    try {
      if (await localLauncher.canLaunch(param.toLaunch)) {
        await localLauncher.launch(param.toLaunch);
      }
    } catch (err) {
      throw DomainError.launchError;
    }
  }
}
