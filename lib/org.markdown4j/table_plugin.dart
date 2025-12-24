import 'package:markdown4f/org.markdown4j/plugin.dart';

class TablePlugin extends Plugin {
//	| Tables   |      Are      |  Cool |
//	|----------|:-------------:|------:|
//	| col 1 is |  left-aligned | $1600 |
//	| col 2 is |    centered   |   $12 |
//	| col 3 is | right-aligned |    $1 |

  TablePlugin() : super("table");

  @override
  Future<void> emit(
      StringBuffer out, List<String> lines, Map<String, String> params) async {
    if (lines.isEmpty) return;

    List<String> headers = [];
    List<String> align = [];
    List<List<String>> body = [];

    // Find separator line
    int separatorIndex = -1;
    for (int i = 0; i < lines.length; i++) {
      String line = lines[i].trim();
      // Simple regex to detect separator like |---|---| or |:---|---:|
      if (RegExp(r'^\|?(\s*:?-+:?\s*\|?)+\s*$').hasMatch(line)) {
        separatorIndex = i;
        break;
      }
    }

    if (separatorIndex == -1) {
      // Treat as regular paragraph or ignore?
      // Since this is a plugin block, we should probably just emit the lines as text if it's not a table?
      // Or strict mode: no table.
      for (var line in lines) {
        out.write(line);
        out.write("\n");
      }
      return;
    }

    // Parse separator to get alignment
    List<String> separatorParts = _splitRow(lines[separatorIndex]);
    for (String part in separatorParts) {
      part = part.trim();
      if (part.isEmpty) continue;
      if (part.startsWith(":") && part.endsWith(":")) {
        align.add("center");
      } else if (part.endsWith(":")) {
        align.add("right");
      } else {
        align.add("left");
      }
    }

    // Parse header
    if (separatorIndex > 0) {
      // Assuming single line header for now
      headers = _splitRow(lines[0]);
    }

    // Parse body
    for (int i = separatorIndex + 1; i < lines.length; i++) {
      if (lines[i].trim().isEmpty) continue;
      body.add(_splitRow(lines[i]));
    }

    // Emit HTML
    out.write("<table>");
    if (headers.isNotEmpty) {
      out.write("<thead><tr>");
      for (int i = 0; i < headers.length; i++) {
        if (headers[i].trim().isEmpty && i >= align.length) continue;
        String alignment = (i < align.length) ? align[i] : "left";
        out.write(
            "<th align=\"" + alignment + "\">" + headers[i].trim() + "</th>");
      }
      out.write("</tr></thead>");
    }

    if (body.isNotEmpty) {
      out.write("<tbody>");
      for (List<String> row in body) {
        out.write("<tr>");
        for (int i = 0; i < row.length; i++) {
          if (row[i].trim().isEmpty && i >= align.length) continue;
          String alignment = (i < align.length) ? align[i] : "left";
          String cellContent = row[i].trim();
          out.write("<td align=\"" + alignment + "\">" + cellContent + "</td>");
        }
        out.write("</tr>");
      }
      out.write("</tbody>");
    }
    out.write("</table>");
  }

  List<String> _splitRow(String row) {
    row = row.trim();
    if (row.startsWith("|")) row = row.substring(1);
    if (row.endsWith("|")) row = row.substring(0, row.length - 1);
    return row.split("|");
  }
}
