import 'package:objd/basic/widget.dart';
import 'package:objd/build/build.dart';

class Extend extends Widget {
  Widget child;
  String path;
  bool first;
  Extend(this.path,{this.child, this.first = false}){
    this.path.replaceAll('.mcfunction', '');
    if(this.path.substring(0,1) == '/') this.path = this.path.substring(1);
  }

    @override
  Widget generate(Context context) {
      return child;
  }

  @override
  Map toMap(){
    return {'File':{'path':path,'child':child.toMap()}};
  }
}
