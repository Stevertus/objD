import 'entity.dart';

class Entities {
  // using cog generation tool to fetch blocks
  /*[[[cog
  import cog
  import requests

  version = '1.20/snapshots/23w12a'

  res = requests.get(f'https://raw.githubusercontent.com/PixiGeko/Minecraft-generated-data/master/{version}/custom-generated/registries/entity_type.txt')
  blocks = []
  for l in res.iter_lines():
      full = l.decode('UTF-8')
      id = full.split(':')[1]
      blocks.append(id)
      cog.outl(f"/// [{' '.join(s.capitalize() for s in id.split('_'))}](https://minecraft.wiki/w/{id})")
      cog.outl(f'///')
      cog.outl(f'/// _({full})_')
      cog.outl(f"static const EntityType {id} = EntityType('{full}');\n")
  ]]]*/
  /// [Allay](https://minecraft.wiki/w/allay)
  ///
  /// _(minecraft:allay)_
  static const EntityType allay = EntityType('minecraft:allay');

  /// [Area Effect Cloud](https://minecraft.wiki/w/area_effect_cloud)
  ///
  /// _(minecraft:area_effect_cloud)_
  static const EntityType area_effect_cloud = EntityType('minecraft:area_effect_cloud');

  /// [Armor Stand](https://minecraft.wiki/w/armor_stand)
  ///
  /// _(minecraft:armor_stand)_
  static const EntityType armor_stand = EntityType('minecraft:armor_stand');

  /// [Arrow](https://minecraft.wiki/w/arrow)
  ///
  /// _(minecraft:arrow)_
  static const EntityType arrow = EntityType('minecraft:arrow');

  /// [Axolotl](https://minecraft.wiki/w/axolotl)
  ///
  /// _(minecraft:axolotl)_
  static const EntityType axolotl = EntityType('minecraft:axolotl');

  /// [Bat](https://minecraft.wiki/w/bat)
  ///
  /// _(minecraft:bat)_
  static const EntityType bat = EntityType('minecraft:bat');

  /// [Bee](https://minecraft.wiki/w/bee)
  ///
  /// _(minecraft:bee)_
  static const EntityType bee = EntityType('minecraft:bee');

  /// [Blaze](https://minecraft.wiki/w/blaze)
  ///
  /// _(minecraft:blaze)_
  static const EntityType blaze = EntityType('minecraft:blaze');

  /// [Block Display](https://minecraft.wiki/w/block_display)
  ///
  /// _(minecraft:block_display)_
  static const EntityType block_display = EntityType('minecraft:block_display');

  /// [Boat](https://minecraft.wiki/w/boat)
  ///
  /// _(minecraft:boat)_
  static const EntityType boat = EntityType('minecraft:boat');

  /// [Camel](https://minecraft.wiki/w/camel)
  ///
  /// _(minecraft:camel)_
  static const EntityType camel = EntityType('minecraft:camel');

  /// [Cat](https://minecraft.wiki/w/cat)
  ///
  /// _(minecraft:cat)_
  static const EntityType cat = EntityType('minecraft:cat');

  /// [Cave Spider](https://minecraft.wiki/w/cave_spider)
  ///
  /// _(minecraft:cave_spider)_
  static const EntityType cave_spider = EntityType('minecraft:cave_spider');

  /// [Chest Boat](https://minecraft.wiki/w/chest_boat)
  ///
  /// _(minecraft:chest_boat)_
  static const EntityType chest_boat = EntityType('minecraft:chest_boat');

  /// [Chest Minecart](https://minecraft.wiki/w/chest_minecart)
  ///
  /// _(minecraft:chest_minecart)_
  static const EntityType chest_minecart = EntityType('minecraft:chest_minecart');

  /// [Chicken](https://minecraft.wiki/w/chicken)
  ///
  /// _(minecraft:chicken)_
  static const EntityType chicken = EntityType('minecraft:chicken');

  /// [Cod](https://minecraft.wiki/w/cod)
  ///
  /// _(minecraft:cod)_
  static const EntityType cod = EntityType('minecraft:cod');

  /// [Command Block Minecart](https://minecraft.wiki/w/command_block_minecart)
  ///
  /// _(minecraft:command_block_minecart)_
  static const EntityType command_block_minecart = EntityType('minecraft:command_block_minecart');

  /// [Cow](https://minecraft.wiki/w/cow)
  ///
  /// _(minecraft:cow)_
  static const EntityType cow = EntityType('minecraft:cow');

  /// [Creeper](https://minecraft.wiki/w/creeper)
  ///
  /// _(minecraft:creeper)_
  static const EntityType creeper = EntityType('minecraft:creeper');

  /// [Dolphin](https://minecraft.wiki/w/dolphin)
  ///
  /// _(minecraft:dolphin)_
  static const EntityType dolphin = EntityType('minecraft:dolphin');

  /// [Donkey](https://minecraft.wiki/w/donkey)
  ///
  /// _(minecraft:donkey)_
  static const EntityType donkey = EntityType('minecraft:donkey');

  /// [Dragon Fireball](https://minecraft.wiki/w/dragon_fireball)
  ///
  /// _(minecraft:dragon_fireball)_
  static const EntityType dragon_fireball = EntityType('minecraft:dragon_fireball');

  /// [Drowned](https://minecraft.wiki/w/drowned)
  ///
  /// _(minecraft:drowned)_
  static const EntityType drowned = EntityType('minecraft:drowned');

  /// [Egg](https://minecraft.wiki/w/egg)
  ///
  /// _(minecraft:egg)_
  static const EntityType egg = EntityType('minecraft:egg');

  /// [Elder Guardian](https://minecraft.wiki/w/elder_guardian)
  ///
  /// _(minecraft:elder_guardian)_
  static const EntityType elder_guardian = EntityType('minecraft:elder_guardian');

  /// [End Crystal](https://minecraft.wiki/w/end_crystal)
  ///
  /// _(minecraft:end_crystal)_
  static const EntityType end_crystal = EntityType('minecraft:end_crystal');

  /// [Ender Dragon](https://minecraft.wiki/w/ender_dragon)
  ///
  /// _(minecraft:ender_dragon)_
  static const EntityType ender_dragon = EntityType('minecraft:ender_dragon');

  /// [Ender Pearl](https://minecraft.wiki/w/ender_pearl)
  ///
  /// _(minecraft:ender_pearl)_
  static const EntityType ender_pearl = EntityType('minecraft:ender_pearl');

  /// [Enderman](https://minecraft.wiki/w/enderman)
  ///
  /// _(minecraft:enderman)_
  static const EntityType enderman = EntityType('minecraft:enderman');

  /// [Endermite](https://minecraft.wiki/w/endermite)
  ///
  /// _(minecraft:endermite)_
  static const EntityType endermite = EntityType('minecraft:endermite');

  /// [Evoker](https://minecraft.wiki/w/evoker)
  ///
  /// _(minecraft:evoker)_
  static const EntityType evoker = EntityType('minecraft:evoker');

  /// [Evoker Fangs](https://minecraft.wiki/w/evoker_fangs)
  ///
  /// _(minecraft:evoker_fangs)_
  static const EntityType evoker_fangs = EntityType('minecraft:evoker_fangs');

  /// [Experience Bottle](https://minecraft.wiki/w/experience_bottle)
  ///
  /// _(minecraft:experience_bottle)_
  static const EntityType experience_bottle = EntityType('minecraft:experience_bottle');

  /// [Experience Orb](https://minecraft.wiki/w/experience_orb)
  ///
  /// _(minecraft:experience_orb)_
  static const EntityType experience_orb = EntityType('minecraft:experience_orb');

  /// [Eye Of Ender](https://minecraft.wiki/w/eye_of_ender)
  ///
  /// _(minecraft:eye_of_ender)_
  static const EntityType eye_of_ender = EntityType('minecraft:eye_of_ender');

  /// [Falling Block](https://minecraft.wiki/w/falling_block)
  ///
  /// _(minecraft:falling_block)_
  static const EntityType falling_block = EntityType('minecraft:falling_block');

  /// [Fireball](https://minecraft.wiki/w/fireball)
  ///
  /// _(minecraft:fireball)_
  static const EntityType fireball = EntityType('minecraft:fireball');

  /// [Firework Rocket](https://minecraft.wiki/w/firework_rocket)
  ///
  /// _(minecraft:firework_rocket)_
  static const EntityType firework_rocket = EntityType('minecraft:firework_rocket');

  /// [Fishing Bobber](https://minecraft.wiki/w/fishing_bobber)
  ///
  /// _(minecraft:fishing_bobber)_
  static const EntityType fishing_bobber = EntityType('minecraft:fishing_bobber');

  /// [Fox](https://minecraft.wiki/w/fox)
  ///
  /// _(minecraft:fox)_
  static const EntityType fox = EntityType('minecraft:fox');

  /// [Frog](https://minecraft.wiki/w/frog)
  ///
  /// _(minecraft:frog)_
  static const EntityType frog = EntityType('minecraft:frog');

  /// [Furnace Minecart](https://minecraft.wiki/w/furnace_minecart)
  ///
  /// _(minecraft:furnace_minecart)_
  static const EntityType furnace_minecart = EntityType('minecraft:furnace_minecart');

  /// [Ghast](https://minecraft.wiki/w/ghast)
  ///
  /// _(minecraft:ghast)_
  static const EntityType ghast = EntityType('minecraft:ghast');

  /// [Giant](https://minecraft.wiki/w/giant)
  ///
  /// _(minecraft:giant)_
  static const EntityType giant = EntityType('minecraft:giant');

  /// [Glow Item Frame](https://minecraft.wiki/w/glow_item_frame)
  ///
  /// _(minecraft:glow_item_frame)_
  static const EntityType glow_item_frame = EntityType('minecraft:glow_item_frame');

  /// [Glow Squid](https://minecraft.wiki/w/glow_squid)
  ///
  /// _(minecraft:glow_squid)_
  static const EntityType glow_squid = EntityType('minecraft:glow_squid');

  /// [Goat](https://minecraft.wiki/w/goat)
  ///
  /// _(minecraft:goat)_
  static const EntityType goat = EntityType('minecraft:goat');

  /// [Guardian](https://minecraft.wiki/w/guardian)
  ///
  /// _(minecraft:guardian)_
  static const EntityType guardian = EntityType('minecraft:guardian');

  /// [Hoglin](https://minecraft.wiki/w/hoglin)
  ///
  /// _(minecraft:hoglin)_
  static const EntityType hoglin = EntityType('minecraft:hoglin');

  /// [Hopper Minecart](https://minecraft.wiki/w/hopper_minecart)
  ///
  /// _(minecraft:hopper_minecart)_
  static const EntityType hopper_minecart = EntityType('minecraft:hopper_minecart');

  /// [Horse](https://minecraft.wiki/w/horse)
  ///
  /// _(minecraft:horse)_
  static const EntityType horse = EntityType('minecraft:horse');

  /// [Husk](https://minecraft.wiki/w/husk)
  ///
  /// _(minecraft:husk)_
  static const EntityType husk = EntityType('minecraft:husk');

  /// [Illusioner](https://minecraft.wiki/w/illusioner)
  ///
  /// _(minecraft:illusioner)_
  static const EntityType illusioner = EntityType('minecraft:illusioner');

  /// [Interaction](https://minecraft.wiki/w/interaction)
  ///
  /// _(minecraft:interaction)_
  static const EntityType interaction = EntityType('minecraft:interaction');

  /// [Iron Golem](https://minecraft.wiki/w/iron_golem)
  ///
  /// _(minecraft:iron_golem)_
  static const EntityType iron_golem = EntityType('minecraft:iron_golem');

  /// [Item](https://minecraft.wiki/w/item)
  ///
  /// _(minecraft:item)_
  static const EntityType item = EntityType('minecraft:item');

  /// [Item Display](https://minecraft.wiki/w/item_display)
  ///
  /// _(minecraft:item_display)_
  static const EntityType item_display = EntityType('minecraft:item_display');

  /// [Item Frame](https://minecraft.wiki/w/item_frame)
  ///
  /// _(minecraft:item_frame)_
  static const EntityType item_frame = EntityType('minecraft:item_frame');

  /// [Leash Knot](https://minecraft.wiki/w/leash_knot)
  ///
  /// _(minecraft:leash_knot)_
  static const EntityType leash_knot = EntityType('minecraft:leash_knot');

  /// [Lightning Bolt](https://minecraft.wiki/w/lightning_bolt)
  ///
  /// _(minecraft:lightning_bolt)_
  static const EntityType lightning_bolt = EntityType('minecraft:lightning_bolt');

  /// [Llama](https://minecraft.wiki/w/llama)
  ///
  /// _(minecraft:llama)_
  static const EntityType llama = EntityType('minecraft:llama');

  /// [Llama Spit](https://minecraft.wiki/w/llama_spit)
  ///
  /// _(minecraft:llama_spit)_
  static const EntityType llama_spit = EntityType('minecraft:llama_spit');

  /// [Magma Cube](https://minecraft.wiki/w/magma_cube)
  ///
  /// _(minecraft:magma_cube)_
  static const EntityType magma_cube = EntityType('minecraft:magma_cube');

  /// [Marker](https://minecraft.wiki/w/marker)
  ///
  /// _(minecraft:marker)_
  static const EntityType marker = EntityType('minecraft:marker');

  /// [Minecart](https://minecraft.wiki/w/minecart)
  ///
  /// _(minecraft:minecart)_
  static const EntityType minecart = EntityType('minecraft:minecart');

  /// [Mooshroom](https://minecraft.wiki/w/mooshroom)
  ///
  /// _(minecraft:mooshroom)_
  static const EntityType mooshroom = EntityType('minecraft:mooshroom');

  /// [Mule](https://minecraft.wiki/w/mule)
  ///
  /// _(minecraft:mule)_
  static const EntityType mule = EntityType('minecraft:mule');

  /// [Ocelot](https://minecraft.wiki/w/ocelot)
  ///
  /// _(minecraft:ocelot)_
  static const EntityType ocelot = EntityType('minecraft:ocelot');

  /// [Painting](https://minecraft.wiki/w/painting)
  ///
  /// _(minecraft:painting)_
  static const EntityType painting = EntityType('minecraft:painting');

  /// [Panda](https://minecraft.wiki/w/panda)
  ///
  /// _(minecraft:panda)_
  static const EntityType panda = EntityType('minecraft:panda');

  /// [Parrot](https://minecraft.wiki/w/parrot)
  ///
  /// _(minecraft:parrot)_
  static const EntityType parrot = EntityType('minecraft:parrot');

  /// [Phantom](https://minecraft.wiki/w/phantom)
  ///
  /// _(minecraft:phantom)_
  static const EntityType phantom = EntityType('minecraft:phantom');

  /// [Pig](https://minecraft.wiki/w/pig)
  ///
  /// _(minecraft:pig)_
  static const EntityType pig = EntityType('minecraft:pig');

  /// [Piglin](https://minecraft.wiki/w/piglin)
  ///
  /// _(minecraft:piglin)_
  static const EntityType piglin = EntityType('minecraft:piglin');

  /// [Piglin Brute](https://minecraft.wiki/w/piglin_brute)
  ///
  /// _(minecraft:piglin_brute)_
  static const EntityType piglin_brute = EntityType('minecraft:piglin_brute');

  /// [Pillager](https://minecraft.wiki/w/pillager)
  ///
  /// _(minecraft:pillager)_
  static const EntityType pillager = EntityType('minecraft:pillager');

  /// [Player](https://minecraft.wiki/w/player)
  ///
  /// _(minecraft:player)_
  static const EntityType player = EntityType('minecraft:player');

  /// [Polar Bear](https://minecraft.wiki/w/polar_bear)
  ///
  /// _(minecraft:polar_bear)_
  static const EntityType polar_bear = EntityType('minecraft:polar_bear');

  /// [Potion](https://minecraft.wiki/w/potion)
  ///
  /// _(minecraft:potion)_
  static const EntityType potion = EntityType('minecraft:potion');

  /// [Pufferfish](https://minecraft.wiki/w/pufferfish)
  ///
  /// _(minecraft:pufferfish)_
  static const EntityType pufferfish = EntityType('minecraft:pufferfish');

  /// [Rabbit](https://minecraft.wiki/w/rabbit)
  ///
  /// _(minecraft:rabbit)_
  static const EntityType rabbit = EntityType('minecraft:rabbit');

  /// [Ravager](https://minecraft.wiki/w/ravager)
  ///
  /// _(minecraft:ravager)_
  static const EntityType ravager = EntityType('minecraft:ravager');

  /// [Salmon](https://minecraft.wiki/w/salmon)
  ///
  /// _(minecraft:salmon)_
  static const EntityType salmon = EntityType('minecraft:salmon');

  /// [Sheep](https://minecraft.wiki/w/sheep)
  ///
  /// _(minecraft:sheep)_
  static const EntityType sheep = EntityType('minecraft:sheep');

  /// [Shulker](https://minecraft.wiki/w/shulker)
  ///
  /// _(minecraft:shulker)_
  static const EntityType shulker = EntityType('minecraft:shulker');

  /// [Shulker Bullet](https://minecraft.wiki/w/shulker_bullet)
  ///
  /// _(minecraft:shulker_bullet)_
  static const EntityType shulker_bullet = EntityType('minecraft:shulker_bullet');

  /// [Silverfish](https://minecraft.wiki/w/silverfish)
  ///
  /// _(minecraft:silverfish)_
  static const EntityType silverfish = EntityType('minecraft:silverfish');

  /// [Skeleton](https://minecraft.wiki/w/skeleton)
  ///
  /// _(minecraft:skeleton)_
  static const EntityType skeleton = EntityType('minecraft:skeleton');

  /// [Skeleton Horse](https://minecraft.wiki/w/skeleton_horse)
  ///
  /// _(minecraft:skeleton_horse)_
  static const EntityType skeleton_horse = EntityType('minecraft:skeleton_horse');

  /// [Slime](https://minecraft.wiki/w/slime)
  ///
  /// _(minecraft:slime)_
  static const EntityType slime = EntityType('minecraft:slime');

  /// [Small Fireball](https://minecraft.wiki/w/small_fireball)
  ///
  /// _(minecraft:small_fireball)_
  static const EntityType small_fireball = EntityType('minecraft:small_fireball');

  /// [Sniffer](https://minecraft.wiki/w/sniffer)
  ///
  /// _(minecraft:sniffer)_
  static const EntityType sniffer = EntityType('minecraft:sniffer');

  /// [Snow Golem](https://minecraft.wiki/w/snow_golem)
  ///
  /// _(minecraft:snow_golem)_
  static const EntityType snow_golem = EntityType('minecraft:snow_golem');

  /// [Snowball](https://minecraft.wiki/w/snowball)
  ///
  /// _(minecraft:snowball)_
  static const EntityType snowball = EntityType('minecraft:snowball');

  /// [Spawner Minecart](https://minecraft.wiki/w/spawner_minecart)
  ///
  /// _(minecraft:spawner_minecart)_
  static const EntityType spawner_minecart = EntityType('minecraft:spawner_minecart');

  /// [Spectral Arrow](https://minecraft.wiki/w/spectral_arrow)
  ///
  /// _(minecraft:spectral_arrow)_
  static const EntityType spectral_arrow = EntityType('minecraft:spectral_arrow');

  /// [Spider](https://minecraft.wiki/w/spider)
  ///
  /// _(minecraft:spider)_
  static const EntityType spider = EntityType('minecraft:spider');

  /// [Squid](https://minecraft.wiki/w/squid)
  ///
  /// _(minecraft:squid)_
  static const EntityType squid = EntityType('minecraft:squid');

  /// [Stray](https://minecraft.wiki/w/stray)
  ///
  /// _(minecraft:stray)_
  static const EntityType stray = EntityType('minecraft:stray');

  /// [Strider](https://minecraft.wiki/w/strider)
  ///
  /// _(minecraft:strider)_
  static const EntityType strider = EntityType('minecraft:strider');

  /// [Tadpole](https://minecraft.wiki/w/tadpole)
  ///
  /// _(minecraft:tadpole)_
  static const EntityType tadpole = EntityType('minecraft:tadpole');

  /// [Text Display](https://minecraft.wiki/w/text_display)
  ///
  /// _(minecraft:text_display)_
  static const EntityType text_display = EntityType('minecraft:text_display');

  /// [Tnt](https://minecraft.wiki/w/tnt)
  ///
  /// _(minecraft:tnt)_
  static const EntityType tnt = EntityType('minecraft:tnt');

  /// [Tnt Minecart](https://minecraft.wiki/w/tnt_minecart)
  ///
  /// _(minecraft:tnt_minecart)_
  static const EntityType tnt_minecart = EntityType('minecraft:tnt_minecart');

  /// [Trader Llama](https://minecraft.wiki/w/trader_llama)
  ///
  /// _(minecraft:trader_llama)_
  static const EntityType trader_llama = EntityType('minecraft:trader_llama');

  /// [Trident](https://minecraft.wiki/w/trident)
  ///
  /// _(minecraft:trident)_
  static const EntityType trident = EntityType('minecraft:trident');

  /// [Tropical Fish](https://minecraft.wiki/w/tropical_fish)
  ///
  /// _(minecraft:tropical_fish)_
  static const EntityType tropical_fish = EntityType('minecraft:tropical_fish');

  /// [Turtle](https://minecraft.wiki/w/turtle)
  ///
  /// _(minecraft:turtle)_
  static const EntityType turtle = EntityType('minecraft:turtle');

  /// [Vex](https://minecraft.wiki/w/vex)
  ///
  /// _(minecraft:vex)_
  static const EntityType vex = EntityType('minecraft:vex');

  /// [Villager](https://minecraft.wiki/w/villager)
  ///
  /// _(minecraft:villager)_
  static const EntityType villager = EntityType('minecraft:villager');

  /// [Vindicator](https://minecraft.wiki/w/vindicator)
  ///
  /// _(minecraft:vindicator)_
  static const EntityType vindicator = EntityType('minecraft:vindicator');

  /// [Wandering Trader](https://minecraft.wiki/w/wandering_trader)
  ///
  /// _(minecraft:wandering_trader)_
  static const EntityType wandering_trader = EntityType('minecraft:wandering_trader');

  /// [Warden](https://minecraft.wiki/w/warden)
  ///
  /// _(minecraft:warden)_
  static const EntityType warden = EntityType('minecraft:warden');

  /// [Witch](https://minecraft.wiki/w/witch)
  ///
  /// _(minecraft:witch)_
  static const EntityType witch = EntityType('minecraft:witch');

  /// [Wither](https://minecraft.wiki/w/wither)
  ///
  /// _(minecraft:wither)_
  static const EntityType wither = EntityType('minecraft:wither');

  /// [Wither Skeleton](https://minecraft.wiki/w/wither_skeleton)
  ///
  /// _(minecraft:wither_skeleton)_
  static const EntityType wither_skeleton = EntityType('minecraft:wither_skeleton');

  /// [Wither Skull](https://minecraft.wiki/w/wither_skull)
  ///
  /// _(minecraft:wither_skull)_
  static const EntityType wither_skull = EntityType('minecraft:wither_skull');

  /// [Wolf](https://minecraft.wiki/w/wolf)
  ///
  /// _(minecraft:wolf)_
  static const EntityType wolf = EntityType('minecraft:wolf');

  /// [Zoglin](https://minecraft.wiki/w/zoglin)
  ///
  /// _(minecraft:zoglin)_
  static const EntityType zoglin = EntityType('minecraft:zoglin');

  /// [Zombie](https://minecraft.wiki/w/zombie)
  ///
  /// _(minecraft:zombie)_
  static const EntityType zombie = EntityType('minecraft:zombie');

  /// [Zombie Horse](https://minecraft.wiki/w/zombie_horse)
  ///
  /// _(minecraft:zombie_horse)_
  static const EntityType zombie_horse = EntityType('minecraft:zombie_horse');

  /// [Zombie Villager](https://minecraft.wiki/w/zombie_villager)
  ///
  /// _(minecraft:zombie_villager)_
  static const EntityType zombie_villager = EntityType('minecraft:zombie_villager');

  /// [Zombified Piglin](https://minecraft.wiki/w/zombified_piglin)
  ///
  /// _(minecraft:zombified_piglin)_
  static const EntityType zombified_piglin = EntityType('minecraft:zombified_piglin');

  //[[[end]]]

  /// A List of all Minecraft entities
  static List<EntityType> get all => const [
        /*[[[cog
    for b in blocks:
      cog.outl(f'{b},')
    ]]]*/
    allay,
    area_effect_cloud,
    armor_stand,
    arrow,
    axolotl,
    bat,
    bee,
    blaze,
    block_display,
    boat,
    camel,
    cat,
    cave_spider,
    chest_boat,
    chest_minecart,
    chicken,
    cod,
    command_block_minecart,
    cow,
    creeper,
    dolphin,
    donkey,
    dragon_fireball,
    drowned,
    egg,
    elder_guardian,
    end_crystal,
    ender_dragon,
    ender_pearl,
    enderman,
    endermite,
    evoker,
    evoker_fangs,
    experience_bottle,
    experience_orb,
    eye_of_ender,
    falling_block,
    fireball,
    firework_rocket,
    fishing_bobber,
    fox,
    frog,
    furnace_minecart,
    ghast,
    giant,
    glow_item_frame,
    glow_squid,
    goat,
    guardian,
    hoglin,
    hopper_minecart,
    horse,
    husk,
    illusioner,
    interaction,
    iron_golem,
    item,
    item_display,
    item_frame,
    leash_knot,
    lightning_bolt,
    llama,
    llama_spit,
    magma_cube,
    marker,
    minecart,
    mooshroom,
    mule,
    ocelot,
    painting,
    panda,
    parrot,
    phantom,
    pig,
    piglin,
    piglin_brute,
    pillager,
    player,
    polar_bear,
    potion,
    pufferfish,
    rabbit,
    ravager,
    salmon,
    sheep,
    shulker,
    shulker_bullet,
    silverfish,
    skeleton,
    skeleton_horse,
    slime,
    small_fireball,
    sniffer,
    snow_golem,
    snowball,
    spawner_minecart,
    spectral_arrow,
    spider,
    squid,
    stray,
    strider,
    tadpole,
    text_display,
    tnt,
    tnt_minecart,
    trader_llama,
    trident,
    tropical_fish,
    turtle,
    vex,
    villager,
    vindicator,
    wandering_trader,
    warden,
    witch,
    wither,
    wither_skeleton,
    wither_skull,
    wolf,
    zoglin,
    zombie,
    zombie_horse,
    zombie_villager,
    zombified_piglin,
        //[[[end]]]
      ];
}
