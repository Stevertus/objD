import 'package:objd/core.dart';

class LoadFile extends Widget {
  /// The load file is put in a separate widget to split the code in several files
  LoadFile();

  @override
  Widget generate(Context context) {
    return For.of([
      Data.merge(Entity.All(), nbt: {
        "uuid": UUID(1, 2, 3, 4),
        'name': TextComponent('name'),
      }),
    ]);
  }
}
