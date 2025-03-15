import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class PhysicsDraggable extends StatelessWidget {
  const PhysicsDraggable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Physics Draggable'),
        backgroundColor: Colors.black54,
      ),
      body: DraggableCard(
          child: SizedBox(
        width: 150,
        height: 150,
        child: Image.asset(
          "images/dino.png",
          fit: BoxFit.cover,
        ),
      )),
    );
  }
}

class DraggableCard extends StatefulWidget {
  final Widget child;
  const DraggableCard({super.key, required this.child});

  @override
  State<DraggableCard> createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _animation;

  Alignment _dragAlignment = Alignment.center;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addListener(() {
      setState(() {
        _dragAlignment = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  void _runAnimation(Offset pixelPerSecond, Size size) {
    _animation = _controller
        .drive(AlignmentTween(begin: _dragAlignment, end: Alignment.center));

    final unitsPerSecondX = pixelPerSecond.dx / size.width;
    final unitsPerSecondY = pixelPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(mass: 10, stiffness: 10, damping: 1.0);
    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);
    _controller.animateWith(simulation);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onPanDown: (details) {
        _controller.stop();
      },
      onPanUpdate: (details) {
        setState(() {
          _dragAlignment += Alignment(
            details.delta.dx / (size.width / 2),
            details.delta.dy / (size.height / 2),
          );
        });
      },
      onPanEnd: (details) {
        _runAnimation(details.velocity.pixelsPerSecond, size);
      },
      child: Align(
          alignment: _dragAlignment,
          child: Card(
            child: widget.child,
          )),
    );
  }
}
