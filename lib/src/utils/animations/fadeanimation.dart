// import 'package:flutter/material.dart';
// import 'package:simple_animations/simple_animations.dart';

// enum AniProp {
//   opacity,
//   translateY,
// }

// class FadeAnimation extends StatelessWidget {
//   final double delay;
//   final Widget child;

//   const FadeAnimation(
//       this.delay,
//       this.child, {
//         Key? key,
//       }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final tween = TimelineTween()
//       ..addScene(begin: Duration.zero, end: const Duration(milliseconds: 500))
//           .animate(
//         AniProp.opacity,
//         tween: Tween(begin: 0.0, end: 1.0),
//       )
//           .animate(
//         AniProp.translateY,
//         tween: Tween(begin: -30.0, end: 0.0),
//         curve: Curves.easeOut,
//       );

//     return PlayAnimation<TimelineValue>(
//       delay: Duration(milliseconds: (500 * delay).round()),
//       duration: tween.duration,
//       tween: tween,
//       builder: (context, child, animation) => Opacity(
//         opacity: animation.get(AniProp.opacity),
//         child: Transform.translate(
//           offset: Offset(
//             0,
//             animation.get(AniProp.translateY),
//           ),
//           child: child,
//         ),
//       ),
//       child: child,
//     );
//   }
// }
