abstract class UseCase<IN, OUT> {
  OUT call({IN params});
}

abstract class WithoutInUseCase<OUT> {
  OUT call();
}

abstract class WithoutOutUseCase<IN> {
  void call({required IN params});
}
