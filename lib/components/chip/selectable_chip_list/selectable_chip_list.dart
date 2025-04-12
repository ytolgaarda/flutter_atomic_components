// Bu widget, kullanıcıya istediği zaman tekli veya çoklu seçim yapma imkanı sağlar.
import 'package:flutter/material.dart';

class SelectableChipList<T> extends StatefulWidget {
  // Model nesnelerinin listesi
  final List<T> items;
  // Her bir model nesnesinden gösterilecek özelliği döndüren fonksiyon
  final String Function(T item) displayProperty;
  // Arama sorgusu, chip listesini filtrelemek için kullanılır
  final String? searchQuery;
  // Chip seçildiğinde tetiklenen fonksiyon (parent UI veya widget için)
  final ValueChanged<Set<T>> onSelected;
  // Chip'in seçili olup olmadığını gösterecek kontrol işareti
  final bool? showCheckmark;
  // Seçilen chip için avatar widget'ı
  final Widget? avatar;
  // Seçilmeyen chip için avatar widget'ı
  final Widget? unSelectedAvatar;
  // Chip şekli
  final OutlinedBorder? shape;
  // Seçilmeyen chip'in rengi
  final Color? unSelectedColor;
  // Seçilen chip'in rengi
  final Color? selectedColor;
  // Chip'in yazı stili
  final TextStyle? textStyle;
  // Çoklu seçim olup olmadığını belirten parametre
  final bool isMultipleSelection;

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
    this.isMultipleSelection = true, // Varsayılan olarak çoklu seçim
  });

  @override
  State<SelectableChipList<T>> createState() => _SelectableChipListState<T>();
}

class _SelectableChipListState<T> extends State<SelectableChipList<T>> {
  // Seçilen öğeleri tutan bir Set
  Set<T> _selectedItems = {};

  // Arama sorgusuna göre öğe listesini filtreler
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
        final isSelected = _selectedItems.contains(item);
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
              if (widget.isMultipleSelection) {
                // Çoklu seçim modunda, item'ı ekler ya da çıkarırız
                if (selected) {
                  _selectedItems.add(item);
                } else {
                  _selectedItems.remove(item);
                }
              } else {
                // Tekli seçim modunda, sadece bir öğe seçilebilir
                if (selected) {
                  _selectedItems = {item};
                } else {
                  _selectedItems.clear();
                }
              }
            });
            // Seçilen öğeleri parent widget'a göndeririz
            widget.onSelected(_selectedItems);
          },
        );
      }).toList(),
    );
  }
}
