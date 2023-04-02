import 'package:flutter/material.dart';

DropdownButtonFormField<T> dropdownButton<T>(
    {required String hintText,
    required T? value,
    required List<T> listValue,
    required List<String> listTitle,
    List<String>? listSelectedTitleBuilder,
    required BuildContext context,
    void Function(T?)? onChanged}) {
  assert(listTitle.length == listValue.length);
  final textStyle = Theme.of(context).textTheme.titleMedium?.copyWith(height: 1.6);
  return DropdownButtonFormField<T>(
      value: value,
      hint: Text(
        hintText,
        style: Theme.of(context).inputDecorationTheme.hintStyle,
      ),
      items: List.generate(
          listValue.length, (index) => _item(value: listValue[index], title: listTitle[index])),
      isExpanded: true,
      style: textStyle,
      borderRadius: BorderRadius.circular(12),
      selectedItemBuilder: listSelectedTitleBuilder == null
          ? null
          : (BuildContext context) {
              return listSelectedTitleBuilder.map<Widget>((String item) {
                return Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    item,
                    style: textStyle,
                  ),
                );
              }).toList();
            },
      onChanged: onChanged ??
          (selectedValue) {
            value = selectedValue;
          });
}

DropdownMenuItem<T> _item<T>({required T value, required String title}) {
  return DropdownMenuItem(
    child: Text(title),
    value: value,
  );
}
