import 'package:markdown4f/com.github.rjeschke.txtmark/block.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/defaultdecorator.dart';
import 'package:markdown4f/org.markdown4j/htmlattributes.dart';

class ExtDecorator extends DefaultDecorator {
  HtmlAttributes _attributes = HtmlAttributes();

  ExtDecorator addHtmlAttribute(String name, String value, List<String> tags) {
    for (String tag in tags) _attributes.put(tag, name, value);
    return this;
  }

  ExtDecorator addStyleClass(String styleClass, List<String> tags) {
    for (String tag in tags) _attributes.put(tag, "class", styleClass);
    return this;
  }

  ExtDecorator useCompactStyle() {
    _attributes.put("p", "style", "font-size:100%; padding:0px; margin:0px;");
    _attributes.put("a", "style", "font-size:100%; padding:0px; margin:0px;");
    _attributes.put("h1", "style", "font-size:100%; padding:0px; margin:0px;");
    _attributes.put("h2", "style", "font-size:100%; padding:0px; margin:0px;");
    _attributes.put("h3", "style", "font-size:100%; padding:0px; margin:0px;");
    _attributes.put("h4", "style", "font-size:100%; padding:0px; margin:0px;");
    _attributes.put("h5", "style", "font-size:100%; padding:0px; margin:0px;");
    _attributes.put("h6", "style", "font-size:100%; padding:0px; margin:0px;");
    _attributes.put("ul", "style", "font-size:100%; padding:0px; margin:0px;");
    _attributes.put("ol", "style", "font-size:100%; padding:0px; margin:0px;");
    _attributes.put("li", "style", "font-size:100%; padding:0px; margin:0px;");
    return this;
  }

  bool _open(StringBuffer out, String tagName, [bool closed = true]) {
    Map<String, String>? atts = _attributes[tagName];
    if (atts != null) {
      out.write("<");
      out.write(tagName);
      Iterator<String> it = atts.keys.iterator;
      while (it.moveNext()) {
        String key = it.current;
        String? value = atts[key];
        out.write(" ");
        out.write(key);
        out.write("=\"");
        out.write(value);
        out.write("\"");
        out.write(" ");
      }
      if (closed) {
        out.write(">");
      }
      return true;
    }
    return false;
  }

  @override
  void openParagraph(StringBuffer out, Block block) {
    if (!_open(out, "p")) super.openParagraph(out, block);
  }

  @override
  void openBlockquote(StringBuffer out, Block block) {
    if (!_open(out, "blockquote")) super.openBlockquote(out, block);
  }

  @override
  void openCodeBlock(StringBuffer out, Block block) {
    if (!_open(out, "pre")) super.openCodeBlock(out, block);
  }

  @override
  void openCodeSpan(StringBuffer out) {
    if (!_open(out, "code")) super.openCodeSpan(out);
  }

  @override
  void openHeadline(StringBuffer out, Block block) {
    if (!_open(out, "h${block.hlDepth}", false)) super.openHeadline(out, block);
  }

  @override
  void openStrong(StringBuffer out, String value) {
    if (!_open(out, "strong")) super.openStrong(out, value);
  }

  @override
  void openStrike(StringBuffer out, String value) {
    if (!_open(out, "s")) super.openStrike(out, value);
  }

  @override
  void openEmphasis(StringBuffer out, String value) {
    if (!_open(out, "em")) super.openEmphasis(out, value);
  }

  @override
  void openSuper(StringBuffer out, String value) {
    if (!_open(out, "super")) super.openSuper(out, value);
  }

  @override
  void openOrderedList(StringBuffer out, Block block) {
    if (!_open(out, "ol")) super.openOrderedList(out, block);
  }

  @override
  void openUnorderedList(StringBuffer out, Block block) {
    if (!_open(out, "ul")) super.openUnorderedList(out, block);
  }

  @override
  void openListItem(StringBuffer out, Block block) {
    if (!_open(out, "li", false)) super.openListItem(out, block);
  }

  @override
  void horizontalRuler(StringBuffer out, Block block) {
    if (_open(out, "hr", false)) {
      out.write("/>");
    } else {
      super.horizontalRuler(out, block);
    }
  }

  @override
  void openLink(StringBuffer out, String link, String title) {
    if (!_open(out, "a", false)) super.openLink(out, link, title);
  }

  @override
  void openImage(StringBuffer out, String link, String title) {
    if (!_open(out, "img", false)) super.openImage(out, link, title);
  }

//	@override
//	public void openLink(StringBuffer out) {
//		out.write("<a target=\"_blank\" ");
//	}
//
//	@override
//	public void openBlockquote(StringBuffer out) {
//		out.write("<blockquote style=\"color:red;\">");
//	}
//
//	@override
//	public void openParagraph(StringBuffer out) {
//		if(useCompactStyle) {
//          out.write("<p style=\"font-size:100%; padding:0px; margin:0px;\">");
//		}
//		else {
//			super.openParagraph(out);
//		}
//	}
//
//	@override
//	public void openHeadline(StringBuffer out, int level) {
//		super.openHeadline(out, level);
//		if(useCompactStyle) {
//	        out.write(" style=\"font-size:100%; padding:0px; margin:0px;\"");
//		}
//	}
//
//	@override
//	public void openOrderedList(StringBuffer out) {
//		if(useCompactStyle) {
//	        openParagraph(out);
//		}
//		else {
//			super.openOrderedList(out);
//		}
//	}
//
//	@override
//	public void openUnorderedList(StringBuffer out) {
//		if(useCompactStyle) {
//	        openParagraph(out);
//		}
//		else {
//			super.openUnorderedList(out);
//		}
//	}
//
//	@override
//	public void openListItem(StringBuffer out) {
//		if(useCompactStyle) {
//			openParagraph(out);
//			out.write(" * ");
//		}
//		else {
//			super.openListItem(out);
//		}
//	}
//
//	@override
//	public void closeOrderedList(StringBuffer out) {
//		if(useCompactStyle) {
//	        closeParagraph(out);
//		}
//		else {
//			super.closeOrderedList(out);
//		}
//	}
//
//	@override
//	public void closeUnorderedList(StringBuffer out) {
//		if(useCompactStyle) {
//	        closeParagraph(out);
//		}
//		else {
//			super.closeUnorderedList(out);
//		}
//	}
//
//	@override
//	public void closeListItem(StringBuffer out) {
//		if(useCompactStyle) {
//	        closeParagraph(out);
//		}
//		else {
//			super.closeListItem(out);
//		}
//	}
//
}
