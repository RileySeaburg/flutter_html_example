import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
// import 'dart:html';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: new MyHomePage(title: 'flutter_html Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

const htmlData = r"""
      <h1>Header 1</h1>
""";

final staticAnchorKey = GlobalKey();

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('flutter_html Example'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_downward),
          onPressed: () {
            final anchorContext =
                AnchorKey.forId(staticAnchorKey, "bottom")?.currentContext;
            if (anchorContext != null) {
              Scrollable.ensureVisible(anchorContext);
            }
          },
        ),
        body: ListView(
          children: [
            ElevatedButton(
              child: Text('Open flutter_html example'),
              onPressed: () {
                print('Generated HTML Goes here');
            
                // hydrate htmlData with the style provided
              },
            ),
            SingleChildScrollView(
              child: Html(
                anchorKey: staticAnchorKey,
                data: htmlData,
                style: {
                  'h1': Style(
                    fontSize: FontSize(30),
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                    color: Color.fromARGB(255, 177, 27, 27),
                  ),
                },
                
              
              )
            ),
          ],
        ));
  }
}

CustomRenderMatcher texMatcher() =>
    (context) => context.tree.element?.localName == 'tex';

CustomRenderMatcher birdMatcher() =>
    (context) => context.tree.element?.localName == 'bird';

CustomRenderMatcher flutterMatcher() =>
    (context) => context.tree.element?.localName == 'flutter';
