import 'package:flutter/material.dart';
import 'screens/wrap.dart';
import 'screens/wrap_change.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sidekick Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        'wrap': (context) =>
            SimpleScaffold(title: 'Wrap', child: WrapExample(sourceList2: [], targetList2: [])),
        'wrap_change': (context) =>
            SimpleScaffold(title: 'Wrap change', child: WrapChangeExample()),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sidekick Demo')),
      body: ListView(
        children: <Widget>[
          HomeTile(title: 'Wrap', color: Colors.indigo, route: 'wrap'),
          HomeTile(title: 'Wrap change', color: Colors.pink, route: 'wrap_change'),
        ],
      ),
    );
  }
}

class HomeTile extends StatelessWidget {
  const HomeTile({
    Key? key,
    required this.title,
    required this.color,
    required this.route,
  }) : super(key: key);

  final String title;
  final Color color;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(route),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Text(
              title,
              textAlign: TextAlign.center,

            ),
          ),
        ),
      ),
    );
  }
}

class SimpleScaffold extends StatelessWidget {
  const SimpleScaffold({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  final String title;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: child,
    );
  }
}
