import 'package:flutter/material.dart';

class MultipleAnimatedContainer extends StatefulWidget {
  const MultipleAnimatedContainer({super.key});

  @override
  State<MultipleAnimatedContainer> createState() => _MultipleAnimatedContainerState();
}

enum ViewState {
  shrunk,
  expanded
}

class _MultipleAnimatedContainerState extends State<MultipleAnimatedContainer> {
  ViewState _topViewState = ViewState.shrunk;
  ViewState _jeansViewState = ViewState.shrunk;
  final double _shrunkSize = 150.0;
  final double _expandedSize = 300.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text("Multiple Animation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedContainer(
              width: _topViewState == ViewState.expanded ? _expandedSize : _shrunkSize,
              height: _topViewState == ViewState.expanded ? _expandedSize : _shrunkSize,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:
                  const DecorationImage(image: AssetImage("images/top.jpg"),
                    fit: BoxFit.cover
                  )
              ),
              duration: Duration(milliseconds: 3000),
              curve: Curves.bounceIn,
              onEnd: (){
                setState(() {
                  _jeansViewState = (_jeansViewState==ViewState.expanded) ? ViewState.shrunk: ViewState.expanded;
                });
              },
            ),
            AnimatedContainer(
              width: _jeansViewState == ViewState.expanded ? _expandedSize : _shrunkSize,
              height: _jeansViewState == ViewState.expanded ? _expandedSize : _shrunkSize,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:
                  const DecorationImage(image: AssetImage("images/jeans.jpg"),
                      fit: BoxFit.cover
                  )
              ),
              duration: Duration(milliseconds: 3000),
              curve: Curves.elasticIn,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _topViewState = (_topViewState == ViewState.expanded) ? ViewState.shrunk : ViewState.expanded;

          });
        },
        child: const Icon(Icons.play_arrow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }
}
