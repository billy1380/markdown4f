import 'package:http/http.dart' as http;
import 'package:markdown4f/markdown4f.dart';

/// @author William Shakour (billy1380)
///
class MarkdownProcessor extends AbstractMarkdownProcessor {
  final http.Client? client;
  final bool includeEnabled;

  MarkdownProcessor({this.client, this.includeEnabled = true});

  @override
  EmojiEmitter emojiEmitter() {
    return DefaultEmojiEmitter();
  }

  @override
  void registerPlugins() {
    List<Plugin> plugins = [
      YumlPlugin(),
      WebSequencePlugin(client: client),
      TablePlugin(),
      GalleryPlugin(),
    ];

    if (includeEnabled) {
      plugins.add(IncludePlugin(client: client));
    }

    registerPluginList(plugins);
  }
}
