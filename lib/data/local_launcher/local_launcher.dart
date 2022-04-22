abstract class LocalLauncher {
  Future<bool> canLaunch(String url);
  Future<void> launch(String url);
}
