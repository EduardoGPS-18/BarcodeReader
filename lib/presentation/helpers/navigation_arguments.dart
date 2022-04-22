abstract class NavigationArguments {}

class NavigateBack<T> implements NavigationArguments {
  final T? result;
  NavigateBack({this.result});
}

class NavigateForward implements NavigationArguments {
  final String route;

  NavigateForward({required this.route});
}

class NavigateReplace extends NavigationArguments {
  final String route;
  NavigateReplace({required this.route});
}

class NavigateAndClearStack extends NavigationArguments {
  final String route;
  NavigateAndClearStack({required this.route});
}
