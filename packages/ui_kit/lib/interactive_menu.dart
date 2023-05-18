import 'package:flutter/material.dart';

class InteractiveMenu extends StatefulWidget {
  final List<Widget> children;

  const InteractiveMenu({Key? key, required this.children}) : super(key: key);

  @override
  State<InteractiveMenu> createState() => _InteractiveMenuState();
}

class _InteractiveMenuState extends State<InteractiveMenu>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _sizeAnimationController;
  late Animation<double> _animation;
  late Animation<double> _sizeAnimation;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _sizeAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _sizeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _sizeAnimationController, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _animationController.dispose();
    _sizeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: AnimatedBuilder(
        animation:
            Listenable.merge([_animationController, _sizeAnimationController]),
        builder: (animationContext, child) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            width: isExpanded ? 160 * _sizeAnimation.value + 65 : 65,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            height: 65,
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: isExpanded ? BorderRadius.circular(24.0) : null,
                shape: isExpanded ? BoxShape.rectangle : BoxShape.circle),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    iconSize: isExpanded ? 30 * _sizeAnimation.value : 30,
                    onPressed: () {
                      if (isExpanded) {
                        _animationController.reverse();
                        _sizeAnimationController.reverse();
                      } else {
                        _animationController.forward();
                        _sizeAnimationController.forward();
                      }
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    icon: AnimatedIcon(
                      color: Colors.white,
                      progress: _animation,
                      icon: AnimatedIcons.menu_close,
                    )),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Transform.scale(
                        scale: _animation.value,
                        child: Container(
                          margin: const EdgeInsets.all(2.0),
                          alignment: Alignment.centerRight,
                          decoration: const BoxDecoration(
                              color: Colors.white24, shape: BoxShape.circle),
                          child: widget.children[index],
                        ),
                      );
                    },
                    itemCount: isExpanded ? widget.children.length : 0,
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
