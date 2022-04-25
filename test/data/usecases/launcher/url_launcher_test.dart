import 'package:barcode_reader/data/usecases/launcher/url_launcher.dart';
import 'package:barcode_reader/domain/error/domain_error.dart';
import 'package:barcode_reader/domain/usecases/launch/launch.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/launch/launcher_spy.dart';

void main() {
  late final LauncherSpy localLauncher;
  late final UrlLauncher sut;

  setUpAll(() {
    localLauncher = LauncherSpy();
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
