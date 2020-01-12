class Entity {
  final EntityValue _entity;

  const Entity.This() : _entity = EntityValue.This;
  const Entity.Killer() : _entity = EntityValue.Killer;
  const Entity.Killer_player() : _entity = EntityValue.Killer_player;

  @override
  String toString() {
    return _entity.toString().split('.')[1].toLowerCase();
  }
}

enum EntityValue {
  This,
  Killer,
  Killer_player,
}
