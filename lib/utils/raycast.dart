import 'package:objd/core.dart';

class Raycast extends Widget {
  int id;
  Entity entity;
  int max;
  double step;
  Block through;
  Widget Function(Function,Function) ray;
  List<Widget> onhit;
  bool _useStop = false;

  Score _maxScore;
  Tag _isHit = Tag("objd_ray_hit",entity: Entity.Selected());
  Tag _isStopped = Tag("objd_ray_stop",entity: Entity.Selected());

  Raycast(this.entity,{this.max,this.step = 1, this.through = Block.air, this.ray, this.onhit, String scoreName = "objd_count"}){
    if(max != null && max > 0) _maxScore = Score(entity,scoreName);
    if(onhit == null) onhit = [];
  }

  Widget _hit(){
    return _isHit.add();
  }
  Widget _stop(){
    _useStop = true;
    return _isStopped.add();
  }


  @override
  Widget generate(Context context) {
    id = Group.fileId;
    
    List<Widget> children = [
      If.not(through,Then:[_isHit.add()])
    ];
    if(ray != null) children.add(ray(_stop,_hit));
    if(_maxScore != null){
      _maxScore.entity = Entity.Selected();
      children.add(_maxScore.add());
    } ;

    // all and conditions
    List<Condition> conds = [
      Condition.not(_isHit)
    ];
    if(_useStop) conds.add(Condition.not(_isStopped));
    if(_maxScore != null) conds.add(Condition(_maxScore.matchesRange(Range(to: max))));

    children.add(Execute(If: Condition.and(conds), children: [
      File.recursive()
    ]).positioned(Location.local(z:step)));

    onhit.insert(0, Comment("This is the raycast result from your raycast widget in ${context.file}"));
    children.add(
      _isHit.removeIfExists(then: File.execute("objd/rayhit${id}",child:For.of(onhit)))
    );
    if(_useStop) children.add(_isStopped.remove());


    Execute ex = Execute(children: [
      Group(filename: "ray",children: children,groupMin: 0),
    ]);
    if(entity.selector != "s") ex = ex.asat(entity);
    ex = ex.anchored(Facing.eyes).positioned(Location.local()).anchored(Facing.feet);

    if(_maxScore != null) return For.of([_maxScore.set(0),ex]);
    return ex;
  }
}