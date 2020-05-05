abstract class Plugin {
  String _idPlugin;

  Plugin(this._idPlugin);

  void emit(StringBuffer out, List<String> lines, Map<String, String> params);

  String get idPlugin {
    return _idPlugin;
  }
}
