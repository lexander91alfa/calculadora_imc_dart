import 'dart:io';

abstract class InputReader {
  String? readLine();
}

class StdInputReader implements InputReader {
  @override
  String? readLine() => stdin.readLineSync();
}
