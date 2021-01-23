import 'package:objd/src/basic/for_list.dart';
import 'package:objd/src/basic/pack.dart';
import 'package:objd/src/basic/widget.dart';
import 'package:objd/src/build/context.dart';

List<Pack> findPacks(Widget wid, {Context context}) {
  if (wid is Pack) return [wid];
  if (wid is For) {
    var packs = <Pack>[];
    for (var child in wid.children) {
      var res = findPacks(child);
      if (res is List<Pack>) packs.addAll(res);
    }
    if (packs.isNotEmpty) return packs;
  }

  // maybe add a limit here
  final child = wid.generate(context);

  if (child is Widget) return findPacks(child);

  throw ('Can not find a pack. Please make sure you have a Pack in your Widget Tree.');
}
