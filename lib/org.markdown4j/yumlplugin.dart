import 'package:markdown4f/org.markdown4j/plugin.dart';

class YumlPlugin extends Plugin {
  YumlPlugin() : super("yuml");

  @override
  void emit(final StringBuffer out, final List<String> lines,
      final Map<String, String> params) {
    StringBuffer sb2 = StringBuffer();
    for (String line in lines) {
      line = line.trim();
      if (line.length > 0) {
        if (sb2.length > 0) {
          sb2.write(", ");
        }
        sb2.write(line);
      }
    }

    String? type = params["type"];
    if (type == null) {
      type = "class";
    }
    String? style = params["style"];
    if (style == null) {
      style = "scruffy";
    }
    String? dir = params["dir"];
    if (dir != null) {
      style = style + ";dir:" + dir;
    }
    String? scale = params["scale"];
    if (scale != null) {
      style = style + ";scale:" + scale;
    }
    String? format = params["format"];

    out.write("<img src=\"http://yuml.me/diagram/" + style + "/" + type + "/");
    out.write(sb2.toString());
    if (format != null) {
      out.write("." + format);
    }
    out.write("\"/>");
  }
}
