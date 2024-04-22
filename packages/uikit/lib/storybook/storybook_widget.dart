import 'package:flutter/material.dart';

import 'package:uikit/uikit.dart';

part 'buttons.dart';
part 'inputs.dart';

class StorybookWidget extends StatelessWidget {
  const StorybookWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: KitColors.surfacePrimary,
      appBar: KitAppBar(),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              labelColor: KitColors.textPrimary,
              tabs: [
                Tab(text: 'Buttons'),
                Tab(text: 'Inputs'),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _ButtonsStorybook(),
                  _InputsStorybook(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
