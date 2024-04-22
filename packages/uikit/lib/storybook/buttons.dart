part of 'storybook_widget.dart';

class _ButtonsStorybook extends StatelessWidget {
  const _ButtonsStorybook();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Button.primary(
              title: const Text('Primary Button'),
              onPressed: () {},
            ),
            Button.primary(
              title: const Text('Primary Button'),
              onPressed: () {},
              isLoading: true,
            ),
            Button.secondary(
              title: const Text('Secondary Button'),
              onPressed: () {},
            ),
            Button.ghost(
              title: const Text('Ghost Button'),
              onPressed: () {},
            ),
            Button.dangerUnderline(
              title: const Text('Danger Underline Button'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:uikit/molecules/button/input_button.dart';
//
// class InputButtonStorybook extends StatefulWidget {
//   const InputButtonStorybook({super.key});
//
//   @override
//   State<InputButtonStorybook> createState() => _InputButtonStorybookState();
// }
//
// class _InputButtonStorybookState extends State<InputButtonStorybook> {
//   Color? _color;
//   final _random = Random();
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         children: [
//           InputButton(
//             text: _color?.toString() ?? "",
//             placeholderText: 'Press to change color',
//             onTap: () {
//               setState(
//                 () {
//                   _color = Color(
//                     (_random.nextDouble() * 0xFFFFFF).toInt(),
//                   ).withOpacity(1.0);
//                 },
//               );
//             },
//           ),
//           Expanded(
//             child: Center(
//               child: Container(
//                 height: 100,
//                 width: 100,
//                 color: _color,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
