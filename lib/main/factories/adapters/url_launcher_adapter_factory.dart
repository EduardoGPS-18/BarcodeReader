import 'package:barcode_reader/data/local_launcher/local_launcher.dart';
import 'package:barcode_reader/infra/local_launcher/url_launcher_adapter.dart';

LocalLauncher makeLocalLauncherAdapter() {
  return UrlLauncherAdapter();
}
