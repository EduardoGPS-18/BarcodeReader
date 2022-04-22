import 'package:get/state_manager.dart';

import 'helpers.dart';

class _EmptyNavigation implements NavigationArguments {}

mixin PresenterNavigationManagerI {
  Stream<NavigationArguments> get navigationStream;
}

mixin PresenterNavigationManager {
  final Rx<NavigationArguments> _navigationController = Rx<NavigationArguments>(_EmptyNavigation());

  Stream<NavigationArguments> get navigationStream => _navigationController.stream;

  set navigateToWithArguments(NavigationArguments navigationArguments) =>
      _navigationController.subject.add(navigationArguments);
}
