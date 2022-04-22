import 'package:barcode_reader/data/local_launcher/local_launcher.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class UrlLauncherAdapter implements LocalLauncher {
  @override
  Future<bool> canLaunch(String url) async {
    return await url_launcher.launch(url);
  }

  @override
  Future<void> launch(String url) async {
    await url_launcher.launch(url);
  }
}
