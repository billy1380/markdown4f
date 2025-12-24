import 'package:markdown4f/com.github.rjeschke.txtmark/configuration.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/emoji_emitter.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/processor.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/span_emitter.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/string_utils.dart';
import 'package:markdown4f/org.markdown4j/code_block_emitter.dart';
import 'package:markdown4f/org.markdown4j/ext_decorator.dart';
import 'package:markdown4f/org.markdown4j/plugin.dart';
import 'package:markdown4f/org.markdown4j/yuml_plugin.dart';

abstract class AbstractMarkdownProcessor {
  late Builder _builder;
  late ExtDecorator _decorator;

  void registerPlugins();

  EmojiEmitter? emojiEmitter() {
    return null;
  }

  SpanEmitter? spanEmitter() {
    return null;
  }

  CodeBlockEmitter codeBlockEmitter() {
    return new CodeBlockEmitter();
  }

  AbstractMarkdownProcessor() {
    this._builder = builder();
    registerPlugins();
  }

  Builder builder() {
    _decorator = ExtDecorator();

    return Configuration.builder()
        .forceExtentedProfile()
        .convertNewline2Br()
        .registerPlugins([YumlPlugin()])
        .setDecorator(_decorator)
        .setCodeBlockEmitter(codeBlockEmitter())
        .setSpecialLinkEmitter(spanEmitter())
        .setEmojiEmitter(emojiEmitter());
  }

  AbstractMarkdownProcessor registerPluginList(List<Plugin> plugins) {
    _builder.registerPlugins(plugins);
    return this;
  }

  AbstractMarkdownProcessor setDecorator(ExtDecorator decorator) {
    this._decorator = decorator;
    _builder.setDecorator(decorator);
    return this;
  }

  AbstractMarkdownProcessor addHtmlAttribute(
      String name, String value, List<String> tags) {
    _decorator.addHtmlAttribute(name, value, tags);
    return this;
  }

  AbstractMarkdownProcessor addStyleClass(
      String styleClass, List<String> tags) {
    _decorator.addStyleClass(styleClass, tags);
    return this;
  }

  Future<String> processReader(Reader reader) async {
    return Processor.processReaderWithConfig(reader, _builder.build());
  }

  Future<String> processString(String input) async {
    return Processor.processStringWithConfig(input, _builder.build());
  }
}
