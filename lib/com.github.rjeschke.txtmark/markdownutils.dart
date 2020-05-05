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

import 'dart:math';
import 'package:markdown4f/com.github.rjeschke.txtmark/html.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/stringutils.dart';

/// Utilities.
///
/// @author René Jeschke <rene_jeschke@yahoo.de>
class MarkdownUtils {
  /// Random number generator value.
  static final Random _rnd = Random();

  /// LCG random number generator.
  ///
  /// @return A pseudo random number between 0 and 1023
  static int rnd() {
    return (_rnd.nextDouble() * 1023).toInt();
  }

  /// Skips spaces in the given String.
  ///
  /// @param in
  ///            Input String.
  /// @param start
  ///            Starting position.
  /// @return The new position or -1 if EOL has been reached.
  static int skipSpaces(final String input, final int start) {
    int pos = start;
    while (pos < input.length && (input[pos] == ' ' || input[pos] == '\n'))
      pos++;
    return pos < input.length ? pos : -1;
  }

  ///
	/// Processed the given escape sequence.
	/// 
	/// @param out
	///            The StringBuffer to write to.
	/// @param ch
	///            The character.
	/// @param pos
	///            Current parsing position.
	/// @return The new position.
	///
  static int escape(final StringBuffer out, final String ch, final int pos) {
    switch (ch) {
      case '\\':
      case '[':
      case ']':
      case '(':
      case ')':
      case '{':
      case '}':
      case '#':
      case '"':
      case '\'':
      case '.':
      case '>':
      case '<':
      case '*':
      case '+':
      case '-':
      case '_':
      case '!':
      case '`':
      case '^':
      case ':':
        out.write(ch);
        return pos + 1;
      default:
        out.write('\\');
        return pos;
    }
  }

  ///
	/// Reads characters until any 'end' character is encountered.
	/// 
	/// @param out
	///            The StringBuffer to write to.
	/// @param in
	///            The Input String.
	/// @param start
	///            Starting position.
	/// @param end
	///            End characters.
	/// @return The new position or -1 if no 'end' char was found.
	///
  static int readUntilAnyEnd(final StringBuffer out, final String input,
      final int start, final List<String> end) {
    int pos = start;
    while (pos < input.length) {
      final String ch = input[pos];
      if (ch == '\\' && pos + 1 < input.length) {
        pos = escape(out, input[pos + 1], pos);
      } else {
        bool endReached = false;
        for (int n = 0; n < end.length; n++) {
          if (ch == end[n]) {
            endReached = true;
            break;
          }
        }
        if (endReached) break;
        out.write(ch);
      }
      pos++;
    }

    return (pos == input.length) ? -1 : pos;
  }

  ///
	/// Reads characters until the 'end' character is encountered.
	/// 
	/// @param out
	///            The StringBuffer to write to.
	/// @param in
	///            The Input String.
	/// @param start
	///            Starting position.
	/// @param end
	///            End characters.
	/// @return The new position or -1 if no 'end' char was found.
	//
  static int readUntil(final StringBuffer out, final String input,
      final int start, final String end) {
    int pos = start;
    while (pos < input.length) {
      final String ch = input[pos];
      if (ch == '\\' && pos + 1 < input.length) {
        pos = escape(out, input[pos + 1], pos);
      } else {
        if (ch == end) break;
        out.write(ch);
      }
      pos++;
    }

    return (pos == input.length) ? -1 : pos;
  }

  ///
	/// Reads a markdown link.
	/// 
	/// @param out
	///            The StringBuffer to write to.
	/// @param in
	///            Input String.
	/// @param start
	///            Starting position.
	/// @return The new position or -1 if this is no valid markdown link.
	///
  static int readMdLink(
      final StringBuffer out, final String input, final int start) {
    int pos = start;
    int counter = 1;
    while (pos < input.length) {
      final String ch = input[pos];
      if (ch == '\\' && pos + 1 < input.length) {
        pos = escape(out, input[pos + 1], pos);
      } else {
        bool endReached = false;
        switch (ch) {
          case '(':
            counter++;
            break;
          case ' ':
            if (counter == 1) endReached = true;
            break;
          case ')':
            counter--;
            if (counter == 0) endReached = true;
            break;
        }
        if (endReached) break;
        out.write(ch);
      }
      pos++;
    }

    return (pos == input.length) ? -1 : pos;
  }

  ///
	/// Reads a markdown link ID.
	/// 
	/// @param out
	///            The StringBuffer to write to.
	/// @param in
	///            Input String.
	/// @param start
	///            Starting position.
	/// @return The new position or -1 if this is no valid markdown link ID.
	///
  static int readMdLinkId(
      final StringBuffer out, final String input, final int start) {
    int pos = start;
    int counter = 1;
    while (pos < input.length) {
      final String ch = input[pos];
      bool endReached = false;
      switch (ch) {
        case '\n':
          out.write(' ');
          break;
        case '[':
          counter++;
          out.write(ch);
          break;
        case ']':
          counter--;
          if (counter == 0)
            endReached = true;
          else
            out.write(ch);
          break;
        default:
          out.write(ch);
          break;
      }
      if (endReached) break;
      pos++;
    }

    return (pos == input.length) ? -1 : pos;
  }

  ///
	/// Reads characters until any 'end' character is encountered, ignoring escape sequences.
	/// 
	/// @param out
	///            The StringBuffer to write to.
	/// @param in
	///            The Input String.
	/// @param start
	///            Starting position.
	/// @param end
	///            End characters.
	/// @return The new position or -1 if no 'end' char was found.
	///
  static int readRawUntilAnyEnd(final StringBuffer out, final String input,
      final int start, final List<String> end) {
    int pos = start;
    while (pos < input.length) {
      final String ch = input[pos];
      bool endReached = false;
      for (int n = 0; n < end.length; n++) {
        if (ch == end[n]) {
          endReached = true;
          break;
        }
      }
      if (endReached) break;
      out.write(ch);
      pos++;
    }

    return (pos == input.length) ? -1 : pos;
  }

  ///
	/// Reads characters until the end character is encountered, ignoring escape sequences.
	/// 
	/// @param out
	///            The StringBuffer to write to.
	/// @param in
	///            The Input String.
	/// @param start
	///            Starting position.
	/// @param end
	///            End characters.
	/// @return The new position or -1 if no 'end' char was found.
	///
  static int readRawUntil(final StringBuffer out, final String input,
      final int start, final String end) {
    int pos = start;
    while (pos < input.length) {
      final String ch = input[pos];
      if (ch == end) break;
      out.write(ch);
      pos++;
    }

    return (pos == input.length) ? -1 : pos;
  }

  ///
	/// Appends the given string encoding special HTML characters.
	/// 
	/// @param out
	///            The StringBuffer to write to.
	/// @param in
	///            Input String.
	/// @param start
	///            Input String starting position.
	/// @param end
	///            Input String end position.
	///
  static void appendCode(final StringBuffer out, final String input,
      final int start, final int end) {
    for (int i = start; i < end; i++) {
      final String c = input[i];
      switch (c) {
        case "&":
          out.write("&amp;");
          break;
        case '<':
          out.write("&lt;");
          break;
        case '>':
          out.write("&gt;");
          break;
        default:
          out.write(c);
          break;
      }
    }
  }

  ///
	/// Appends the given string encoding special HTML characters (used in HTML attribute values).
	/// 
	/// @param out
	///            The StringBuffer to write to.
	/// @param in
	///            Input String.
	/// @param start
	///            Input String starting position.
	/// @param end
	///            Input String end position.
	///
  static void appendValue(final StringBuffer out, final String input,
      final int start, final int end) {
    for (int i = start; i < end; i++) {
      final String c = input[i];
      switch (c) {
        case '&':
          out.write("&amp;");
          break;
        case '<':
          out.write("&lt;");
          break;
        case '>':
          out.write("&gt;");
          break;
        case '"':
          out.write("&quot;");
          break;
        case '\'':
          out.write("&apos;");
          break;
        default:
          out.write(c);
          break;
      }
    }
  }

  ///
	/// Append the given char as a decimal HTML entity.
	/// 
	/// @param out
	///            The StringBuffer to write to.
	/// @param value
	///            The character.
	///
  static void appendDecEntity(final StringBuffer out, final String value) {
    out.write("&#");
    for (int i in value.codeUnits) {
      out.write(i);
    }
    out.write(';');
  }

  ///
	/// Append the given char as a hexadecimal HTML entity.
	/// 
	/// @param out
	///            The StringBuffer to write to.
	/// @param value
	///            The character.
	///
  static void appendHexEntity(final StringBuffer out, final String value) {
    out.write("&#x");
    for (int i in value.codeUnits) {
      out.write(i.toRadixString(16));
    }
    out.write(';');
  }

  ///
	/// Appends the given mailto link using obfuscation.
	/// 
	/// @param out
	///            The StringBuffer to write to.
	/// @param in
	///            Input String.
	/// @param start
	///            Input String starting position.
	/// @param end
	///            Input String end position.
	///
  static void appendMailto(final StringBuffer out, final String input,
      final int start, final int end) {
    for (int i = start; i < end; i++) {
      final String c = input[i];
      final int r = rnd();
      switch (c) {
        case '&':
        case '<':
        case '>':
        case '"':
        case '\'':
        case '@':
          if (r < 512)
            appendDecEntity(out, c);
          else
            appendHexEntity(out, c);
          break;
        default:
          if (r < 32)
            out.write(c);
          else if (r < 520)
            appendDecEntity(out, c);
          else
            appendHexEntity(out, c);
          break;
      }
    }
  }

  ///
	/// Extracts the tag from an XML element.
	/// 
	/// @param out
	///            The StringBuffer to write to.
	/// @param in
	///            Input StringBuffer.
	///
  static void getXMLTag(final StringBuffer out, final StringBuffer input) {
    int pos = 1;
    String inputString = input.toString();
    if (inputString[1] == '/') pos++;
    while (inputString[pos].isLetterOrDigit) {
      out.write(inputString[pos++]);
    }
  }

  ///
	/// Extracts the tag from an XML element.
	/// 
	/// @param out
	///            The StringBuffer to write to.
	/// @param in
	///            Input String.
	///
  static void getXMLTagString(final StringBuffer out, final String input) {
    int pos = 1;
    if (input[1] == '/') pos++;
    while (input[pos].isLetterOrDigit) {
      out.write(input[pos++]);
    }
  }

  ///
	/// Reads an XML element.
	/// 
	/// @param out
	///            The StringBuffer to write to.
	/// @param in
	///            Input String.
	/// @param start
	///            Starting position.
	/// @param safeMode
	///            Whether to escape unsafe HTML tags or not
	/// @return The new position or -1 if this is no valid XML element.
	///
  static int readXML(final StringBuffer out, final String input,
      final int start, final bool safeMode) {
    int pos;
    bool isCloseTag;
    try {
      if (input[start + 1] == '/') {
        isCloseTag = true;
        pos = start + 2;
      } else if (input[start + 1] == '!') {
        out.write("<!");
        return start + 1;
      } else {
        isCloseTag = false;
        pos = start + 1;
      }
      if (safeMode) {
        final StringBuffer temp = StringBuffer();
        pos = readRawUntilAnyEnd(temp, input, pos, [' ', '/', '>']);
        if (pos == -1) return -1;
        final String tag = temp.toString().trim().toLowerCase();
        if (HTML.isUnsafeHtmlElement(tag)) {
          out.write("&lt;");
          if (isCloseTag) out.write('/');
          out.write(temp);
        }
      } else {
        out.write('<');
        if (isCloseTag) out.write('/');
        pos = readRawUntilAnyEnd(out, input, pos, [' ', '/', '>']);
      }
      if (pos == -1) return -1;
      pos = readRawUntilAnyEnd(out, input[pos], pos, ['/', '>']);
      if (input[pos] == '/') {
        out.write(" /");
        pos = readRawUntilAnyEnd(out, input[pos], pos + 1, ['>']);
        if (pos == -1) return -1;
      }
      if (input[pos] == '>') {
        out.write('>');
        return pos;
      }
    } on /* String out of bounds */ Exception {
      return -1;
    }
    return -1;
  }

  ///
	/// Appends the given string to the given StringBuffer, replacing '&amp;', '&lt;' and '&gt;' by their respective HTML entities.
	/// 
	/// @param out
	///            The StringBuffer to append to.
	/// @param value
	///            The string to append.
	/// @param offset
	///            The character offset into value from where to start
	///
  static void codeEncode(StringBuffer out, String value, int offset) {
    for (int i = offset; i < value.length; i++) {
      final String c = value[i];
      switch (c) {
        case '&':
          out.write("&amp;");
          break;
        case '<':
          out.write("&lt;");
          break;
        case '>':
          out.write("&gt;");
          break;
        default:
          out.write(c);
      }
    }
  }

  ///
	/// Removes trailing <code>`</code> and trims spaces.
	/// 
	/// @param fenceLine
	///            Fenced code block starting line
	/// @return Rest of the line after trimming and backtick removal
	/// @since 0.7
	///
  static String getMetaFromFence(String fenceLine) {
    for (int i = 0; i < fenceLine.length; i++) {
      final String c = fenceLine[i];
      if (!c.isSpace && c != '`' && c != '~' && c != '%') {
        return fenceLine.substring(i).trim();
      }
    }
    return "";
  }

  ///
	/// Convert space delimited key=value parameters into a map
	/// 
	/// @param s
	/// @return
	///
  static Map<String, String> parseParams(String s) {
    Map<String, String> params = <String, String>{};
    RegExp regExp = RegExp("(\\w+)=((?=\")[^\"]+(?=\")|([^\\s]+))");

    Iterator<Match> matches = regExp.allMatches(s).iterator;
    Match m;
    while (matches.moveNext()) {
      m = matches.current;
      params[m.group(1)] = m.group(2);
    }

    return params;
  }
}
