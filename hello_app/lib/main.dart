import 'package:flutter/material.dart';

void main() => runApp(new Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.bounceInOut);
    _iconAnimationController.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.grey,
        body: new Stack(
          fit: StackFit.expand,
          children: [
            new Image(
                image: new AssetImage("assets/baazi2.jpeg"),
                fit: BoxFit.cover,
                color: Colors.black,
                colorBlendMode: BlendMode.darken),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new FlutterLogo(
                  size: _iconAnimation.value * 100,
                ),
                new Form(
                    child: Theme(
                  data: new ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.orange,
                      inputDecorationTheme: new InputDecorationTheme(
                          labelStyle: new TextStyle(
                              color: Colors.orange, fontSize: 20))),
                  child: new Container(
                      padding: const EdgeInsets.all(80),
                      child: new Column(
                        children: [
                          new TextFormField(
                            decoration:
                                new InputDecoration(labelText: "Enter Email"),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          new TextFormField(
                            decoration: new InputDecoration(
                                labelText: "Enter Password"),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          new MaterialButton(
                              color: Colors.red,
                              textColor: Colors.yellow,
                              child: new Text("LOGIN"),
                              splashColor: Colors.yellow,
                              onPressed: () => {})
                        ],
                      )),
                ))
              ],
            )
          ],
        ));
  }
}
