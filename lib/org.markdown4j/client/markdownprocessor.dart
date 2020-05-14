import 'package:markdown4f/markdown4f.dart';
import 'package:markdown4f/org.markdown4j/abstractmarkdownprocessor.dart';

/// @author William Shakour (billy1380)
///
class MarkdownProcessor extends AbstractMarkdownProcessor {
  @override
  EmojiEmitter emojiEmitter() {
    return DefaultEmojiEmitter();
  }

  @override
  void registerPlugins() {
    registerPluginList([]);
  }
}
