import 'package:barcode_reader/data/local_launcher/local_launcher.dart';
import 'package:barcode_reader/data/usecases/launcher/url_launcher.dart';
import 'package:barcode_reader/domain/error/domain_error.dart';
import 'package:barcode_reader/domain/usecases/launch/launch.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LocalLauncherSpy extends Mock implements LocalLauncher {
  LocalLauncherSpy() {
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

void main() {
  late final LocalLauncherSpy localLauncher;
  late final UrlLauncher sut;

  setUpAll(() {
    localLauncher = LocalLauncherSpy();
    sut = UrlLauncher(localLauncher: localLauncher);
  });

  test('Should call dependencies correctly ...', () async {
    await sut.call(param: LauncherParam(toLaunch: 'any_url'));
    verify(() => localLauncher.canLaunch('any_url')).called(1);
    verify(() => localLauncher.launch('any_url')).called(1);
  });

  test("Shouldn't call launch when canLaunch fails...", () async {
    localLauncher.mockCanLaunchSuccess(false);

    sut.call(param: LauncherParam(toLaunch: 'any_url'));

    verify(() => localLauncher.canLaunch('any_url')).called(1);
    verifyNever(() => localLauncher.launch('any_url'));
  });

  test('Should throws if LaunchError throws ...', () async {
    localLauncher.mockCanLaunchError(Exception('any_exception'));
    final result = sut.call(param: LauncherParam(toLaunch: 'any_url'));
    expect(result, throwsA(DomainError.launchError));
  });
}
