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
import 'package:markdown4f/com.github.rjeschke.txtmark/decorator.dart';

///
/// Default Decorator implementation.
/// 
/// <p>
/// Example for a user Decorator having a class attribute on &lt;p> tags.
/// </p>
/// 
/// <pre>
/// <code>class MyDecorator extends DefaultDecorator
/// {
///     &#64;Override
///     void openParagraph(StringBuffer out)
///     {
///         out.write("&lt;p class=\"myclass\">");
///     }
/// }
/// </code>
/// </pre>
/// 
/// @author René Jeschke <rene_jeschke@yahoo.de>
///
 class DefaultDecorator implements Decorator
{
    /// @see com.github.rjeschke.txtmark.Decorator#openParagraph(StringBuffer, Block)
    @override
    void openParagraph(StringBuffer out, Block block)
    {
        out.write("<p>");
    }

    /// @see com.github.rjeschke.txtmark.Decorator#closeParagraph(StringBuffer)
    @override
    void closeParagraph(StringBuffer out, Block block)
    {
        out.write("</p>\n");
    }

    /// @see com.github.rjeschke.txtmark.Decorator#openBlockquote(StringBuffer)
    @override
    void openBlockquote(StringBuffer out, Block block)
    {
        out.write("<blockquote>");
    }

    /// @see com.github.rjeschke.txtmark.Decorator#closeBlockquote(StringBuffer)
    @override
    void closeBlockquote(StringBuffer out, Block block)
    {
        out.write("</blockquote>\n");
    }

    /// @see com.github.rjeschke.txtmark.Decorator#openCodeBlock(StringBuffer)
    @override
    void openCodeBlock(StringBuffer out, Block block)
    {
        out.write("<pre><code>");
    }

    /// @see com.github.rjeschke.txtmark.Decorator#closeCodeBlock(StringBuffer)
    @override
    void closeCodeBlock(StringBuffer out, Block block)
    {
        out.write("</code></pre>\n");
    }

    /// @see com.github.rjeschke.txtmark.Decorator#openCodeSpan(StringBuffer)
    @override
    void openCodeSpan(StringBuffer out)
    {
        out.write("<code>");
    }

    /// @see com.github.rjeschke.txtmark.Decorator#closeCodeSpan(StringBuffer)
    @override
    void closeCodeSpan(StringBuffer out)
    {
        out.write("</code>");
    }

    ///
    /// @see com.github.rjeschke.txtmark.Decorator#openHeadline(StringBuffer,
    ///      int)
    ///
    @override
    void openHeadline(StringBuffer out, Block block)
    {
        out.write("<h");
        out.write(block.hlDepth);
    }

    ///
    /// @see com.github.rjeschke.txtmark.Decorator#closeHeadline(StringBuffer,
    ///      int)
    ///
    @override
    void closeHeadline(StringBuffer out, Block block)
    {
        out.write("</h");
        out.write(block.hlDepth);
        out.write(">\n");
    }

    /// @see com.github.rjeschke.txtmark.Decorator#openStrong(StringBuffer)
    @override
    void openStrong(StringBuffer out, String value)
    {
        out.write("<strong>");
    }

    /// @see com.github.rjeschke.txtmark.Decorator#closeStrong(StringBuffer)
    @override
    void closeStrong(StringBuffer out, String value)
    {
        out.write("</strong>");
    }

    /// @see com.github.rjeschke.txtmark.Decorator#openStrong(StringBuffer)
    @override
    void openStrike(StringBuffer out, String value)
    {
        out.write("<s>");
    }

    /// @see com.github.rjeschke.txtmark.Decorator#closeStrong(StringBuffer)
    @override
    void closeStrike(StringBuffer out, String value)
    {
        out.write("</s>");
    }

    /// @see com.github.rjeschke.txtmark.Decorator#openEmphasis(StringBuffer)
    @override
    void openEmphasis(StringBuffer out, String value)
    {
        out.write("<em>");
    }

    /// @see com.github.rjeschke.txtmark.Decorator#closeEmphasis(StringBuffer)
    @override
    void closeEmphasis(StringBuffer out, String value)
    {
        out.write("</em>");
    }

    /// @see com.github.rjeschke.txtmark.Decorator#openSuper(StringBuffer)
    @override
    void openSuper(StringBuffer out, String value)
    {
        out.write("<sup>");
    }

    /// @see com.github.rjeschke.txtmark.Decorator#closeSuper(StringBuffer)
    @override
    void closeSuper(StringBuffer out, String value)
    {
        out.write("</sup>");
    }

    /// @see com.github.rjeschke.txtmark.Decorator#openOrderedList(StringBuffer)
    @override
    void openOrderedList(StringBuffer out, Block block)
    {
        out.write("<ol>\n");
    }

    /// @see com.github.rjeschke.txtmark.Decorator#closeOrderedList(StringBuffer)
    @override
    void closeOrderedList(StringBuffer out, Block block)
    {
        out.write("</ol>\n");
    }

    /// @see com.github.rjeschke.txtmark.Decorator#openUnorderedList(StringBuffer)
    @override
    void openUnorderedList(StringBuffer out, Block block)
    {
        out.write("<ul>\n");
    }

    /// @see com.github.rjeschke.txtmark.Decorator#closeUnorderedList(StringBuffer)
    @override
    void closeUnorderedList(StringBuffer out, Block block)
    {
        out.write("</ul>\n");
    }

    /// @see com.github.rjeschke.txtmark.Decorator#openListItem(StringBuffer)
    @override
    void openListItem(StringBuffer out, Block block)
    {
        out.write("<li");
    }

    /// @see com.github.rjeschke.txtmark.Decorator#closeListItem(StringBuffer)
    @override
    void closeListItem(StringBuffer out, Block block)
    {
        out.write("</li>\n");
    }

    /// @see com.github.rjeschke.txtmark.Decorator#horizontalRuler(StringBuffer)
    @override
    void horizontalRuler(StringBuffer out, Block block)
    {
        out.write("<hr />\n");
    }

    /// @see com.github.rjeschke.txtmark.Decorator#openLink(StringBuffer, String, String)
    @override
    void openLink(StringBuffer out, String link, String title)
    {
        out.write("<a");
    }

    /// @see com.github.rjeschke.txtmark.Decorator#openImage(StringBuffer, String, String)
    @override
    void openImage(StringBuffer out, String link, String title)
    {
        out.write("<img");
    }
}
