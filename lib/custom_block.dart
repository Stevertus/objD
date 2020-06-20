import 'package:meta/meta.dart';
import 'package:objd/core.dart';

class CustomBlock extends Module {
  final String id;
  final Block block;
  final Item item;
  final Item blockModel;
  final Widget main;
  final Widget onBreak;
  final Widget onPlaced;
  final List<String> tags;
  final bool generatePack;
  final bool useItemFrame;
  final bool fire;

  CustomBlock(
    this.id,
    this.item, {
    @required this.block,
    this.blockModel,
    this.main,
    this.onBreak,
    this.onPlaced,
    this.tags = const [],
    this.generatePack = true,
    this.fire = false,
    this.useItemFrame = true,
  })  : assert(id != null),
        assert(block != null),
        assert(item != null),
        assert(
          item.getId().contains('spawn_egg'),
          'You have to provide a spawn egg.',
        );

  Item getItem() => item.copyWith(
        nbt: {
          'EntityTag': {
            'id': Entities.area_effect_cloud.toString(),
            'Tags': ['summon_$id'],
            'Duration': 0,
            'WaitTime': 0,
            'Radius': 0,
          }
        },
      );

  Widget _setblock() {
    final headItem = (blockModel ?? item).copyWith(count: 1);
    return For.of([
      SetBlock(block, location: Location.here()),
      Clear(
        Entity.Player(gamemode: Gamemode.creative, distance: Range.to(6)),
        item.copyWith(count: 1),
      ),
      useItemFrame != null && useItemFrame
          ? Summon(
              Entities.item_frame,
              location: Location.rel(y: 1),
              tags: ['objd_$id', ...tags],
              nbt: {
                'Invisible': 1,
                'Fixed': 1,
                'Item': headItem.getMap(),
                'Facing': 1,
                'Invulnerable': 1,
              },
            )
          : ArmorStand.staticMarker(
              Location.here(),
              tags: ['objd_$id', ...tags],
              head: headItem,
            ),
    ]);
  }

  Widget _blockLogic({Widget onbreak, Widget fireTimer}) => For.of([
        If(
          Condition.and([
            Condition(Entity.Player(distance: Range.to(6))),
            Condition.not(
              Condition.block(
                Location.rel(y: useItemFrame ? -1 : 0),
                block: Block(block.id),
              ),
            )
          ]),
          then: [onbreak],
        ),
        if (fire != null && fire) fireTimer,
        if (main != null) main,
      ]);

  Widget _break() => For.of([
        Summon(
          Entities.item,
          location: Location.rel(y: useItemFrame ? 0 : 0.5),
          nbt: {'Item': getItem().getMap()},
          tags: ['item_$id'],
        ),
        Kill(
          Entity(distance: Range.to(1), type: Entities.item).not(
            tags: ['item_$id'],
          ),
        ),
        Kill(Entity.Self()),
      ]);

  @override
  Widget generate(Context context) {
    final path = generatePack ? '' : 'objd_blocks/$id';

    final res = For.of([
      Execute.asat(
        Entity(
          type: Entities.area_effect_cloud,
          tags: ['summon_$id'],
        ),
        children: [File.execute('$path/set', child: _setblock())],
      ),
      Execute.asat(Entity(tags: ['objd_$id']), children: [
        File.execute(
          '$path/block',
          child: _blockLogic(
            onbreak: File.execute(
              '$path/break',
              child: _break(),
            ),
            fireTimer: Timer(
              'fire_timer',
              path: path,
              ticks: 1200,
              children: [
                Data.merge(
                  Entity.Self(),
                  nbt: {'Fire': 1300},
                )
              ],
            ),
          ),
        ),
      ]),
    ]);

    if (generatePack) return Pack(name: id, main: File('main', child: res));

    return res;
  }

  @override
  List<File> registerFiles() => [];
}
