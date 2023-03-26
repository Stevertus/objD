// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objd/src/basic/command.dart';
import 'package:objd/src/basic/types/entity.dart';
import 'package:objd/src/basic/types/location.dart';
import 'package:objd/src/basic/widget.dart';

import '../build/context.dart';

class CommandBuilder extends Widget {
  final String command;

  CommandBuilder(this.command);

  @override
  Widget generate(Context context) {
    return Command(command);
  }

  CommandBuilder copyWith({
    String? name,
    String? command,
  }) {
    return CommandBuilder(
      command ?? this.command,
    );
  }

  CommandBuilder string(
    String? str, {
    List<String>? also,
    String? prefix,
    String? suffix,
  }) {
    if (str == null || str.isEmpty) return this;

    if (prefix != null) str = prefix + str;
    if (suffix != null) str = suffix + str;
    if (also != null && also.isNotEmpty) str += ' ${also.join(' ')}';

    return copyWith(command: '$command $str');
  }

  CommandBuilder when(
    bool condition, {
    String? then,
    List<String>? also,
    String? prefix,
    String? suffix,
    String? otherwise,
  }) =>
      string(
        condition ? then : otherwise,
        also: also,
        prefix: prefix,
        suffix: suffix,
      );

  CommandBuilder entity(
    Entity? entity, {
    List<String>? also,
    String? prefix,
    String? suffix,
  }) =>
      string(
        entity.toString(),
        also: also,
        prefix: prefix,
        suffix: suffix,
      );
  CommandBuilder location(
    Location? location, {
    List<String>? also,
    String? prefix,
    String? suffix,
  }) =>
      string(
        location.toString(),
        also: also,
        prefix: prefix,
        suffix: suffix,
      );
}
