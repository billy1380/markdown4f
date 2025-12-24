import 'package:flutter_test/flutter_test.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/line.dart';

void main() {
  group('Line.stripID', () {
    test('Basic ID', () {
      final line = Line();
      line.value = "Header {#my-id}";
      line.init();
      expect(line.stripID(), "my-id");
      expect(line.value, "Header");
    });

    test('ID with spaces', () {
      final line = Line();
      line.value = "Header { #my-id }";
      line.init();
      expect(line.stripID(), "my-id");
      expect(line.value, "Header");
    });

    test('No ID', () {
      final line = Line();
      line.value = "Header { not id }";
      line.init();
      expect(line.stripID(), null);
      expect(line.value, "Header { not id }");
    });

    test('Escaped brace', () {
      final line = Line();
      line.value = "Header \\{ #not-id }";
      line.init();
      expect(line.stripID(), null);
    });

    test('Multiple braces, ID at end', () {
      final line = Line();
      line.value = "Header { brace } {#real-id}";
      line.init();
      expect(line.stripID(),
          "real-id"); // Expected behavior for a refactored version
      expect(line.value, "Header { brace }");
    });

    test('ID not at end', () {
      final line = Line();
      line.value = "Header {#id} suffix";
      line.init();
      expect(line.stripID(), null);
    });
  });
}
