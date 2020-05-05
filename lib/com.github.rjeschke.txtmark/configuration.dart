/*
 * Copyright (C) 2011 René Jeschke <rene_jeschke@yahoo.de>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:markdown4f/com.github.rjeschke.txtmark/blockemitter.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/decorator.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/defaultdecorator.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/emojiemitter.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/spanemitter.dart';
import 'package:markdown4f/org.markdown4j/plugin.dart';

///
/// Txtmark configuration.
///
/// @author René Jeschke <rene_jeschke@yahoo.de>
/// @since 0.7
///
class Configuration {
  final bool safeMode;
  final String encoding;
  final Decorator decorator;
  final BlockEmitter codeBlockEmitter;
  final EmojiEmitter emojiEmitter;
  final bool forceExtendedProfile;
  final bool convertNewline2Br;
  final SpanEmitter specialLinkEmitter;
  final List<Plugin> plugins;

  ///
  /// <p>
  /// This is the default configuration for txtmark's <code>process</code>
  /// methods
  /// </p>
  ///
  /// <ul>
  /// <li><code>safeMode = false</code></li>
  /// <li><code>encoding = UTF-8</code></li>
  /// <li><code>decorator = DefaultDecorator</code></li>
  /// <li><code>codeBlockEmitter</code></li>
  /// <li><code>emojiEmitter</code></li>
  /// </ul>
  ///
  static final Configuration defaultConfig = Configuration.builder().build();

  ///
  /// <p>
  /// Default safe configuration
  /// </p>
  ///
  /// <ul>
  /// <li><code>safeMode = true</code></li>
  /// <li><code>encoding = UTF-8</code></li>
  /// <li><code>decorator = DefaultDecorator</code></li>
  /// <li><code>codeBlockEmitter</code></li>
  /// </ul>
  ///
  static final Configuration defaultSafeConfig =
      Configuration.builder().enableSafeMode().build();

  ///
  /// Constructor.
  ///
  /// @param safeMode
  /// @param encoding
  /// @param decorator
  /// @param codeBlockEmitter
  /// @param forceExtendedProfile
  /// @param convertNewline2Br
  /// @param specialLinkEmitter
  /// @param emojiEmitter
  /// @param plugins
  ///
  Configuration(
      this.safeMode,
      this.encoding,
      this.decorator,
      this.codeBlockEmitter,
      this.forceExtendedProfile,
      this.convertNewline2Br,
      this.specialLinkEmitter,
      this.emojiEmitter,
      this.plugins);

  ///
  /// Creates a new Builder instance.
  ///
  /// @return A new Builder instance.
  ///
  static Builder builder() {
    return Builder();
  }
}

///
/// Configuration builder.
///
/// @author René Jeschke <rene_jeschke@yahoo.de>
/// @since 0.7
///
class Builder {
  bool _safeMode = false;
  bool _forceExtendedProfile = false;
  bool _convertNewline2Br = false;
  String _encoding = "UTF-8";
  Decorator _decorator = DefaultDecorator();
  BlockEmitter _codeBlockEmitter;
  SpanEmitter _specialLinkEmitter;
  EmojiEmitter _emojiEmitter;
  List<Plugin> _plugins = <Plugin>[];

  ///
  /// Enables HTML safe mode.
  ///
  /// Default: <code>false</code>
  ///
  /// @return This builder
  /// @since 0.7
  ///
  Builder enableSafeMode() {
    this._safeMode = true;
    return this;
  }

  ///
  /// Forces extened profile to be enabled by default.
  ///
  /// @return This builder.
  /// @since 0.7
  ///
  Builder forceExtentedProfile() {
    this._forceExtendedProfile = true;
    return this;
  }

  ///
  /// convertNewline2Br.
  ///
  /// @return This builder.
  ///
  Builder convertNewline2Br() {
    this._convertNewline2Br = true;
    return this;
  }

  ///
  /// Sets the HTML safe mode flag.
  ///
  /// Default: <code>false</code>
  ///
  /// @param flag
  ///            <code>true</code> to enable safe mode
  /// @return This builder
  /// @since 0.7
  ///
  Builder setSafeMode(bool flag) {
    this._safeMode = flag;
    return this;
  }

  ///
  /// Sets the character encoding for txtmark.
  ///
  /// Default: <code>&quot;UTF-8&quot;</code>
  ///
  /// @param encoding
  ///            The encoding
  /// @return This builder
  /// @since 0.7
  ///
  Builder setEncoding(String encoding) {
    this._encoding = encoding;
    return this;
  }

  ///
  /// Sets the decorator for txtmark.
  ///
  /// Default: <code>DefaultDecorator()</code>
  ///
  /// @param decorator
  ///            The decorator
  /// @return This builder
  /// @see DefaultDecorator
  /// @since 0.7
  ///
  Builder setDecorator(Decorator decorator) {
    this._decorator = decorator;
    return this;
  }

  ///
  /// Sets the code block emitter.
  ///
  /// Default: <code>null</code>
  ///
  /// @param emitter
  ///            The BlockEmitter
  /// @return This builder
  /// @see BlockEmitter
  /// @since 0.7
  ///
  Builder setCodeBlockEmitter(BlockEmitter emitter) {
    this._codeBlockEmitter = emitter;
    return this;
  }

  ///
  /// Sets the emitter for special link spans ([[ ... ]]).
  ///
  /// @param emitter
  ///            The emitter.
  /// @return This builder.
  /// @since 0.7
  ///
  Builder setSpecialLinkEmitter(SpanEmitter emitter) {
    this._specialLinkEmitter = emitter;
    return this;
  }

  ///
  /// Sets the emoji emitter (:alias:).
  ///
  /// @param emitter
  ///            The emitter.
  /// @return This builder.
  ///
  Builder setEmojiEmitter(EmojiEmitter emitter) {
    this._emojiEmitter = emitter;
    return this;
  }

  ///
  /// Sets the plugins.
  ///
  /// @param plugins
  ///            The plugins.
  /// @return This builder.
  ///
  Builder registerPlugins(List<Plugin> plugins) {
    for (Plugin plugin in plugins) {
      if (plugin != null) {
        this._plugins.add(plugin);
      }
    }
    return this;
  }

  ///
  /// Builds a configuration instance.
  ///
  /// @return a Configuration instance
  /// @since 0.7
  ///
  Configuration build() {
    return Configuration(
        this._safeMode,
        this._encoding,
        this._decorator,
        this._codeBlockEmitter,
        this._forceExtendedProfile,
        this._convertNewline2Br,
        this._specialLinkEmitter,
        this._emojiEmitter,
        this._plugins);
  }

  Decorator getDecorator() {
    return _decorator;
  }
}
