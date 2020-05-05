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

import 'package:markdown4f/com.github.rjeschke.txtmark/block.dart';

/// Decorator interface.
///
/// @author René Jeschke <rene_jeschke@yahoo.de>
abstract class Decorator {
  /// Called when a paragraph is opened.
  ///
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code>out.write("&lt;p>");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param block
  void openParagraph(StringBuffer out, Block block);

  /// Called when a paragraph is closed.
  ///
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code>out.write("&lt;/p>\n");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param block
  void closeParagraph(StringBuffer out, Block block);

  /// Called when a blockquote is opened.
  ///
  /// Default implementation is:
  ///
  /// <pre>
  /// <code>out.write("&lt;blockquote>");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param block
  void openBlockquote(StringBuffer out, Block block);

  /// Called when a blockquote is closed.
  ///
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code>out.write("&lt;/blockquote>\n");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param block
  void closeBlockquote(StringBuffer out, Block block);

  /// Called when a code block is opened.
  ///
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code>out.write("&lt;pre>&lt;code>");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param block
  void openCodeBlock(StringBuffer out, Block block);

  /// Called when a code block is closed.
  ///
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code>out.write("&lt;/code>&lt;/pre>\n");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param block
  void closeCodeBlock(StringBuffer out, Block block);

  /// Called when a code span is opened.
  ///
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code>out.write("&lt;code>");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  void openCodeSpan(StringBuffer out);

  /// Called when a code span is closed.
  ///
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code>out.write("&lt;/code>");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  void closeCodeSpan(StringBuffer out);

  /// Called when a headline is opened.
  ///
  /// <p>
  /// <strong>Note:</strong> Don't close the HTML tag!
  /// </p>
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code> out.write("&lt;h");
  /// out.write(level);</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  void openHeadline(StringBuffer out, Block block);

  /// Called when a headline is closed.
  ///
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code> out.write("&lt;/h");
  /// out.write(level);
  /// out.write(">\n");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  void closeHeadline(StringBuffer out, Block block);

  /// Called when a strong span is opened.
  ///
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code>out.write("&lt;strong>");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param value
  void openStrong(StringBuffer out, String value);

  /// Called when a strong span is closed.
  ///
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code>out.write("&lt;/strong>");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param value
  void closeStrong(StringBuffer out, String value);

  /// Called when a strike span is opened.
  ///
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code>out.write("&lt;s>");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param value
  void openStrike(StringBuffer out, String value);

  /// Called when a strike span is closed.
  ///
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code>out.write("&lt;/s>");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param value
  void closeStrike(StringBuffer out, String value);

  /// Called when an emphasis span is opened.
  ///
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code>out.write("&lt;em>");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param value
  void openEmphasis(StringBuffer out, String value);

  /// Called when an emphasis span is closed.
  ///
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code>out.write("&lt;/em>");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param value
  void closeEmphasis(StringBuffer out, String value);

  /// Called when a superscript span is opened.
  ///
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code>out.write("&lt;sup>");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param value
  void openSuper(StringBuffer out, String value);

  /// Called when a superscript span is closed.
  ///
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code>out.write("&lt;/sup>");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param value
  void closeSuper(StringBuffer out, String value);

  /// Called when an ordered list is opened.
  ///
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code>out.write("&lt;ol>\n");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param block
  void openOrderedList(StringBuffer out, Block block);

  /// Called when an ordered list is closed.
  ///
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code>out.write("&lt;/ol>\n");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param block
  void closeOrderedList(StringBuffer out, Block block);

  /// Called when an unordered list is opened.
  ///
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code>out.write("&lt;ul>\n");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param block
  void openUnorderedList(StringBuffer out, Block block);

  /// Called when an unordered list is closed.
  ///
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code>out.write("&lt;/ul>\n");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param block
  void closeUnorderedList(StringBuffer out, Block block);

  /// Called when a list item is opened.
  ///
  /// <p>
  /// <strong>Note:</strong> Don't close the HTML tag!
  /// </p>
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code>out.write("&lt;li");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param block
  void openListItem(StringBuffer out, Block block);

  /// Called when a list item is closed.
  ///
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code>out.write("&lt;/li>\n");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param block
  void closeListItem(StringBuffer out, Block block);

  /// Called when a horizontal ruler is encountered.
  ///
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code>out.write("&lt;hr />\n");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param block
  void horizontalRuler(StringBuffer out, Block block);

  /// Called when a link is opened.
  ///
  /// <p>
  /// <strong>Note:</strong> Don't close the HTML tag!
  /// </p>
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code>out.write("&lt;a");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param title
  /// @param link
  void openLink(StringBuffer out, String link, String title);

  /// Called when an image is opened.
  ///
  /// <p>
  /// <strong>Note:</strong> Don't close the HTML tag!
  /// </p>
  /// <p>
  /// Default implementation is:
  /// </p>
  ///
  /// <pre>
  /// <code>out.write("&lt;img");</code>
  /// </pre>
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param title
  /// @param link
  void openImage(StringBuffer out, String link, String title);
}
