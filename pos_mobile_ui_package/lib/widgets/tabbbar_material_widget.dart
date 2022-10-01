import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TabBarMaterialWidget extends StatefulWidget {
  const TabBarMaterialWidget({Key? key}) : super(key: key);

  @override
  State<TabBarMaterialWidget> createState() => _TabBarMaterialWidgetState();
}

class _TabBarMaterialWidgetState extends State<TabBarMaterialWidget> {
  @override
  Widget build(BuildContext context) {
    const placeholder = Opacity(
      opacity: 0,
      child: IconButton(onPressed: null, icon: Icon(Icons.no_cell)),
    );
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildTab(index: 0, icon: const Icon(Icons.person)),
          buildTab(index: 1, icon: const Icon(Icons.person)),
          placeholder,
          buildTab(index: 2, icon: const Icon(Icons.person)),
          buildTab(index: 3, icon: const Icon(Icons.person)),
        ],
      ),
    );
  }

  Widget buildTab({required int index, required Icon icon}) {
    return IconButton(onPressed: () {}, icon: icon);
  }
}
