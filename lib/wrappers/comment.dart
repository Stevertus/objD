import 'package:objd/basic/text.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/build/build.dart';

class Comment extends RestActionAble {
  static String Author = '';

  String _text;
  String get text => _text;
  bool force = false;

  /// The Comment widget generates a simple line with some annotations(# ...).
  Comment(String text, {this.force = false})
      : _text = text.startsWith('#') ? text : '# ' + text;

  /// The Comment features a simple line break.
  Comment.LineBreak() : _text = '';

  /// Separates parts of your code
  Comment.Separate([int length = 48]) {
    _text = _separate(length);
  }

  /// Used to describe
  Comment.FileHeader(
    String desc, {
    String author,
    String calledFrom,
    String context,
  }) {
    _text = _separate() +
        '''
\n#
# Author:
#  ${author ?? Author}
#
# Description:    
''';

    _text += desc.split('\n').map((s) => '#  ' + s).join('\n');

    if (calledFrom != null) {
      _text += '\n#\n# Called in:';
      _text += '\n#  ' + calledFrom;
    }
    if (context != null) {
      _text += '\n#\n# Context:';
      _text += '\n#  ' + context;
    }

    _text += '\n#\n' + _separate();
  }

  Comment.Null() {
    _text = '[null]';
  }

  String _separate([int length = 48]) {
    return List.generate(length, (i) => '#').join();
  }

  @override
  Widget generate(Context context) {
    return Text(_text ?? '');
  }
}
