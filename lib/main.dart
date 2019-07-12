import 'dart:math';

import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());

List<String> usuarios = [];
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Chilaquiles',)
    );
  }

  

  Widget  _widgetRuleta(){
    return Image(
      image: NetworkImage('https://i0.wp.com/www.viveconectado.cl/v3/wp-content/plugins/winwheel4wp/uploads/custom_wheel_image_5bd8ad84c9880_5be26eec34338.png?w=1200&ssl=1'),);

  }

}
class MyHomePage extends StatefulWidget {
    MyHomePage({Key key,this.title}) : super(key: key);

    final String title;
    

    
  
    _MyHomePageState createState() => _MyHomePageState();
  }
  
  class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
    AnimationController _controller;
     Random random = new Random();
    @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
    
    @override
    Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(
           title: Text(widget.title),
         ),
         body: Center(
           child: Column(
            children: <Widget>[
              RotationTransition(
                turns: Tween(
                  begin: 0.0, end: 1.0).animate(_controller),
                  child: Image(
                    image: NetworkImage('https://i0.wp.com/www.viveconectado.cl/v3/wp-content/plugins/winwheel4wp/uploads/custom_wheel_image_5bd8ad84c9880_5be26eec34338.png?w=1200&ssl=1'),),   
              ),
              RaisedButton(
                child: Text('go'),
                onPressed: ()=> _controller.animateTo(random.nextDouble()),
              ),
              RaisedButton(
                child: Text('Reset'),
                onPressed: ()=> _controller.reset(),
              ),
            ],
           ),
        ),
      );
    }
  }