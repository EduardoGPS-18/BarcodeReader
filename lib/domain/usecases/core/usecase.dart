abstract class UseCase<IN, OUT> {
  OUT call({required IN param});
}

abstract class WithoutInUseCase<OUT> {
  OUT call();
}

abstract class WithoutOutUseCase<IN> {
  void call({required IN param});
}
