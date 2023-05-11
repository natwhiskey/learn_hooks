import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:learn_hooks/page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends HookWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final isUpDate = useState(false);
    final _counter = useState(0);
    // int _counter = 0;

    // checkUpdate() {
    //   print('Hello World');
    // }

    useEffect(() {
      //TODO
      print('Hello World');
    }, [
      _counter.value
      ]);

    // useMemoized(() {
    //   // print('Hello World2');
    //   _counter.value++;
    // }, []);

    

    // print("object");

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${_counter.value}',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
                onPressed: () async {
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PageTest()));
                  isUpDate.value = true;
                  // checkUpdate();
                },
                child: Text('Press')),
            ElevatedButton(
                onPressed: () {
                  _counter.value = 0;
                },
                child: Text('Reset')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _counter.value++,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
