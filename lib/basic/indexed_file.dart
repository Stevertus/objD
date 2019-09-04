import 'package:objd/basic/file.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/context.dart';

class IndexedFile extends Widget {

  static Map<String,int> _indexed = {};

  static int getIndexed(String name){
    return IndexedFile._indexed[name] != null && IndexedFile._indexed[name] > 0 ? IndexedFile._indexed[name] : 0;
  }

  final String name;
  final String custom;
  final String path;
  final String pack;
  final Widget child;
  final bool execute;

  IndexedFile(this.name,{this.child,this.custom,this.path,this.execute = false,this.pack});

  int getId(){
    return IndexedFile.getIndexed(name);
  }

  @override
  generate(Context context) {
    String _name;
    if(custom != null) _name = custom;
    else {
      IndexedFile._indexed[name] = getId() + 1;
      _name = this.name + getId().toString();
    }
    if(path != null) _name = path.trim() + "/" + _name;
    return File(_name,child:child,execute: execute,pack: pack);
  }

}