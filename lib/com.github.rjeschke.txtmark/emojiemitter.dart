//
//  EmojiEmitter.java
//  markdown4j-gwt
//
//  Created by William Shakour (billy1380) on 18 Jan 2015.
//  Copyright © 2015 WillShex Limited. All rights reserved.
//

import 'package:markdown4f/com.github.rjeschke.txtmark/decorator.dart';

/// @author William Shakour (billy1380)
///
abstract class EmojiEmitter {
  /// Emits an img with an emoji element.
  ///
  /// @param out
  ///            The StringBuffer to append to.
  /// @param content
  ///            The emoji name.
  ///
  /// @param decorator
  ///            The decorator in case we need to emit markup
  void emitEmoji(StringBuffer out, String name, Decorator decorator);
}
