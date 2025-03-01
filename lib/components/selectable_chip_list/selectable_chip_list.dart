import 'package:flutter/material.dart';

// This widget allows that user can generate a choice chip list of T type.
class SelectableChipList<T> extends StatefulWidget {
  // List of model objects to work with.
  final List<T> items;
  // A function that returns the property to be displayed on the chip from each model object
  final String Function(T item) displayProperty;
  // Search query used to filter the chip list.
  final String? searchQuery;
  // Reverse function triggered when a chip is selected or deselected (for parent ui or widget)
  final ValueChanged<T?> onSelected;
  // Determines whether the selection checkmark will be displayed on the chip.
  final bool? showCheckmark;
  // Avatar widget for selected chip
  final Widget? avatar;
  // Avatar widget for unselected chip
  final Widget? unSelectedAvatar;
  // Chip's shape
  final OutlinedBorder? shape;
  // Unselected chip color
  final Color? unSelectedColor;
  // Selected chip color
  final Color? selectedColor;
  // Textstyle that determines style on chip.
  final TextStyle? textStyle;

  const SelectableChipList({
    super.key,
    required this.items,
    required this.displayProperty,
    this.searchQuery,
    required this.onSelected,
    this.showCheckmark = false,
    this.avatar,
    this.unSelectedAvatar,
    this.shape,
    this.unSelectedColor,
    this.selectedColor,
    this.textStyle,
  });

  @override
  State<SelectableChipList<T>> createState() => _SelectableChipListState<T>();
}

class _SelectableChipListState<T> extends State<SelectableChipList<T>> {
  // Selected item can be null
  T? _selectedItem;

  // Filters item list based on search query
  List<T> _filterItems(List<T> items) {
    if (widget.searchQuery == null || widget.searchQuery!.isEmpty) {
      return items;
    }

    final query = widget.searchQuery!.toLowerCase();
    return items.where((item) {
      final displayValue = widget.displayProperty(item).toLowerCase();
      return displayValue.contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = _filterItems(widget.items);

    return Wrap(
      spacing: 8.0,
      children: filteredItems.map((item) {
        final isSelected = item == _selectedItem;
        return ChoiceChip(
          color: WidgetStatePropertyAll<Color>(
              (isSelected ? widget.selectedColor : widget.unSelectedColor) ??
                  Colors.transparent),
          shape: widget.shape,
          avatar: isSelected ? widget.avatar : widget.unSelectedAvatar,
          showCheckmark: widget.showCheckmark,
          label: Text(widget.displayProperty(item), style: widget.textStyle),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              // update selected item
              _selectedItem = selected ? item : null;
            });
            // return selected item to parent
            widget.onSelected(_selectedItem);
          },
        );
      }).toList(),
    );
  }
}
