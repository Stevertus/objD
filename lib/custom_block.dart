import 'package:meta/meta.dart';
import 'package:objd/core.dart';

/// This Module allows you to create infinite new blocks in the game. It works by providing a [block] and an [item] that acts as a model for the new block.
class CustomBlock extends Module {
  String id;
  String name;
  Block block;
  Item item;
  Item blockModel;
  Widget main;
  Widget onBreak;
  Widget onPlaced;
  List<String> tags;
  bool generatePack;
  bool useItemFrame;
  bool fire;
  double yOffset;

  /// This Module allows you to create infinite new blocks in the game. It works by providing a [block] and an [item] that acts as a model for the new block.
  ///
  /// | constructor  |                                                                                      |
  /// | ------------ | ------------------------------------------------------------------------------------ |
  /// | String       | unique id for your block                                                             |
  /// | Item         | The item that should be used to place the block(you must use a spawnegg)             |
  /// | block        | the Block giving your custom block a hitbox(required)                                |
  /// | blockModel   | Item that overrides the item for the block Model                                     |
  /// | main         | Widget that runs every tick in the block                                             |
  /// | onPlaced     | Widget that gets executed when the block is placed                                   |
  /// | onBreak      | Widget that gets executed when the block is broken                                   |
  /// | tag          | List of Strings of Tags to apply to the block entity                                 |
  /// | generatePack | whether to generate the custom block as pack(default = true)                         |
  /// | useItemFrame | display the block in an invisible Item Frame(default = true)                         |
  /// | fire         | set the entity on fire to hide graying out when using a solid block(default = false) |
  ///
  /// You can use `getItem()` on your created block to get the spawnegg with all the required nbt data. This can be used further.
  ///
  /// When using the spawnegg an invisible armorstand or itemframe will spawn displaying the block model. This gives the illusion that this is a new block.
  ///
  /// With CustomModelData (`model` in objD) you can make as many of these as you want.
  ///
  /// **Example:**
  ///
  /// ```dart
  /// import 'package:objd/custom_block.dart';
  ///
  /// CustomBlock(
  /// 	'creative_name',
  /// 	Item(
  /// 		Items.chicken_spawn_egg,model: 2,
  /// 		name: TextComponent('Creative Block'),
  /// 	),
  /// 	block: Blocks.stone,
  /// 	useItemFrame: false,
  /// 	generatePack: false,
  /// )
  /// ```

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
    this.name,
    this.useItemFrame = false,
    this.yOffset = 1,
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
        count: item.count ?? 1,
        name: name != null ? TextComponent(name, italic: false) : null,
      );

  Widget _setblock({Widget fireTimer}) {
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
              location: Location.rel(y: yOffset),
              tags: ['objd_$id', ...tags],
              nbt: {
                'Invisible': 1,
                'Fixed': 1,
                'Item': headItem.copyWith(name: TextComponent(null)).getMap(),
                'Facing': 1,
                'Invulnerable': 1,
              },
            )
          : ArmorStand.staticMarker(
              Location.rel(y: yOffset - 0.5),
              tags: ['objd_$id', ...tags],
              head: headItem,
            ),
      onPlaced,
      if (fire != null && fire) fireTimer,
    ]);
  }

  Widget _blockLogic({Widget onbreak}) => For.of([
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
        if (main != null) main,
      ]);

  Widget _break() => For.of([
        Kill(
          Entity(distance: Range.to(1), type: Entities.item).not(
            tags: ['item_$id'],
          ),
        ),
        Summon(
          Entities.item,
          location: Location.rel(y: useItemFrame ? 0 : 0.5),
          nbt: {'Item': getItem().getMap()},
          tags: ['item_$id'],
        ),
        onBreak,
        Kill(Entity.Self()),
      ]);

  @override
  Widget generate(Context context) {
    assert(id != null && id.isNotEmpty);
    assert(block != null && block.toString().isNotEmpty);

    final path = generatePack ? '' : 'objd_blocks/$id';

    print(getItem().getMap());

    final res = For.of([
      Execute.asat(Entity(tags: ['objd_$id']), children: [
        File.execute(
          '$path/block',
          child: _blockLogic(
            onbreak: File.execute(
              '$path/break',
              child: _break(),
            ),
          ),
        ),
      ]),
      Execute.asat(
        Entity(
          type: Entities.area_effect_cloud,
          tags: ['summon_$id'],
        ),
        children: [
          File.execute(
            '$path/set',
            child: _setblock(
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
        ],
      ),
    ]);

    if (generatePack) return Pack(name: id, main: File('main', child: res));

    return res;
  }

  @override
  List<File> registerFiles() => [];
}
