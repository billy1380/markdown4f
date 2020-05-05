import 'package:markdown4f/com.github.rjeschke.txtmark/blockemitter.dart';

class CodeBlockEmitter implements BlockEmitter {
  @override
  void emitBlock(StringBuffer out, List<String> lines, String meta) {
    out.write("<pre><code");
    if (meta.length > 0) {
      out.write(" class=\"" + meta + "\"");
    }
    out.write(">");
    for (final String s in lines) {
      for (int i = 0; i < s.length; i++) {
        final String c = s[i];
        switch (c) {
          case '&':
            out.write("&amp;");
            break;
          case '<':
            out.write("&lt;");
            break;
          case '>':
            out.write("&gt;");
            break;
          default:
            out.write(c);
            break;
        }
      }
      out.write('\n');
    }
    out.write("</code></pre>\n");
  }
}
