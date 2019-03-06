import 'package:objd/basic/command.dart';
import 'package:objd/basic/entity.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/build.dart';

class Kill extends Widget {
  Entity target;
  /// The Kill Command removes an entity.
  Kill(this.target);
  
  @override
  Widget generate(Context context){
    return new Command('kill ' + target.toString());
  }
}
