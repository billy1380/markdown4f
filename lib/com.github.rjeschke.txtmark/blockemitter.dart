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

///
/// Block emitter interface. An example for a code block emitter is given below:
/// 
/// <pre>
/// <code>public void emitBlock(StringBuffer out, List&lt;String&gt; lines, String meta)
/// {
///     out.write("&lt;pre>&lt;code>");
///     for(final String s : lines)
///     {
///         for(int i = 0; i < s.length; i++)
///         {
///             final char c = s[i);
///             switch(c)
///             {
///             case '&':
///                 out.write("&amp;amp;");
///                 break;
///             case '&lt;':
///                 out.write("&amp;lt;");
///                 break;
///             case '&gt;':
///                 out.write("&amp;gt;");
///                 break;
///             default:
///                 out.write(c);
///                 break;
///             }
///         }
///         out.write('\n');
///     }
///     out.write("&lt;/code>&lt;/pre>\n");
/// }
/// </code>
/// </pre>
/// 
/// 
/// @author René Jeschke <rene_jeschke@yahoo.de>
/// @since 0.7
///
abstract class BlockEmitter {
  ///
    /// This method is responsible for outputting a markdown block and for any
    /// needed pre-processing like escaping HTML special characters.
    /// 
    /// @param out
    ///            The StringBuffer to append to
    /// @param lines
    ///            List of lines
    /// @param meta
    ///            Meta information as a single String (if any) or empty String
    ///
  void emitBlock(StringBuffer out, List<String> lines, String meta);
}
