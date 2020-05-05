import 'package:markdown4f/com.github.rjeschke.txtmark/configuration.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/emojiemitter.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/processor.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/spanemitter.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/stringutils.dart';
import 'package:markdown4f/org.markdown4j/codeblockemitter.dart';
import 'package:markdown4f/org.markdown4j/extdecorator.dart';
import 'package:markdown4f/org.markdown4j/plugin.dart';
import 'package:markdown4f/org.markdown4j/yumlplugin.dart';

abstract class AbstractMarkdownProcessor {
  Builder _builder;
  ExtDecorator _decorator;

  void registerPlugins();

  EmojiEmitter emojiEmitter() {
    return null;
  }

  SpanEmitter spanEmitter() {
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

  String processReader(Reader reader) {
    return Processor.processReaderWithConfig(reader, _builder.build());
  }

  String processString(String input) {
    return Processor.processStringWithConfig(input, _builder.build());
  }
}
