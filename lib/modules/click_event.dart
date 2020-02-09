import 'package:objd/core.dart';

/// The ClickEvent Module uses the trigger of a carrot on a stick to register right clicks with a scoreboard and execute a [onClick] Widget.
class ClickEvent extends Module {
  String path;
  String name;
  Widget onClick;
  Item selectedItem;
  final Score _score = Score.fromSelected('objd_click');

  /// The ClickEvent Module uses the trigger of a carrot on a stick to register right clicks with a scoreboard and execute a [onClick] Widget.
  ///
  /// This module has to be executed every tick to work!
  ///
  /// | constructor |  |
  /// |--|--|
  /// |name|used to identify different click Events|
  /// |onClick| Widget that is executed if the COAS is clicked |
  /// |selectedItem| just triggers the click if this Item is selected(optional) |
  /// |path| path to create the click handler function(default = `events/`) |

  ClickEvent({
    this.name = 'objd_click',
    this.onClick,
    this.selectedItem,
    this.path = 'events/',
  });

  @override
  Widget generate(Context context) {
    return For.of([
      Scoreboard('objd_click',
          type: 'minecraft.used:minecraft.carrot_on_a_stick'),
      Execute.asat(
          Entity.All(
              scores: [
                _score.matchesRange(
                  Range.from(1),
                ),
              ],
              nbt: selectedItem != null
                  ? {'SelectedItem': selectedItem.getMap()}
                  : null),
          children: [File.execute(path + name, create: false)]),
    ]);
  }

  @override
  List<File> registerFiles() => <File>[
        File(
          path + name,
          child: For.of([
            onClick,
            _score.reset(),
          ]),
        ),
      ];
}
