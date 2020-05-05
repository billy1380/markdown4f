import 'dart:convert';

extension StringUtils on String {
  bool operator <(String other) {
    return this.compareTo(other) < 0;
  }

  bool operator >(String other) {
    return this.compareTo(other) > 0;
  }

  /// https://api.flutter.dev/flutter/quiver.strings/isWhitespace.html
  bool get isSpace {
    int rune = this.codeUnits.first;
    return ((rune >= 0x0009 && rune <= 0x000D) ||
        rune == 0x0020 ||
        rune == 0x0085 ||
        rune == 0x00A0 ||
        rune == 0x1680 ||
        rune == 0x180E ||
        (rune >= 0x2000 && rune <= 0x200A) ||
        rune == 0x2028 ||
        rune == 0x2029 ||
        rune == 0x202F ||
        rune == 0x205F ||
        rune == 0x3000 ||
        rune == 0xFEFF);
  }

  /// https://api.flutter.dev/flutter/quiver.strings/isDigit.html
  bool get isDigit {
    int rune = this.codeUnits.first;
    return rune ^ 0x30 <= 9;
  }

  bool get isLetterOrDigit {
    return !isSpace;
  }
}

abstract class Reader {
  String read();
}

class StringReader implements Reader {
  final String _value;
  int _offset = 0;

  StringReader(this._value);

  @override
  String read() {
    String read;

    if (_offset < _value.length) {
      read = _value[_offset];
      _offset++;
    }

    return read;
  }
}
