import 'package:flutter/material.dart';
import 'wrap.dart';

class WrapChangeExample extends StatefulWidget {
  @override
  _WrapChangeExampleState createState() => new _WrapChangeExampleState();
}

class _WrapChangeExampleState extends State<WrapChangeExample> {
  List<Item> _sourceList = [];
  List<Item> _targetList = [];

  void initState() {
    super.initState();
    _sourceList = List.generate(20, (i) => Item(id: i));
    _targetList = <Item>[];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: WrapExample(
            sourceList2: _sourceList,
            targetList2: _targetList,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: addSourceItem,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: Center(child: Text('add source')),
              ),
            ),
            GestureDetector(
              onTap: addTargetItem,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: Center(child: Text('add target')),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void addSourceItem() {
    setState(() {
      _sourceList.add(Item(id: _sourceList.length));
    });
  }

  void addTargetItem() {
    setState(() {
      _targetList.add(Item(id: _targetList.length * 1000));
    });
  }
}
