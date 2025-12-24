import "package:flutter_test/flutter_test.dart";
import "package:http/http.dart" as http;
import "package:http/testing.dart";
import "package:markdown4f/markdown4f.dart";

void main() {
  test("headings", () async {
    final processor = MarkdownProcessor();
    expect(await processor.processString("#Hello"), "<h1>Hello</h1>\n");
  });

  test("table plugin", () async {
    final processor = MarkdownProcessor();
    String input = "%%% table\n| H1 | H2 |\n|---|---|\n| C1 | C2 |\n%%%";
    String expected =
        "<table><thead><tr><th align=\"left\">H1</th><th align=\"left\">H2</th></tr></thead><tbody><tr><td align=\"left\">C1</td><td align=\"left\">C2</td></tr></tbody></table>";
    expect((await processor.processString(input)).trim(), expected);
  });

  test("gallery plugin", () async {
    final processor = MarkdownProcessor();
    String input = "%%% gallery\nhttp://a.com/i.jpg \"T\"\n%%%";
    String output = await processor.processString(input);
    expect(output, contains("<div class=\"gallery\">"));
    expect(output,
        contains("<img src=\"http://a.com/i.jpg\" alt=\"T\" title=\"T\"/>"));
    expect(output, contains("<span class=\"caption\">T</span>"));
  });

  test("include plugin", () async {
    final client = MockClient((request) async {
      if (request.url.toString() == "http://example.com/content.md") {
        return http.Response("# Included Heading", 200);
      }
      return http.Response("Not Found", 404);
    });

    final processor = MarkdownProcessor(client: client);
    String input = "%%% include src=http://example.com/content.md %%%";
    String output = await processor.processString(input);
    expect(output, "<h1>Included Heading</h1>\n");
  });

  test("websequence plugin", () async {
    final client = MockClient((request) async {
      if (request.url.host == "www.websequencediagrams.com") {
        return http.Response("{\"img\": \"?png=msc123\"}", 200);
      }
      return http.Response("Not Found", 404);
    });

    final processor = MarkdownProcessor(client: client);
    String input = "%%% sequence\nA->B: Message\n%%%";
    String output = await processor.processString(input);
    expect(
        output,
        contains(
            "<img src=\"http://www.websequencediagrams.com/?png=msc123\"/>"));
  });
}
