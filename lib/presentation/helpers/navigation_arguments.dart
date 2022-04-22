abstract class NavigationArguments {}

class NavigateBack<T> implements NavigationArguments {
  final T result;
  NavigateBack({required this.result});
}

class NavigateForward implements NavigationArguments {
  final String route;

  NavigateForward({required this.route});
}

class NavigateReplace extends NavigateForward {
  NavigateReplace({required String route}) : super(route: route);
}

class NavigateAndClearStack extends NavigateForward {
  NavigateAndClearStack({required String route}) : super(route: route);
}
