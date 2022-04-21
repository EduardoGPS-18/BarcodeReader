import 'dart:io';

abstract class DeviceCamScanner {
  Future<File> scan();
}
