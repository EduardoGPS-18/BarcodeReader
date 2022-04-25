import 'package:barcode_reader/data/local_launcher/local_launcher.dart';
import 'package:mocktail/mocktail.dart';

class LauncherSpy extends Mock implements LocalLauncher {
  LauncherSpy() {
    mockLaunchSuccess();
    mockCanLaunchSuccess(true);
  }
  When mockCanLaunchCall() => when(() => canLaunch(any()));
  void mockCanLaunchSuccess(bool result) => mockCanLaunchCall().thenAnswer((_) async => result);
  void mockCanLaunchError(dynamic err) => mockCanLaunchCall().thenThrow(err);

  When mockLaunchCall() => when(() => launch(any()));
  void mockLaunchSuccess() => mockLaunchCall().thenAnswer((_) async => _);
  void mockLaunchError(dynamic err) => mockLaunchCall().thenThrow(err);
}
