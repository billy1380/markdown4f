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

import 'package:markdown4f/com.github.rjeschke.txtmark/html.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/linetype.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/markdownutils.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/stringutils.dart';

///
/// This class represents a text line.
///
/// <p>
/// It also provides methods for processing and analyzing a line.
/// </p>
///
/// @author René Jeschke <rene_jeschke@yahoo.de>
///
class Line {
  /// Current cursor position.
  int pos;

  /// Leading and trailing spaces.
  int leading = 0, trailing = 0;

  /// Is this line empty?
  bool isEmpty = true;

  /// This line's value.
  String value;

  /// Previous and next line.
  Line previous, next;

  /// Is previous/next line empty?
  bool prevEmpty, nextEmpty;

  /// Final line of a XML block.
  Line xmlEndLine;

  ///
  /// Calculates leading and trailing spaces. Also sets empty if needed.
  ///
  void init() {
    this.leading = 0;
    while (this.leading < this.value.length && this.value[this.leading] == ' ')
      this.leading++;

    if (this.leading == this.value.length) {
      this.setEmpty();
    } else {
      this.isEmpty = false;
      this.trailing = 0;
      while (this.value[this.value.length - this.trailing - 1] == ' ')
        this.trailing++;
    }
  }

  ///
  /// Recalculate leading spaces.
  ///
  void initLeading() {
    this.leading = 0;
    while (this.leading < this.value.length && this.value[this.leading] == ' ')
      this.leading++;

    if (this.leading == this.value.length) {
      this.setEmpty();
    }
  }

  ///
  /// Skips spaces.
  ///
  /// @return <code>false</code> if end of line is reached
  ///
  // TODO use Util#skipSpaces
  bool skipSpaces() {
    while (this.pos < this.value.length && this.value[this.pos] == ' ')
      this.pos++;
    return this.pos < this.value.length;
  }

  ///
  /// Reads chars from this line until any 'end' char is reached.
  ///
  /// @param end
  ///            Delimiting character(s)
  /// @return The read String or <code>null</code> if no 'end' char was
  ///         reached.
  ///
  // TODO use Util#readUntil
  String readUntil(List<String> end) {
    final StringBuffer sb = StringBuffer();
    int pos = this.pos;
    while (pos < this.value.length) {
      final String ch = this.value[pos];
      if (ch == '\\' && pos + 1 < this.value.length) {
        final String c = this.value[pos + 1];
        switch (c) {
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
          case '*':
          case '+':
          case '-':
          case '_':
          case '!':
          case '`':
          case ':':
            sb.write(c);
            pos++;
            break;
          default:
            sb.write(ch);
            break;
        }
      } else {
        bool endReached = false;
        for (int n = 0; n < end.length; n++) {
          if (ch == end[n]) {
            endReached = true;
            break;
          }
        }
        if (endReached) break;
        sb.write(ch);
      }
      pos++;
    }

    final String ch = pos < this.value.length ? this.value[pos] : '\n';
    for (int n = 0; n < end.length; n++) {
      if (ch == end[n]) {
        this.pos = pos;
        return sb.toString();
      }
    }
    return null;
  }

  ///
  /// Marks this line empty. Also sets previous/next line's empty attributes.
  ///
  void setEmpty() {
    this.value = "";
    this.leading = this.trailing = 0;
    this.isEmpty = true;
    if (this.previous != null) this.previous.nextEmpty = true;
    if (this.next != null) this.next.prevEmpty = true;
  }

  ///
  /// Counts the amount of 'ch' in this line.
  ///
  /// @param ch
  ///            The char to count.
  /// @return A value > 0 if this line only consists of 'ch' end spaces.
  ///
  int _countChars(String ch) {
    int count = 0;
    for (int i = 0; i < this.value.length; i++) {
      final String c = this.value[i];
      if (c == ' ') continue;
      if (c == ch) {
        count++;
        continue;
      }
      count = 0;
      break;
    }
    return count;
  }

  ///
  /// Counts the amount of 'ch' at the start of this line ignoring spaces.
  ///
  /// @param ch
  ///            The char to count.
  /// @return Number of characters found.
  /// @since 0.7
  ///
  int _countCharsStart(String ch) {
    int count = 0;
    for (int i = 0; i < this.value.length; i++) {
      final String c = this.value[i];
      if (c == ' ') continue;
      if (c == ch)
        count++;
      else
        break;
    }
    return count;
  }

  ///
  /// Gets this line's type.
  ///
  /// @param extendedMode
  ///            Whether extended profile is enabled or not
  /// @return The LineType.
  ///
  LineType getLineType(bool extendedMode) {
    if (this.isEmpty) return LineType.EMPTY;

    if (this.leading > 3) return LineType.CODE;

    if (this.value[this.leading] == '#') return LineType.HEADLINE;

    if (this.value[this.leading] == '>') return LineType.BQUOTE;

    if (extendedMode) {
      if (this.value.length - this.leading - this.trailing > 2 &&
          (this.value[this.leading] == '`' ||
              this.value[this.leading] == '~' ||
              this.value[this.leading] == '%')) {
        if (this._countCharsStart('`') >= 3) return LineType.FENCED_CODE;

        if (this._countCharsStart('~') >= 3) return LineType.FENCED_CODE;

        if (this._countCharsStart('%') >= 3) return LineType.PLUGIN;
      }
    }

    if (this.value.length - this.leading - this.trailing > 2 &&
        (this.value[this.leading] == '*' ||
            this.value[this.leading] == '-' ||
            this.value[this.leading] == '_')) {
      if (this._countChars(this.value[this.leading]) >= 3) return LineType.HR;
    }

    if (this.value.length - this.leading >= 2 &&
        this.value[this.leading + 1] == ' ') {
      switch (this.value[this.leading]) {
        case '*':
        case '-':
        case '+':
          return LineType.ULIST;
      }
    }

    if (this.value.length - this.leading >= 3 &&
        this.value[this.leading].isDigit) {
      int i = this.leading + 1;
      while (i < this.value.length && this.value[i].isDigit) i++;
      if (i + 1 < this.value.length &&
          this.value[i] == '.' &&
          this.value[i + 1] == ' ') return LineType.OLIST;
    }

    if (this.value[this.leading] == '<') {
      if (this._checkHTML()) return LineType.XML;
    }

    if (this.next != null && !this.next.isEmpty) {
      if ((this.next.value[0] == '-') && (this.next._countChars('-') > 0))
        return LineType.HEADLINE2;
      if ((this.next.value[0] == '=') && (this.next._countChars('=') > 0))
        return LineType.HEADLINE1;
    }

    return LineType.OTHER;
  }

  ///
  /// Reads an XML comment. Sets <code>xmlEndLine</code>.
  ///
  /// @param firstLine
  ///            The Line to start reading from.
  /// @param start
  ///            The starting position.
  /// @return The new position or -1 if it is no valid comment.
  ///
  int _readXMLComment(final Line firstLine, final int start) {
    Line line = firstLine;
    if (start + 3 < line.value.length) {
      if (line.value[2] == '-' && line.value[3] == '-') {
        int pos = start + 4;
        while (line != null) {
          while (pos < line.value.length && line.value[pos] != '-') {
            pos++;
          }
          if (pos == line.value.length) {
            line = line.next;
            pos = 0;
          } else {
            if (pos + 2 < line.value.length) {
              if (line.value[pos + 1] == '-' && line.value[pos + 2] == '>') {
                this.xmlEndLine = line;
                return pos + 3;
              }
            }
            pos++;
          }
        }
      }
    }
    return -1;
  }

  ///
  /// Checks if this line contains an ID at it's end and removes it from the
  /// line.
  ///
  /// @return The ID or <code>null</code> if no valid ID exists.
  ///
  // FIXME ... hack
  String stripID() {
    if (this.isEmpty ||
        this.value[this.value.length - this.trailing - 1] != '}') return null;
    int p = this.leading;
    bool found = false;
    while (p < this.value.length && !found) {
      switch (this.value[p]) {
        case '\\':
          if (p + 1 < this.value.length) {
            switch (this.value[p + 1]) {
              case '{':
                p++;
                break;
            }
          }
          p++;
          break;
        case '{':
          found = true;
          break;
        default:
          p++;
          break;
      }
    }

    if (found) {
      if (p + 1 < this.value.length && this.value[p + 1] == '#') {
        final int start = p + 2;
        p = start;
        found = false;
        while (p < this.value.length && !found) {
          switch (this.value[p]) {
            case '\\':
              if (p + 1 < this.value.length) {
                switch (this.value[p + 1]) {
                  case '}':
                    p++;
                    break;
                }
              }
              p++;
              break;
            case '}':
              found = true;
              break;
            default:
              p++;
              break;
          }
        }
        if (found) {
          final String id = this.value.substring(start, p).trim();
          if (this.leading != 0) {
            this.value = this.value.substring(0, this.leading) +
                this.value.substring(this.leading, start - 2).trim();
          } else {
            this.value = this.value.substring(this.leading, start - 2).trim();
          }
          this.trailing = 0;
          return id.length > 0 ? id : null;
        }
      }
    }
    return null;
  }

  ///
  /// Checks for a valid HTML block. Sets <code>xmlEndLine</code>.
  ///
  /// @return <code>true</code> if it is a valid block.
  ///
  bool _checkHTML() {
    final List<String> tags = <String>[];
    final StringBuffer temp = StringBuffer();
    int pos = this.leading;
    if (this.value[this.leading + 1] == '!') {
      if (this._readXMLComment(this, this.leading) > 0) return true;
    }
    pos = MarkdownUtils.readXML(temp, this.value, this.leading, false);
    String element, tag;
    if (pos > -1) {
      element = temp.toString();
      temp.clear();
      MarkdownUtils.getXMLTagString(temp, element);
      tag = temp.toString().toLowerCase();
      if (!HTML.isHtmlBlockElement(tag)) return false;
      if (tag == "hr") {
        this.xmlEndLine = this;
        return true;
      }
      tags.add(tag);

      Line line = this;
      while (line != null) {
        while (pos < line.value.length && line.value[pos] != '<') {
          pos++;
        }
        if (pos >= line.value.length) {
          line = line.next;
          pos = 0;
        } else {
          temp.clear();
          final int newPos =
              MarkdownUtils.readXML(temp, line.value, pos, false);
          if (newPos > 0) {
            element = temp.toString();
            temp.clear();
            MarkdownUtils.getXMLTagString(temp, element);
            tag = temp.toString().toLowerCase();
            if (HTML.isHtmlBlockElement(tag) && tag != "hr") {
              if (element[1] == '/') {
                if (tags.last != tag) return false;
                tags.removeLast();
              } else {
                tags.add(tag);
              }
            }
            if (tags.length == 0) {
              this.xmlEndLine = line;
              break;
            }
            pos = newPos;
          } else {
            pos++;
          }
        }
      }
      return tags.length == 0;
    }
    return false;
  }
}
