import 'package:flutter/material.dart';

class StlWidget extends StatefulWidget {
  const StlWidget({Key? key}) : super(key: key);

  @override
  _StlWidgetState createState() => _StlWidgetState();
}

class _StlWidgetState extends State<StlWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
      Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 30,
            bottom: 20,
            child: FloatingActionButton(
              onPressed: () {},
              child: const Icon(
                Icons.delete_outline,
                size: 40,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 30,
            child: FloatingActionButton(
              onPressed: () {},
              child: const Icon(
                Icons.add_circle_outline,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}