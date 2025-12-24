import 'package:markdown4f/org.markdown4j/plugin.dart';

class GalleryPlugin extends Plugin {
  GalleryPlugin() : super("gallery");

  @override
  Future<void> emit(
      StringBuffer out, List<String> lines, Map<String, String> params) async {
    out.write('<div class="gallery">');
    for (String line in lines) {
      line = line.trim();
      if (line.isEmpty) continue;

      // Parse line: url "title"
      String url = line;
      String? title;

      int firstQuote = line.indexOf('"');
      if (firstQuote != -1) {
        int lastQuote = line.lastIndexOf('"');
        if (lastQuote > firstQuote) {
          url = line.substring(0, firstQuote).trim();
          title = line.substring(firstQuote + 1, lastQuote);
        }
      }

      out.write('<div class="gallery-item">');
      out.write('<img src="$url"');
      if (title != null) {
        out.write(' alt="$title" title="$title"');
      }
      out.write('/>');
      if (title != null) {
        out.write('<span class="caption">$title</span>');
      }
      out.write('</div>');
    }
    out.write('</div>');
  }
}
