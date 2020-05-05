import 'package:flutter_test/flutter_test.dart';
import 'package:markdown4f/markdown4f.dart';

void main() {
  test('headings', () {
    final processor = MarkdownProcessor();
    expect(processor.processString("#Hello"), "<h1>Hello</h1>\n");
    expect(processor.processString("##Hello"), "<h2>Hello</h2>\n");
    expect(processor.processString("###Hello"), "<h3>Hello</h3>\n");
    expect(processor.processString("####Hello"), "<h4>Hello</h4>\n");
    expect(processor.processString("#####Hello"), "<h5>Hello</h5>\n");
    expect(processor.processString("######Hello"), "<h6>Hello</h6>\n");
  });
}
