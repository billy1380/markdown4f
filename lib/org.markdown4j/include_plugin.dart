import 'package:http/http.dart' as http;
import 'package:markdown4f/org.markdown4j/plugin.dart';
import 'package:markdown4f/org.markdown4j/markdown_processor.dart';

class IncludePlugin extends Plugin {
  final http.Client _client;

  IncludePlugin({http.Client? client})
      : _client = client ?? http.Client(),
        super("include");

  @override
  Future<void> emit(
      StringBuffer out, List<String> lines, Map<String, String> params) async {
    String? src = params["src"];
    if (src != null) {
      try {
        String content = await _getContent(src);
        var processor =
            MarkdownProcessor(client: _client, includeEnabled: false);
        String processed = await processor.processString(content);
        out.write(processed);
      } catch (e) {
        // Fail gracefully or throw? Java threw RuntimeException.
        // We'll write the error to output or just fail?
        // Let's write the raw content if processing fails, or just throw.
        throw Exception("Error in IncludePlugin: $e");
      }
    }
  }

  Future<String> _getContent(String src) async {
    final response = await _client.get(Uri.parse(src));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(
          "Failed to load included content from $src: ${response.statusCode}");
    }
  }
}
