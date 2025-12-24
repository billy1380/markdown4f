import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:markdown4f/org.markdown4j/plugin.dart';

class WebSequencePlugin extends Plugin {
  final http.Client _client;

  WebSequencePlugin({http.Client? client})
      : _client = client ?? http.Client(),
        super("sequence");

  @override
  Future<void> emit(final StringBuffer out, final List<String> lines,
      final Map<String, String> params) async {
    String style = params["style"] ?? "default";
    String content = lines.join("\n") + "\n";

    try {
      String? link = await _getSequenceDiagram(content, style);

      if (link != null) {
        out.write('<img src="$link"/>');
      }
    } catch (e) {
      throw Exception("Error while rendering websequenceplugin: $e");
    }
  }

  Future<String?> _getSequenceDiagram(String text, String style) async {
    // Build parameter string
    var body = {
      'style': style,
      'message': text,
      'apiVersion': '1',
    };

    // Send the request
    var url = Uri.parse("http://www.websequencediagrams.com");
    try {
      var response = await _client.post(url, body: body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        String jsonStr = response.body;

        // Parse JSON response manually as in the Java version or using jsonDecode
        // The Java version did substring parsing, but jsonDecode is safer if it returns valid JSON.
        // Example response expected: {"img": "?png=...", "errors": []}
        // But the Java code looked for "?png=". Let's assume it returns JSON.

        try {
          var jsonResponse = jsonDecode(jsonStr);
          if (jsonResponse is Map && jsonResponse.containsKey('img')) {
            return "http://www.websequencediagrams.com/${jsonResponse['img']}";
          }
        } catch (e) {
          // Fallback to manual parsing if it's not standard JSON or something else
          int start = jsonStr.indexOf("?png=");
          int end = jsonStr.indexOf("\"", start);

          if (start != -1 && end != -1) {
            return "http://www.websequencediagrams.com/" +
                jsonStr.substring(start, end);
          }
        }
      }
    } catch (e) {
      // ignore for now or rethrow
      print("Error fetching sequence diagram: $e");
    }
    return null;
  }
}
