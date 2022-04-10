# objD

### **O**bjective **B**uilder **J**ust for **D**atapacks

[objD](https://objd.stevertus.com) is an object oriented toolkit for building/generating Datapacks for Minecraft. It uses the [Dart](https://www.dartlang.org/guides/language/language-tour) programming language and thus integrates into popular editors like [Visual Studio Code](https://code.visualstudio.com) or [IntelliJ](https://www.jetbrains.com/idea/).

You are able to write **modular** Datapacks, get suggestions with **linting**, **auto completion**, extensive [documentation](https://objd.stevertus.com) and **syntax highlighting**.

No need to remember which parameters commands take, automatic checking of your code and a ton of [utility widgets](https://objd.stevertus.com/utils/) help you to get more efficient creating Datapacks.

## Resources

Learning objD is hard. But there are a few things that can accelerate your start.

- [Introductory Video](https://youtu.be/0GfuCUNI1pw) showing everything from project structure, editor setup to installation.
- [Officical Documentation](https://objd.stevertus.com)
- YouTube [Playlist](https://www.youtube.com/playlist?list=PL5AxRIlgrL5GnKz69w4AUyqpZC35BlxdD) containing over 40 videos on best practices, widgets, generators and more.
- Starter Guide as written form: https://objd.stevertus.com/guide/
- [Discord Server](https://discord.gg/mKFrqfA) for general questions and interaction
- GitHub [Discussions](https://github.com/Stevertus/objD/discussions) for ideas, issues and questions

## Installation

You need the Dart SDK for this library. Download and install it from https://www.dartlang.org/tools/sdk

I would also recommend Visual Studio Code along with the [dart plugin](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code) to edit dart files very conveniently.

To get started, it is the easiest to use the _objD CLI_ for generating a sample project, make small changes and let it run with hot reload.

Install it using

```bash
dart pub global activate objd_cli
```

You can then invoke the new command to create your project, follow the instructions:

```bash
dart pub global run objd_cli new <project_name>
```

For further explanations, refer to the [Intro Video](https://youtu.be/0GfuCUNI1pw), where this is presented in depth.

## Example

objD is all about nesting, abstracting the sequential nature of commands into so called [Widgets](https://objd.stevertus.com/basics/#widget) and allowing powerful combinations.

```dart
For(
  from: 0,
  to: n,
  create: (i) => ArmorStand(
    Location.rel(x: i.toDouble()),
    name: TextComponent("Number $i"),
    nameVisible: true,
    pose: Pose(
      head: [360 * i / n - 180],
    ),
  ),
),
```

This simple example creates n armor stands(depending on a variable) each with custom names and pose.

Where in vanilla commands you would have to change multiple commands, this approach is **flexible** and can easily controlled by parameters.

## Contributing & Bugs

New and fresh ideas are always welcome and greatly appreciated. Please create a [pull request](https://github.com/Stevertus/objD/pulls)to organize new additions.

Bugs can be reported using [GitHub Issues](https://github.com/Stevertus/objD/issues).

Huge thanks to everyone who participated and made objD a better tool ❤.
