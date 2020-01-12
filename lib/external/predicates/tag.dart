abstract class Tag {
  Map<String, dynamic> getJson();
}

abstract class LocationTag extends Tag {}

abstract class ItemTag extends Tag {}
