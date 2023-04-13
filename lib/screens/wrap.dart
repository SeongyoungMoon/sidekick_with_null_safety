import 'package:flutter/material.dart';
import 'package:sidekick_with_null_safety/sidekick/flutter_sidekick.dart';

class Item {
  Item({
    required this.id,
    this.isBlank = false,
  });

  final int id;
  final bool isBlank;
}

class WrapExample extends StatefulWidget {
  const WrapExample({
    Key? key,
    required this.sourceList2,
    required this.targetList2,
  }) : super(key: key);

  final List<Item> sourceList2;
  final List<Item> targetList2;

  @override
  State<WrapExample> createState() => _WrapExampleState();
}
List<Item> sourceList = [];
List<Item> targetList = List.generate(10, (i) => Item(id: i));

class _WrapExampleState extends State<WrapExample> {
  @override
  Widget build(BuildContext context) {
    return SidekickTeamBuilder<Item>(
      initialSourceList: sourceList,
      initialTargetList: targetList,
      builder: (context, sourceBuilderDelegates, targetBuilderDelegates) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 120.0,
                child: Wrap(
                  children: sourceBuilderDelegates
                      .map((builderDelegate) => builderDelegate.build(
                    context,
                    WrapItem(builderDelegate.message, true),
                    animationBuilder: (animation) => CurvedAnimation(
                      parent: animation,
                      curve: Curves.ease,
                    ),
                  ))
                      .toList(),
                ),
              ),
              SizedBox(
                height: 250.0,
                child: Wrap(
                  children: targetBuilderDelegates
                      .map((builderDelegate) => builderDelegate.build(
                    context,
                    WrapItem(builderDelegate.message, false),
                    animationBuilder: (animation) => CurvedAnimation(
                      parent: animation,
                      curve: FlippedCurve(Curves.ease),
                    ),
                  ))
                      .toList(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class WrapItem extends StatelessWidget {
  const WrapItem(
      this.item,
      this.isSource,
      ) : size = isSource ? 40.0 : 50.0;
  final bool isSource;
  final double size;
  final Item item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isSource) sourceList.add(Item(id: item.id, isBlank: true));
        SidekickTeamBuilder.of<Item>(context)!.move(item);
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          height: size - 4,
          width: size - 4,
          color: _getColor(item.id),
          child: Center(child: Text(item.isBlank ? item.id.toString() : "blank")),
        ),
      ),
    );
  }

  Color _getColor(int index) {
    switch (index % 4) {
      case 0:
        return Colors.blue;
      case 1:
        return Colors.green;
      case 2:
        return Colors.yellow;
      case 3:
        return Colors.red;
    }
    return Colors.indigo;
  }
}
