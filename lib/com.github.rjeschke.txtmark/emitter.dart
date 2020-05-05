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
import 'package:markdown4f/com.github.rjeschke.txtmark/blocktype.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/configuration.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/html.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/line.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/linkref.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/markdownutils.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/marktoken.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/stringutils.dart';
import 'package:markdown4f/org.markdown4j/plugin.dart';

///
/// Emitter class responsible for generating HTML output.
///
/// @author René Jeschke <rene_jeschke@yahoo.de>
///
class Emitter {
  /// Link references.
  final Map<String, LinkRef> _linkRefs = <String, LinkRef>{};

  /// The configuration.
  final Configuration _config;

  /// Extension flag.
  bool useExtensions = false;

  /// Newline flag.
  bool convertNewline2Br = false;

  /// Plugins references **/
  Map<String, Plugin> _plugins = <String, Plugin>{};

  /// Constructor.
  Emitter(this._config) {
    this.useExtensions = _config.forceExtendedProfile;
    this.convertNewline2Br = _config.convertNewline2Br;
    for (Plugin plugin in _config.plugins) {
      register(plugin);
    }
  }

  void register(Plugin plugin) {
    _plugins[plugin.idPlugin] = plugin;
  }

  ///
  /// Adds a LinkRef to this set of LinkRefs.
  ///
  /// @param key
  ///            The key/id.
  /// @param linkRef
  ///            The LinkRef.
  ///
  void addLinkRef(final String key, final LinkRef linkRef) {
    this._linkRefs[key.toLowerCase()] = linkRef;
  }

  ///
  /// Transforms the given block recursively into HTML.
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param root
  ///            The Block to process.
  ///
  void emit(final StringBuffer out, final Block root) {
    root.removeSurroundingEmptyLines();

    switch (root.type) {
      case BlockType.RULER:
        this._config.decorator.horizontalRuler(out, root);
        return;
      case BlockType.NONE:
      case BlockType.XML:
        break;
      case BlockType.HEADLINE:
        this._config.decorator.openHeadline(out, root);
        if (this.useExtensions && root.id != null) {
          out.write(" id=\"");
          MarkdownUtils.appendCode(out, root.id, 0, root.id.length);
          out.write('"');
        }
        out.write('>');
        break;
      case BlockType.PARAGRAPH:
        this._config.decorator.openParagraph(out, root);
        break;
      case BlockType.CODE:
      case BlockType.FENCED_CODE:
        if (this._config.codeBlockEmitter == null)
          this._config.decorator.openCodeBlock(out, root);
        break;
      case BlockType.BLOCKQUOTE:
        this._config.decorator.openBlockquote(out, root);
        break;
      case BlockType.UNORDERED_LIST:
        this._config.decorator.openUnorderedList(out, root);
        break;
      case BlockType.ORDERED_LIST:
        this._config.decorator.openOrderedList(out, root);
        break;
      case BlockType.LIST_ITEM:
        this._config.decorator.openListItem(out, root);
        if (this.useExtensions && root.id != null) {
          out.write(" id=\"");
          MarkdownUtils.appendCode(out, root.id, 0, root.id.length);
          out.write('"');
        }
        out.write('>');
        break;
      default:
        break;
    }

    if (root.hasLines() || root.type == BlockType.PLUGIN) {
      this._emitLines(out, root);
    } else {
      Block block = root.blocks;
      while (block != null) {
        this.emit(out, block);
        block = block.next;
      }
    }

    switch (root.type) {
      case BlockType.RULER:
      case BlockType.NONE:
      case BlockType.XML:
        break;
      case BlockType.HEADLINE:
        this._config.decorator.closeHeadline(out, root);
        break;
      case BlockType.PARAGRAPH:
        this._config.decorator.closeParagraph(out, root);
        break;
      case BlockType.CODE:
      case BlockType.FENCED_CODE:
        if (this._config.codeBlockEmitter == null)
          this._config.decorator.closeCodeBlock(out, root);
        break;
      case BlockType.BLOCKQUOTE:
        this._config.decorator.closeBlockquote(out, root);
        break;
      case BlockType.UNORDERED_LIST:
        this._config.decorator.closeUnorderedList(out, root);
        break;
      case BlockType.ORDERED_LIST:
        this._config.decorator.closeOrderedList(out, root);
        break;
      case BlockType.LIST_ITEM:
        this._config.decorator.closeListItem(out, root);
        break;
      default:
        break;
    }
  }

  ///
  /// Transforms lines into HTML.
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param block
  ///            The Block to process.
  ///
  void _emitLines(final StringBuffer out, final Block block) {
    switch (block.type) {
      case BlockType.CODE:
        this._emitCodeLines(out, block.lines, block.meta, true);
        break;
      case BlockType.FENCED_CODE:
        this._emitCodeLines(out, block.lines, block.meta, false);
        break;
      case BlockType.PLUGIN:
        this.emitPluginLines(out, block.lines, block.meta);
        break;
      case BlockType.XML:
        this._emitRawLines(out, block.lines);
        break;
      case BlockType.PARAGRAPH:
        this._emitMarkedLines(out, block.lines);
        break;
      default:
        this._emitMarkedLines(out, block.lines);
        break;
    }
  }

  ///
  /// Finds the position of the given Token in the given String.
  ///
  /// @param input
  ///            The String to search on.
  /// @param start
  ///            The starting character position.
  /// @param token
  ///            The token to find.
  /// @return The position of the token or -1 if none could be found.
  ///
  int _findToken(final String input, int start, MarkToken token) {
    int pos = start;
    while (pos < input.length) {
      if (this._getToken(input, pos) == token) return pos;
      pos++;
    }
    return -1;
  }

  ///
  /// Checks if there is a valid markdown link definition.
  ///
  /// @param out
  ///            The StringBuffer containing the generated output.
  /// @param input
  ///            Input String.
  /// @param start
  ///            Starting position.
  /// @param token
  ///            Either LINK or IMAGE.
  /// @return The new position or -1 if there is no valid markdown link.
  ///
  int _checkLink(
      final StringBuffer out, final String input, int start, MarkToken token) {
    bool isAbbrev = false;
    int pos = start + (token == MarkToken.LINK ? 1 : 2);
    final StringBuffer temp = StringBuffer();

    temp.clear();
    pos = MarkdownUtils.readMdLinkId(temp, input, pos);
    if (pos < start) return -1;

    String name = temp.toString(), link, comment;
    final int oldPos = pos++;
    pos = MarkdownUtils.skipSpaces(input, pos);
    if (pos < start) {
      final LinkRef lr = this._linkRefs[name.toLowerCase()];
      if (lr != null) {
        isAbbrev = lr.isAbbrev;
        link = lr.link;
        comment = lr.title;
        pos = oldPos;
      } else {
        return -1;
      }
    } else if (input[pos] == '(') {
      pos++;
      pos = MarkdownUtils.skipSpaces(input, pos);
      if (pos < start) return -1;
      temp.clear();
      bool useLt = input[pos] == '<';
      pos = useLt
          ? MarkdownUtils.readUntil(temp, input, pos + 1, '>')
          : MarkdownUtils.readMdLink(temp, input, pos);
      if (pos < start) return -1;
      if (useLt) pos++;
      link = temp.toString();

      if (input[pos] == ' ') {
        pos = MarkdownUtils.skipSpaces(input, pos);
        if (pos > start && input[pos] == '"') {
          pos++;
          temp.clear();
          pos = MarkdownUtils.readUntil(temp, input, pos, '"');
          if (pos < start) return -1;
          comment = temp.toString();
          pos++;
          pos = MarkdownUtils.skipSpaces(input, pos);
          if (pos == -1) return -1;
        }
      }
      if (input[pos] != ')') return -1;
    } else if (input[pos] == '[') {
      pos++;
      temp.clear();
      pos = MarkdownUtils.readRawUntil(temp, input, pos, ']');
      if (pos < start) return -1;
      final String id = temp.length > 0 ? temp.toString() : name;
      final LinkRef lr = this._linkRefs[id.toLowerCase()];
      if (lr != null) {
        link = lr.link;
        comment = lr.title;
      }
    } else {
      final LinkRef lr = this._linkRefs[name.toLowerCase()];
      if (lr != null) {
        isAbbrev = lr.isAbbrev;
        link = lr.link;
        comment = lr.title;
        pos = oldPos;
      } else {
        return -1;
      }
    }

    if (link == null) return -1;

    if (token == MarkToken.LINK) {
      if (isAbbrev && comment != null) {
        if (!this.useExtensions) return -1;
        out.write("<abbr title=\"");
        MarkdownUtils.appendValue(out, comment, 0, comment.length);
        out.write("\">");
        this._recursiveEmitLine(out, name, 0, MarkToken.NONE);
        out.write("</abbr>");
      } else {
        this._config.decorator.openLink(out, link, comment);
        out.write(" href=\"");
        MarkdownUtils.appendValue(out, link, 0, link.length);
        out.write('"');
        if (comment != null) {
          out.write(" title=\"");
          MarkdownUtils.appendValue(out, comment, 0, comment.length);
          out.write('"');
        }
        out.write('>');
        this._recursiveEmitLine(out, name, 0, MarkToken.NONE);
        out.write("</a>");
      }
    } else {
      this._config.decorator.openImage(out, link, comment);
      out.write(" src=\"");
      MarkdownUtils.appendValue(out, link, 0, link.length);
      out.write("\" alt=\"");
      MarkdownUtils.appendValue(out, name, 0, name.length);
      out.write('"');
      if (comment != null) {
        out.write(" title=\"");
        MarkdownUtils.appendValue(out, comment, 0, comment.length);
        out.write('"');
      }
      out.write(" />");
    }

    return pos;
  }

  ///
  /// Check if there is a valid HTML tag here. This method also transforms auto links and mailto auto links.
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param input
  ///            Input String.
  /// @param start
  ///            Starting position.
  /// @return The new position or -1 if nothing valid has been found.
  ///
  int _checkHtml(final StringBuffer out, final String input, int start) {
    final StringBuffer temp = StringBuffer();
    int pos;

    // Check for auto links
    temp.clear();
    pos = MarkdownUtils.readUntilAnyEnd(
        temp, input, start + 1, [':', ' ', '>', '\n']);
    if (pos != -1 && input[pos] == ':' && HTML.isLinkPrefix(temp.toString())) {
      pos = MarkdownUtils.readUntil(temp, input, pos, '>');
      if (pos != -1) {
        final String link = temp.toString();
        this._config.decorator.openLink(out, link, null);
        out.write(" href=\"");
        MarkdownUtils.appendValue(out, link, 0, link.length);
        out.write("\">");
        MarkdownUtils.appendValue(out, link, 0, link.length);
        out.write("</a>");
        return pos;
      }
    }

    // Check for mailto or adress auto link
    temp.clear();
    pos = MarkdownUtils.readUntilAnyEnd(
        temp, input, start + 1, ['@', ' ', '>', '\n']);
    if (pos != -1 && input[pos] == '@') {
      pos = MarkdownUtils.readUntil(temp, input, pos, '>');
      if (pos != -1) {
        final String link = temp.toString();
        this._config.decorator.openLink(out, link, null);
        out.write(" href=\"");

        // address auto links
        if (link.startsWith("@")) {
          String slink = link.substring(1);
          String url =
              "https://maps.google.com/maps?q=" + slink.replaceAll(' ', '+');
          out.write(url);
          out.write("\">");
          out.write(slink);
        }
        // mailto auto links
        else {
          MarkdownUtils.appendMailto(out, "mailto:", 0, 7);
          MarkdownUtils.appendMailto(out, link, 0, link.length);
          out.write("\">");
          MarkdownUtils.appendMailto(out, link, 0, link.length);
        }
        out.write("</a>");
        return pos;
      }
    }

    // Check for inline html
    if (start + 2 < input.length) {
      temp.clear();
      return MarkdownUtils.readXML(out, input, start, this._config.safeMode);
    }

    return -1;
  }

  ///
  /// Check if this is a valid XML/HTML entity.
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param input
  ///            Input String.
  /// @param start
  ///            Starting position
  /// @return The new position or -1 if this entity is invalid.
  ///
  static int _checkEntity(
      final StringBuffer out, final String input, int start) {
    int pos = MarkdownUtils.readUntil(out, input, start, ';');
    if (pos < 0 || out.length < 3) return -1;

    String outString = out.toString();
    if (outString[1] == '#') {
      if (outString[2] == 'x' || outString[2] == 'X') {
        if (out.length < 4) return -1;
        for (int i = 3; i < out.length; i++) {
          final String c = outString[i];
          if ((c < '0' || c > '9') &&
              ((c < 'a' || c > 'f') && (c < 'A' || c > 'F'))) return -1;
        }
      } else {
        for (int i = 2; i < outString.length; i++) {
          final String c = outString[i];
          if (c < '0' || c > '9') return -1;
        }
      }
      out.write(';');
    } else {
      for (int i = 1; i < outString.length; i++) {
        final String c = outString[i];
        if ((c < 'a' || c > 'z') && (c < 'A' || c > 'Z')) return -1;
      }
      out.write(';');
      return HTML.isEntity(outString) ? pos : -1;
    }

    return pos;
  }

  ///
  /// Recursively scans through the given line, taking care of any markdown stuff.
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param input
  ///            Input String.
  /// @param start
  ///            Start position.
  /// @param token
  ///            The matching Token (for e.g. '*')
  /// @return The position of the matching Token or -1 if token was NONE or no Token could be found.
  ///
  int _recursiveEmitLine(
      final StringBuffer out, final String input, int start, MarkToken token) {
    int pos = start, a, b;
    final StringBuffer temp = StringBuffer();
    String value;
    while (pos < input.length) {
      final MarkToken mt = this._getToken(input, pos);
      if (token != MarkToken.NONE &&
          (mt == token ||
              token == MarkToken.EM_STAR && mt == MarkToken.STRONG_STAR ||
              token == MarkToken.EM_UNDERSCORE &&
                  mt == MarkToken.STRONG_UNDERSCORE)) return pos;

      switch (mt) {
        case MarkToken.IMAGE:
        case MarkToken.LINK:
          temp.clear();
          b = this._checkLink(temp, input, pos, mt);
          if (b > 0) {
            out.write(temp);
            pos = b;
          } else {
            out.write(input[pos]);
          }
          break;
        case MarkToken.EM_STAR:
        case MarkToken.EM_UNDERSCORE:
          temp.clear();
          b = this._recursiveEmitLine(temp, input, pos + 1, mt);
          if (b > 0) {
            this._config.decorator.openEmphasis(out, value = temp.toString());
            out.write(value);
            this._config.decorator.closeEmphasis(out, value);
            pos = b;
          } else {
            out.write(input[pos]);
          }
          break;
        case MarkToken.STRONG_STAR:
        case MarkToken.STRONG_UNDERSCORE:
          temp.clear();
          b = this._recursiveEmitLine(temp, input, pos + 2, mt);
          if (b > 0) {
            this._config.decorator.openStrong(out, value = temp.toString());
            out.write(value);
            this._config.decorator.closeStrong(out, value);
            pos = b + 1;
          } else {
            out.write(input[pos]);
          }
          break;
        case MarkToken.STRIKE:
          temp.clear();
          b = this._recursiveEmitLine(temp, input, pos + 2, mt);
          if (b > 0) {
            this._config.decorator.openStrike(out, value = temp.toString());
            out.write(value);
            this._config.decorator.closeStrike(out, value);
            pos = b + 1;
          } else {
            out.write(input[pos]);
          }
          break;
        case MarkToken.SUPER:
          temp.clear();
          b = this._recursiveEmitLine(temp, input, pos + 1, mt);
          if (b > 0) {
            this._config.decorator.openSuper(out, value = temp.toString());
            out.write(value);
            this._config.decorator.closeSuper(out, value);
            pos = b;
          } else {
            out.write(input[pos]);
          }
          break;
        case MarkToken.EMOJI:
          temp.clear();
          b = this._recursiveEmitLine(temp, input, pos + 1, mt);
          if (b > 0) {
            String name = ":" + temp.toString() + ":";
            if (this._config.emojiEmitter != null) {
              this
                  ._config
                  .emojiEmitter
                  .emitEmoji(out, name, this._config.decorator);
            } else {
              out.write(name);
            }
            pos = b;
          } else {
            out.write(input[pos]);
          }
          break;
        case MarkToken.CODE_SINGLE:
        case MarkToken.CODE_DOUBLE:
          a = pos + (mt == MarkToken.CODE_DOUBLE ? 2 : 1);
          b = this._findToken(input, a, mt);
          if (b > 0) {
            pos = b + (mt == MarkToken.CODE_DOUBLE ? 1 : 0);
            while (a < b && input[a] == ' ') a++;
            if (a < b) {
              while (input[b - 1] == ' ') b--;
              this._config.decorator.openCodeSpan(out);
              MarkdownUtils.appendCode(out, input, a, b);
              this._config.decorator.closeCodeSpan(out);
            }
          } else {
            out.write(input[pos]);
          }
          break;
        case MarkToken.HTML:
          temp.clear();
          b = this._checkHtml(temp, input, pos);
          if (b > 0) {
            out.write(temp);
            pos = b;
          } else {
            out.write("&lt;");
          }
          break;
        case MarkToken.ENTITY:
          temp.clear();
          b = _checkEntity(temp, input, pos);
          if (b > 0) {
            out.write(temp);
            pos = b;
          } else {
            out.write("&amp;");
          }
          break;
        case MarkToken.X_LINK_OPEN:
          temp.clear();
          b = this
              ._recursiveEmitLine(temp, input, pos + 2, MarkToken.X_LINK_CLOSE);
          if (b > 0 && this._config.specialLinkEmitter != null) {
            this._config.specialLinkEmitter.emitSpan(out, temp.toString());
            pos = b + 1;
          } else {
            out.write(input[pos]);
          }
          break;
        case MarkToken.X_COPY:
          out.write("&copy;");
          pos += 2;
          break;
        case MarkToken.X_REG:
          out.write("&reg;");
          pos += 2;
          break;
        case MarkToken.X_TRADE:
          out.write("&trade;");
          pos += 3;
          break;
        case MarkToken.X_NDASH:
          out.write("&ndash;");
          pos++;
          break;
        case MarkToken.X_MDASH:
          out.write("&mdash;");
          pos += 2;
          break;
        case MarkToken.X_HELLIP:
          out.write("&hellip;");
          pos += 2;
          break;
        case MarkToken.X_LAQUO:
          out.write("&laquo;");
          pos++;
          break;
        case MarkToken.X_RAQUO:
          out.write("&raquo;");
          pos++;
          break;
        case MarkToken.X_RDQUO:
          out.write("&rdquo;");
          break;
        case MarkToken.X_LDQUO:
          out.write("&ldquo;");
          break;
        case MarkToken.ESCAPE:
          pos++;
          continue fallThrough;
        fallThrough:
        default:
          out.write(input[pos]);
          break;
      }
      pos++;
    }
    return -1;
  }

  ///
  /// Turns every whitespace character into a space character.
  ///
  /// @param c
  ///            Character to check
  /// @return 32 is c was a whitespace, c otherwise
  ///
  static String _whitespaceToSpace(String c) {
    return c.isSpace ? ' ' : c;
  }

  ///
  /// Check if there is any markdown Token.
  ///
  /// @param input
  ///            Input String.
  /// @param pos
  ///            Starting position.
  /// @return The Token.
  ///
  MarkToken _getToken(final String input, final int pos) {
    final String c0 = pos > 0 ? _whitespaceToSpace(input[pos - 1]) : ' ';
    final String c = _whitespaceToSpace(input[pos]);
    final String c1 =
        pos + 1 < input.length ? _whitespaceToSpace(input[pos + 1]) : ' ';
    final String c2 =
        pos + 2 < input.length ? _whitespaceToSpace(input[pos + 2]) : ' ';
    final String c3 =
        pos + 3 < input.length ? _whitespaceToSpace(input[pos + 3]) : ' ';

    switch (c) {
      case '*':
        if (c1 == '*') {
          return c0 != ' ' || c2 != ' '
              ? MarkToken.STRONG_STAR
              : MarkToken.EM_STAR;
        }
        return c0 != ' ' || c1 != ' ' ? MarkToken.EM_STAR : MarkToken.NONE;
      case '_':
        if (c1 == '_') {
          return c0 != ' ' || c2 != ' '
              ? MarkToken.STRONG_UNDERSCORE
              : MarkToken.EM_UNDERSCORE;
        }
        if (this.useExtensions) {
          return c0.isLetterOrDigit && c0 != '_' && c1.isLetterOrDigit
              ? MarkToken.NONE
              : MarkToken.EM_UNDERSCORE;
        }
        return c0 != ' ' || c1 != ' '
            ? MarkToken.EM_UNDERSCORE
            : MarkToken.NONE;
      case '~':
        if (this.useExtensions && c1 == '~') {
          return MarkToken.STRIKE;
        }
        return MarkToken.NONE;
      case '!':
        if (c1 == '[') return MarkToken.IMAGE;
        return MarkToken.NONE;
      case '[':
        if (this.useExtensions && c1 == '[') return MarkToken.X_LINK_OPEN;
        return MarkToken.LINK;
      case ']':
        if (this.useExtensions && c1 == ']') return MarkToken.X_LINK_CLOSE;
        return MarkToken.NONE;
      case '`':
        return c1 == '`' ? MarkToken.CODE_DOUBLE : MarkToken.CODE_SINGLE;
      case '\\':
        switch (c1) {
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
            return MarkToken.ESCAPE;
          default:
            return MarkToken.NONE;
        }
        break;
      case '<':
        if (this.useExtensions && c1 == '<') return MarkToken.X_LAQUO;
        return MarkToken.HTML;
      case '&':
        return MarkToken.ENTITY;
      default:
        if (this.useExtensions) {
          switch (c) {
            case '-':
              if (c1 == '-')
                return c2 == '-' ? MarkToken.X_MDASH : MarkToken.X_NDASH;
              break;
            case '^':
              return c0 == '^' || c1 == '^' ? MarkToken.NONE : MarkToken.SUPER;
            case '>':
              if (c1 == '>') return MarkToken.X_RAQUO;
              break;
            case '.':
              if (c1 == '.' && c2 == '.') return MarkToken.X_HELLIP;
              break;
            case '(':
              if (c1 == 'C' && c2 == ')') return MarkToken.X_COPY;
              if (c1 == 'R' && c2 == ')') return MarkToken.X_REG;
              if (c1 == 'T' && c2 == 'M' && c3 == ')') return MarkToken.X_TRADE;
              break;
            case '"':
              if (!c0.isLetterOrDigit && c1 != ' ') return MarkToken.X_LDQUO;
              if (c0 != ' ' && !c1.isLetterOrDigit) return MarkToken.X_RDQUO;
              break;
            case ':':
              return c0 != ' ' || c1 != ' ' ? MarkToken.EMOJI : MarkToken.NONE;
          }
        }
        return MarkToken.NONE;
    }
  }

  ///
  /// Writes a set of markdown lines into the StringBuffer.
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param lines
  ///            The lines to write.
  ///
  void _emitMarkedLines(final StringBuffer out, final Line lines) {
    final StringBuffer input = StringBuffer();
    Line line = lines;
    while (line != null) {
      if (!line.isEmpty) {
        input.write(line.value
            .substring(line.leading, line.value.length - line.trailing));
        if (line.trailing >= 2 && !convertNewline2Br) input.write("<br />");
      }
      if (line.next != null) {
        input.write('\n');
        if (convertNewline2Br) {
          input.write("<br />");
        }
      }
      line = line.next;
    }

    this._recursiveEmitLine(out, input.toString(), 0, MarkToken.NONE);
  }

  ///
  /// Writes a set of raw lines into the StringBuffer.
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param lines
  ///            The lines to write.
  ///
  void _emitRawLines(final StringBuffer out, final Line lines) {
    Line line = lines;
    if (this._config.safeMode) {
      final StringBuffer temp = StringBuffer();
      while (line != null) {
        if (!line.isEmpty) {
          temp.write(line.value);
        }
        temp.write('\n');
        line = line.next;
      }
      final String input = temp.toString();
      for (int pos = 0; pos < input.length; pos++) {
        if (input[pos] == '<') {
          temp.clear();
          final int t =
              MarkdownUtils.readXML(temp, input, pos, this._config.safeMode);
          if (t != -1) {
            out.write(temp);
            pos = t;
          } else {
            out.write(input[pos]);
          }
        } else {
          out.write(input[pos]);
        }
      }
    } else {
      while (line != null) {
        if (!line.isEmpty) {
          out.write(line.value);
        }
        out.write('\n');
        line = line.next;
      }
    }
  }

  ///
  /// Writes a code block into the StringBuffer.
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param lines
  ///            The lines to write.
  /// @param meta
  ///            Meta information.
  ///
  void _emitCodeLines(final StringBuffer out, final Line lines,
      final String meta, final bool removeIndent) {
    Line line = lines;
    if (this._config.codeBlockEmitter != null) {
      final List<String> list = <String>[];
      while (line != null) {
        if (line.isEmpty)
          list.add("");
        else
          list.add(removeIndent ? line.value.substring(4) : line.value);
        line = line.next;
      }
      this._config.codeBlockEmitter.emitBlock(out, list, meta);
    } else {
      while (line != null) {
        if (!line.isEmpty) {
          for (int i = 4; i < line.value.length; i++) {
            final String c = line.value[i];
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
                break;
            }
          }
        }
        out.write('\n');
        line = line.next;
      }
    }
  }

  ///
  /// interprets a plugin block into the StringBuffer.
  ///
  /// @param out
  ///            The StringBuffer to write to.
  /// @param lines
  ///            The lines to write.
  /// @param meta
  ///            Meta information.
  ///
  void emitPluginLines(
      final StringBuffer out, final Line lines, final String meta) {
    Line line = lines;

    String idPlugin = meta;
    String sparams;
    Map<String, String> params;
    int iow = meta.indexOf(' ');
    if (iow != -1) {
      idPlugin = meta.substring(0, iow);
      sparams = meta.substring(iow + 1);
      if (sparams != null) {
        params = MarkdownUtils.parseParams(sparams);
      }
    }

    if (params == null) {
      params = <String, String>{};
    }
    final List<String> list = <String>[];
    while (line != null) {
      if (line.isEmpty)
        list.add("");
      else
        list.add(line.value);
      line = line.next;
    }

    Plugin plugin = _plugins[idPlugin];
    if (plugin != null) {
      plugin.emit(out, list, params);
    }
  }
}
