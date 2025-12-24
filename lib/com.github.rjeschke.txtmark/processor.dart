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
import 'package:markdown4f/com.github.rjeschke.txtmark/block_type.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/configuration.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/decorator.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/emitter.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/line.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/line_type.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/link_ref.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/markdown_utils.dart';
import 'package:markdown4f/com.github.rjeschke.txtmark/string_utils.dart';

/// Markdown processor class.
///
/// <p>
/// Example usage:
/// </p>
///
/// <pre>
/// <code>String result = Processor.process("This is ***TXTMARK***");
/// </code>
/// </pre>
///
/// @author René Jeschke <rene_jeschke@yahoo.de>
class Processor {
  /// The reader.
  final Reader _reader;

  /// The emitter.
  final Emitter _emitter;

  /// The Configuration.
  final Configuration config;

  /// Extension flag.
  bool _useExtensions = false;

  /// Constructor.
  ///
  /// @param reader
  ///            The input reader.
  Processor(this._reader, this.config) : _emitter = Emitter(config) {
    this._useExtensions = config.forceExtendedProfile;
  }

  /// Transforms an input stream into HTML using the given Configuration.
  ///
  /// @param reader
  ///            The Reader to process.
  /// @param configuration
  ///            The Configuration.
  /// @return The processed String.
  /// @since 0.7
  /// @see Configuration
  static Future<String> processReaderWithConfig(
      final Reader reader, final Configuration configuration) async {
    final Processor p = Processor(reader, configuration);
    return p._process();
  }

  /// Transforms an input String into HTML using the given Configuration.
  ///
  /// @param input
  ///            The String to process.
  /// @param configuration
  ///            The Configuration.
  /// @return The processed String.
  /// @since 0.7
  /// @see Configuration`
  static Future<String> processStringWithConfig(
      final String input, final Configuration configuration) async {
    try {
      return processReaderWithConfig(StringReader(input), configuration);
    } on Exception {
      // This _can never_ happen
      return "";
    }
  }

  /// Transforms an input String into HTML using the default Configuration.
  ///
  /// @param input
  ///            The String to process.
  /// @return The processed String.
  /// @see Configuration#DEFAULT
  static Future<String> processString(final String input) async {
    return processStringWithConfig(input, Configuration.defaultConfig);
  }

  /// Transforms an input String into HTML.
  ///
  /// @param input
  ///            The String to process.
  /// @param safeMode
  ///            Set to <code>true</code> to escape unsafe HTML tags.
  /// @return The processed String.
  /// @see Configuration#DEFAULT
  static Future<String> processStringWithSafeMode(
      final String input, final bool safeMode) async {
    return processStringWithConfig(
        input, Configuration.builder().setSafeMode(safeMode).build());
  }

  /// Transforms an input String into HTML.
  ///
  /// @param input
  ///            The String to process.
  /// @param decorator
  ///            The decorator to use.
  /// @return The processed String.
  /// @see Configuration#DEFAULT
  static Future<String> processStringWithDecorator(
      final String input, final Decorator decorator) async {
    return processStringWithConfig(
        input, Configuration.builder().setDecorator(decorator).build());
  }

  /// Transforms an input String into HTML.
  ///
  /// [input]
  ///            The String to process.
  /// [decorator]
  ///            The decorator to use.
  /// [safeMode]
  ///            Set to <code>true</code> to escape unsafe HTML tags.
  /// @return The processed String.
  /// @see Configuration#DEFAULT
  static Future<String> processStringWithDecoratorAndSafeMode(
      final String input,
      final Decorator decorator,
      final bool safeMode) async {
    return processStringWithConfig(
        input,
        Configuration.builder()
            .setDecorator(decorator)
            .setSafeMode(safeMode)
            .build());
  }

  /// Transforms an input stream into HTML using the default Configuration.
  ///
  /// @param reader
  ///            The Reader to process.
  /// @return The processed String.
  ///
  /// @see Configuration#defaultConfig
  static Future<String> processReader(final Reader reader) async {
    return processReaderWithConfig(reader, Configuration.defaultConfig);
  }

  /// Transforms an input stream into HTML.
  ///
  /// @param reader
  ///            The Reader to process.
  /// @param safeMode
  ///            Set to <code>true</code> to escape unsafe HTML tags.
  /// @return The processed String.
  ///
  /// @see Configuration#defaultConfig
  static Future<String> processReaderWidthSafeMode(
      final Reader reader, final bool safeMode) async {
    return processReaderWithConfig(
        reader, Configuration.builder().setSafeMode(safeMode).build());
  }

  /// Transforms an input stream into HTML.
  ///
  /// @param reader
  ///            The Reader to process.
  /// @param decorator
  ///            The decorator to use.
  /// @return The processed String.
  ///
  /// @see Configuration#defaultConfig
  static Future<String> processReaderWithDecorator(
      final Reader reader, final Decorator decorator) async {
    return processReaderWithConfig(
        reader, Configuration.builder().setDecorator(decorator).build());
  }

  /// Transforms an input stream into HTML.
  ///
  /// @param reader
  ///            The Reader to process.
  /// @param decorator
  ///            The decorator to use.
  /// @param safeMode
  ///            Set to <code>true</code> to escape unsafe HTML tags.
  /// @return The processed String.
  ///
  /// @see Configuration#defaultConfig
  static Future<String> processReaderWithDecoratorAndSafeMode(
      final Reader reader,
      final Decorator decorator,
      final bool safeMode) async {
    return processReaderWithConfig(
        reader,
        Configuration.builder()
            .setDecorator(decorator)
            .setSafeMode(safeMode)
            .build());
  }

  /// Reads all lines from our reader.
  /// <p>
  /// Takes care of markdown link references.
  /// </p>
  ///
  /// @return A Block containing all lines.
  ///
  Block _readLines() {
    final Block block = Block();
    final StringBuffer sb = StringBuffer(80);
    String? c = this._reader.read();
    LinkRef? lastLinkRef;
    while (c != null) {
      sb.clear();
      int pos = 0;
      bool eol = false;
      while (!eol) {
        if (c == null) {
          eol = true;
        } else {
          switch (c) {
            case '\n':
              c = this._reader.read();
              if (c == '\r') c = this._reader.read();
              eol = true;
              break;
            case '\r':
              c = this._reader.read();
              if (c == '\n') c = this._reader.read();
              eol = true;
              break;
            case '\t':
              {
                final int np = pos + (4 - (pos & 3));
                while (pos < np) {
                  sb.write(' ');
                  pos++;
                }
                c = this._reader.read();
                break;
              }
            default:
              pos++;
              sb.write(c);
              c = this._reader.read();
              break;
          }
        }
      }

      final Line line = Line();
      line.value = sb.toString();
      line.init();

      // Check for link definitions
      bool isLinkRef = false;
      String? id, link, comment;
      if (!line.isEmpty &&
          line.leading < 4 &&
          line.value[line.leading] == '[') {
        line.pos = line.leading + 1;
        // Read ID up to ']'
        id = line.readUntil([']']);
        // Is ID valid and are there any more characters?
        if (id != null && line.pos + 2 < line.value.length) {
          // Check for ':' ([...]:...)
          if (line.value[line.pos + 1] == ':') {
            line.pos += 2;
            line.skipSpaces();
            // Check for link syntax
            if (line.value[line.pos] == '<') {
              line.pos++;
              link = line.readUntil(['>']);
              line.pos++;
            } else
              link = line.readUntil([' ', '\n']);

            // Is link valid?
            if (link != null) {
              // Any non-whitespace characters following?
              if (line.skipSpaces()) {
                final String ch = line.value[line.pos];
                // Read comment
                if (ch == '\"' || ch == '\'' || ch == '(') {
                  line.pos++;
                  comment = line.readUntil([ch == '(' ? ')' : ch]);
                  // Valid linkRef only if comment is valid
                  if (comment != null) isLinkRef = true;
                }
              } else
                isLinkRef = true;
            }
          }
        }
      }

      // To make compiler happy: add != null checks
      if (isLinkRef && id != null && link != null) {
        if (id.toLowerCase() == "\$profile\$") {
          this._emitter.useExtensions =
              this._useExtensions = link.toLowerCase() == "extended";
          lastLinkRef = null;
        } else {
          // Store linkRef and skip line
          final LinkRef lr = LinkRef(link, comment ?? "",
              comment != null && (link.length == 1 && link[0] == '*'));
          this._emitter.addLinkRef(id, lr);
          if (comment == null) lastLinkRef = lr;
        }
      } else {
        comment = null;
        // Check for multi-line linkRef
        if (!line.isEmpty && lastLinkRef != null) {
          line.pos = line.leading;
          final String ch = line.value[line.pos];
          if (ch == '\"' || ch == '\'' || ch == '(') {
            line.pos++;
            comment = line.readUntil([ch == '(' ? ')' : ch]);
          }
          if (comment != null) lastLinkRef.title = comment;

          lastLinkRef = null;
        }

        // No multi-line linkRef, store line
        if (comment == null) {
          line.pos = 0;
          block.appendLine(line);
        }
      }
    }

    return block;
  }

  /// Initializes a list block by separating it into list item blocks.
  ///
  /// @param root
  ///            The Block to process.
  void _initListBlock(final Block root) {
    Line? line = root.lines;
    line = line!.next;
    while (line != null) {
      final LineType t = line.getLineType(this._useExtensions);
      if ((t == LineType.OLIST || t == LineType.ULIST) ||
          (!line.isEmpty &&
              (line.prevEmpty &&
                  line.leading == 0 &&
                  !(t == LineType.OLIST || t == LineType.ULIST)))) {
        root.split(line.previous!).type = BlockType.LIST_ITEM;
      }
      line = line.next;
    }
    root.split(root.lineTail!).type = BlockType.LIST_ITEM;
  }

  /// Recursively process the given Block.
  ///
  /// @param root
  ///            The Block to process.
  /// @param listMode
  ///            Flag indicating that we're in a list item block.
  void _recurse(final Block root, bool listMode) {
    Block? block, list;
    Line? line = root.lines;

    if (listMode) {
      root.removeListIndent(this._useExtensions);
      if (this._useExtensions &&
          root.lines != null &&
          root.lines!.getLineType(this._useExtensions) != LineType.CODE) {
        root.id = root.lines!.stripID();
      }
    }

    while (line != null && line.isEmpty) line = line.next;
    if (line == null) return;

    while (line != null) {
      final LineType type = line.getLineType(this._useExtensions);
      switch (type) {
        case LineType.OTHER:
          {
            final bool wasEmpty = line.prevEmpty;
            while (line != null && !line.isEmpty) {
              final LineType t = line.getLineType(this._useExtensions);
              if ((listMode || this._useExtensions) &&
                  (t == LineType.OLIST || t == LineType.ULIST)) break;
              if (this._useExtensions &&
                  (t == LineType.CODE ||
                      t == LineType.FENCED_CODE ||
                      t == LineType.PLUGIN)) break;
              if (t == LineType.HEADLINE ||
                  t == LineType.HEADLINE1 ||
                  t == LineType.HEADLINE2 ||
                  t == LineType.HR ||
                  t == LineType.BQUOTE ||
                  t == LineType.XML) break;
              line = line.next;
            }
            BlockType bt;
            if (line != null && !line.isEmpty) {
              bt = (listMode && !wasEmpty)
                  ? BlockType.NONE
                  : BlockType.PARAGRAPH;
              root.split(line.previous!).type = bt;
              root.removeLeadingEmptyLines();
            } else {
              bt = (listMode && (line == null || !line.isEmpty) && !wasEmpty)
                  ? BlockType.NONE
                  : BlockType.PARAGRAPH;
              root.split(line == null ? root.lineTail! : line).type = bt;
              root.removeLeadingEmptyLines();
            }
            line = root.lines;
            break;
          }
        case LineType.CODE:
          while (line != null && (line.isEmpty || line.leading > 3)) {
            line = line.next;
          }
          block = root.split(line != null ? line.previous! : root.lineTail!);
          block.type = BlockType.CODE;
          block.removeSurroundingEmptyLines();
          break;
        case LineType.XML:
          if (line.previous != null) {
            // FIXME ... this looks wrong
            root.split(line.previous!);
          }
          root.split(line.xmlEndLine!).type = BlockType.XML;
          root.removeLeadingEmptyLines();
          line = root.lines;
          break;
        case LineType.BQUOTE:
          while (line != null) {
            if (!line.isEmpty &&
                (line.prevEmpty &&
                    line.leading == 0 &&
                    line.getLineType(this._useExtensions) != LineType.BQUOTE))
              break;
            line = line.next;
          }
          block = root.split(line != null ? line.previous! : root.lineTail!);
          block.type = BlockType.BLOCKQUOTE;
          block.removeSurroundingEmptyLines();
          block.removeBlockQuotePrefix();
          this._recurse(block, false);
          line = root.lines;
          break;
        case LineType.HR:
          if (line.previous != null) {
            // FIXME ... this looks wrong
            root.split(line.previous!);
          }
          root.split(line).type = BlockType.RULER;
          root.removeLeadingEmptyLines();
          line = root.lines;
          break;
        case LineType.FENCED_CODE:
          line = line.next;
          while (line != null) {
            if (line.getLineType(this._useExtensions) == LineType.FENCED_CODE)
              break;
            // TODO ... is this really necessary? Maybe add a special
            // flag?
            line = line.next;
          }
          if (line != null) line = line.next;
          block = root.split(line != null ? line.previous! : root.lineTail!);
          block.type = BlockType.FENCED_CODE;
          block.meta = MarkdownUtils.getMetaFromFence(block.lines!.value);
          block.lines!.setEmpty();
          if (block.lineTail!.getLineType(this._useExtensions) ==
              LineType.FENCED_CODE) block.lineTail!.setEmpty();
          block.removeSurroundingEmptyLines();
          break;
        case LineType.PLUGIN:
          line = line.next;
          while (line != null) {
            if (line.getLineType(this._useExtensions) == LineType.PLUGIN) break;
            // TODO ... is this really necessary? Maybe add a special
            // flag?
            line = line.next;
          }
          if (line != null) line = line.next;
          block = root.split(line != null ? line.previous! : root.lineTail!);
          block.type = BlockType.PLUGIN;
          block.meta = MarkdownUtils.getMetaFromFence(block.lines!.value);
          block.lines!.setEmpty();
          if (block.lineTail!.getLineType(this._useExtensions) ==
              LineType.PLUGIN) block.lineTail!.setEmpty();
          block.removeSurroundingEmptyLines();
          break;
        case LineType.HEADLINE:
        case LineType.HEADLINE1:
        case LineType.HEADLINE2:
          if (line.previous != null) {
            root.split(line.previous!);
          }
          if (type != LineType.HEADLINE) {
            line.next!.setEmpty();
          }
          block = root.split(line);
          block.type = BlockType.HEADLINE;
          if (type != LineType.HEADLINE)
            block.hlDepth = type == LineType.HEADLINE1 ? 1 : 2;
          if (this._useExtensions) block.id = block.lines!.stripID();
          block.transfromHeadline();
          root.removeLeadingEmptyLines();
          line = root.lines;
          break;
        case LineType.OLIST:
        case LineType.ULIST:
          while (line != null) {
            final LineType t = line.getLineType(this._useExtensions);
            if (!line.isEmpty &&
                (line.prevEmpty &&
                    line.leading == 0 &&
                    !(t == LineType.OLIST || t == LineType.ULIST))) break;
            line = line.next;
          }
          list = root.split(line != null ? line.previous! : root.lineTail!);
          list.type = type == LineType.OLIST
              ? BlockType.ORDERED_LIST
              : BlockType.UNORDERED_LIST;
          list.lines!.prevEmpty = false;
          list.lineTail!.nextEmpty = false;
          list.removeSurroundingEmptyLines();
          list.lines!.prevEmpty = list.lineTail!.nextEmpty = false;
          _initListBlock(list);
          block = list.blocks;
          while (block != null) {
            this._recurse(block, true);
            block = block.next;
          }
          list.expandListParagraphs();
          break;
        default:
          line = line.next;
          break;
      }
    }
  }

  /// Does all the processing.
  ///
  /// @return The processed String.
  ///
  Future<String> _process() async {
    final StringBuffer out = StringBuffer();
    final Block parent = this._readLines();
    parent.removeSurroundingEmptyLines();

    this._recurse(parent, false);
    Block? block = parent.blocks;
    while (block != null) {
      await this._emitter.emit(out, block);
      block = block.next;
    }

    return out.toString();
  }
}
