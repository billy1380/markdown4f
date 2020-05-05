class HtmlAttributes {
  Map<String, Map<String, String>> _attsByTag = <String, Map<String, String>>{};

  HtmlAttributes put(String tagName, String attName, String attValue) {
    Map<String, String> atts = _attsByTag[tagName];
    if (atts == null) {
      atts = <String, String>{};
      _attsByTag[tagName] = atts;
    }
    atts[attName] = attValue;
    return this;
  }

  Map<String, String> operator [](String tagName) {
    return _attsByTag[tagName];
  }
}
