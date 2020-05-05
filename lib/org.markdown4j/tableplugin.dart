import 'package:markdown4f/org.markdown4j/plugin.dart';

class TablePlugin extends Plugin {
//	| Tables   |      Are      |  Cool |
//	|----------|:-------------:|------:|
//	| col 1 is |  left-aligned | $1600 |
//	| col 2 is |    centered   |   $12 |
//	| col 3 is | right-aligned |    $1 |

  TablePlugin() : super("table");

  int _findSeparatorLine(int beginIndex, List<String> lines) {
    for (int i = beginIndex; i < lines.length; i++) {
//			String line = lines.get(i);
//			if(Pattern.matches("- ", line)) {
//				return i;
//			}
    }
    return -1;
  }

  @override
  void emit(StringBuffer out, List<String> lines, Map<String, String> params) {
//		StringBuffer sb2 = StringBuffer();
//		String lparams;
    int ioh = _findSeparatorLine(0, lines);
//		String headerLine;
//		String footerLine;
    if (ioh != -1) {
//			headerLine = lines.get(ioh);
      int iof = _findSeparatorLine(ioh, lines);
      if (iof != -1) {
//				footerLine = lines.get(iof);
      }
    }
  }
}
