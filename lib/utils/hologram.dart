import 'package:meta/meta.dart';
import 'package:objd/basic/types/location.dart';
import 'package:objd/basic/rest_action.dart';
import 'package:objd/basic/text_components.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/wrappers/comment.dart';
import 'package:objd/build/context.dart';
import 'package:objd/utils/armorstand.dart';
import 'package:objd/wrappers/execute.dart';

/// A Hologram shows a floating text at a specific Location using Armorstands.
class Hologram extends RestActionAble {
  List<TextComponent> texts;
  List<String> tags;
  Location location;
  double space;

  /// A Hologram shows a floating text at a specific Location using Armorstands.
  /// **Example:**
  ///
  /// ```dart
  /// Hologram('''
  /// Hello,
  /// World!
  /// ''',
  /// 	location:  Location.here(),
  /// 	color:Color.Aqua,
  /// )
  /// ```
  Hologram(
    String str, {
    @required this.location,
    Color color,
    this.tags,
    this.space = 0.25,
  }) {
    if (tags == null) {
      tags = ['objd_hologram'];
    } else {
      tags.add('objd_hologram');
    }

    texts = str
        .split('\n')
        .map((line) =>
            line.isNotEmpty ? TextComponent(line, color: color) : null)
        .toList();
  }

  /// If you wish you can assign each line a separate TextComponent with `Hologram.multiple`
  Hologram.multiple(
    this.texts, {
    @required this.location,
    this.tags,
    this.space = 0.25,
  }) {
    if (tags == null) {
      tags = ['objd_hologram'];
    } else {
      tags.add('objd_hologram');
    }
  }

  @override
  Widget generate(Context context) {
    var i = texts.length;
    if (i == 1) {
      return ArmorStand.staticMarker(
        location,
        name: texts[0],
        nameVisible: true,
        tags: tags,
      );
    }
    return Execute.positioned(location,
        children: (texts.map((text) {
          i--;
          if (text != null) {
            return ArmorStand.staticMarker(
                Location.rel(x: 0, y: i * space, z: 0),
                name: text,
                nameVisible: true,
                tags: tags);
          }
          return Comment.Null();
        }).toList()));
  }
}
