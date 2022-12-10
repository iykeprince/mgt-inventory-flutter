import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../pos_mobile_ui_package.dart';
import '../utils/colors.dart';

class MultiselectDropdown extends StatefulWidget {
  const MultiselectDropdown({
    Key? key,
    required this.hintText,
    required this.items,
    required this.onSelectItem,
  }) : super(key: key);
  final String hintText;
  final List<String> items;
  final Function(List<String> selectedItems) onSelectItem;

  @override
  State<MultiselectDropdown> createState() => _MultiselectDropdownState();
}

class _MultiselectDropdownState extends State<MultiselectDropdown> {
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Align(
          alignment: AlignmentDirectional.center,
          child: Text(
            widget.hintText,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
        items: widget.items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            //disable default onTap to avoid closing menu when selecting an item
            enabled: false,
            child: StatefulBuilder(
              builder: (context, menuSetState) {
                final _isSelected = selectedItems.contains(item);
                return InkWell(
                  onTap: () {
                    _isSelected
                        ? selectedItems.remove(item)
                        : selectedItems.add(item);
                    //This rebuilds the StatefulWidget to update the button's text
                    setState(() {});
                    //This rebuilds the dropdownMenu Widget to update the check mark
                    menuSetState(() {});
                    // update the function
                    widget.onSelectItem(selectedItems);
                  },
                  child: Container(
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        _isSelected
                            ? const Icon(Icons.check_box_outlined)
                            : const Icon(Icons.check_box_outline_blank),
                        const SizedBox(width: 16),
                        Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
        //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
        value: selectedItems.isEmpty ? null : selectedItems.last,
        onChanged: (value) {},
        buttonHeight: 40,
        buttonWidth: double.infinity,
        itemHeight: 40,
        itemPadding: EdgeInsets.zero,
        selectedItemBuilder: (context) {
          return widget.items.map(
            (item) {
              return Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  selectedItems.join(', '),
                  style: const TextStyle(
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              );
            },
          ).toList();
        },
        buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s8),
            border: Border.all(
              color: ColorManager.kTransparent,
            ),
            color: ColorManager.kBackgroundolor),
      ),
    );
  }
}
