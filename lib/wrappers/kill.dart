import 'package:objd/basic/command.dart';
import 'package:objd/basic/entity.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/build/build.dart';

class Kill extends RestActionAble {
  Entity target;
  /// The Kill Command removes an entity.
  Kill([this.target]);
  
  @override
  Widget generate(Context context){
    if(target == null) return Command('kill');
    return Command('kill ' + target.toString());
  }
}
