import 'package:objd/basic/for_list.dart';
import 'package:objd/basic/strait_widget.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/build.dart';

abstract class RestActionAble extends Widget {
  /// The writable list the RestAction writes it's contents on
  List<Widget> writable;

  /// Contains the Information, if this RestAction is already called (and can't be called again)
  bool called = false;

  ///Execute this method to add this to the WidgetList (can use default list or as parameter given list)
  ///This method can only be executed once, if it is executed multiple times you will get an Error. You can read out if it is already executed in the boolean Called

  ///Example for a queue method:
  ///```dart
  ///Entity.Selected().kill().queue();
  ///```

  ///Example for queue method with parameter
  ///```dart
  ///List<Widget> widget = [];
  ///Entity.Selected().kill().queue(cont);
  ///```

  void queue([List<Widget> writable]) {
    if (called) {
      throw ('Rest action is already executed, cant execute it again');
    }
    called = true;
    (writable ?? writable ?? StraitWidget.builder.writable).add(this);
  }

  @override
  dynamic generate(Context context) => null;
}

class RestAction extends RestActionAble {
  Widget _rest;

  @override
  List<Widget> writable;

  ///If autoQueue is enabled, you don't have to manually run the `queue()` method on your RestActions.

  ///Normal example without autoQueue
  ///```dart
  ///Entity.Selected().kill().queue();
  ///```

  ///Now with autoQueue
  ///```dart
  ///Entity.Selected().kill();
  ///```
  ///-----
  //I would not use this feature, because you don't always want everything to be queued automatically. Just use this feature, if you know what you're doing!**

  ///_Notice: This feature does not work everywhere, features like the execute command, that implement the RestAction and can be manipulated or Executed at the same time don't now when to Execute themselves, so this feature does not work in every case._

  static bool autoQueue = false;

  ///Example for a RestAction (The kill function here returns a RestAction). There are multiple ways of using it. The first is, just to execute it (only Possible inside of Strait content):
  ///```dart
  ///Entity.Selected().kill().queue();
  ///```
  ///You can also use the queue function on a List, so the contents are written inside it:
  ///```dart
  ///List<Widget> widget = [];
  ///Entity.Selected().kill().queue(cont);
  ///```
  ///Because the RestAction has the Widget as superclass, you can also use it like a normal widget, for example:
  ///```dart
  ///For.of([
  /// Entity.Selected().kill(),
  /// ...
  ///]);
  ///```

  ///Creation Example
  ///```dart
  ///RestAction([], Kill(...))
  ///```

  RestAction(this.writable, this._rest) {
    if (RestAction.autoQueue) queue();
  }

  ///RestActions are a big part of the Strait system, you have to pull your widgets anywhere, and the RestActions do that for you. You activate them by calling the
  ///queue function on them. A RestAction can only be executed once, it will throw an Exception if it is executed multiple times.

  ///Example for a RestAction (The kill function here returns a RestAction). There are multiple ways of using it. The first is, just to execute it (only Possible inside of Strait content):
  ///```dart
  ///Entity.Selected().kill().queue();
  ///```
  ///You can also use the queue function on a List, so the contents are written inside it:
  ///```dart
  ///List<Widget> widget = [];
  ///Entity.Selected().kill().queue(cont);
  ///```
  ///Because the RestAction has the Widget as superclass, you can also use it like a normal widget, for example:
  ///```dart
  ///For.of([
  /// Entity.Selected().kill(),
  /// ...
  ///]);
  ///```

  ///Creation Example
  ///```dart
  ///RestAction.all([], [
  /// Kill(...),
  /// Teleport(...)
  ///])
  ///```

  RestAction.all(List<Widget> writable, List<Widget> rest)
      : this(writable, For.of(rest));

  @override
  Widget generate(Context context) {
    return _rest;
  }
}

class RestActionBuilder {
  List<Widget> writable;

  /// Made for creating RestActions, useful for APIs if you need to create multiple RestActions
  RestActionBuilder(this.writable);

  // Creates a RestAction from a Widget
  RestActionAble create(Widget rest) {
    if (rest is RestActionAble) {
      rest.writable = writable;
      return rest;
    }
    return RestAction(writable, rest);
  }

  // Creates a RestAction from multiple Widgets
  RestActionAble createAll(List<Widget> rest) {
    return RestAction.all(writable, rest);
  }
}
