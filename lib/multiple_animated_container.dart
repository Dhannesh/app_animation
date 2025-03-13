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
  ViewState _viewState = ViewState.shrunk;
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
              width: _viewState == ViewState.expanded ? _expandedSize : _shrunkSize,
              height: _viewState == ViewState.expanded ? _expandedSize : _shrunkSize,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:
                  const DecorationImage(image: AssetImage("images/top.jpg"),
                    fit: BoxFit.cover
                  )
              ),
              duration: Duration(milliseconds: 3000),
              curve: Curves.linear,
            ),
            AnimatedContainer(
              width: _viewState == ViewState.expanded ? _expandedSize : _shrunkSize,
              height: _viewState == ViewState.expanded ? _expandedSize : _shrunkSize,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:
                  const DecorationImage(image: AssetImage("images/jeans.jpg"),
                      fit: BoxFit.cover
                  )
              ),
              duration: Duration(milliseconds: 3000),
              curve: Curves.linear,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _viewState = (_viewState == ViewState.expanded) ? ViewState.shrunk : ViewState.expanded;

          });
        },
        child: const Icon(Icons.play_arrow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }
}
