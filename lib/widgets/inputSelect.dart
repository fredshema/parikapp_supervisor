import 'package:flutter/material.dart';

import 'package:getwidget/components/dropdown/gf_dropdown.dart';

class InputSelect extends StatelessWidget {
  final void Function(String?) onChanged;
  final String? value;
  final List<String>? items;

  const InputSelect(
      {Key? key,
      required this.onChanged,
      required this.value,
      required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: MediaQuery.of(context).size.width,
      child: DropdownButtonHideUnderline(
        child: GFDropdown(
          padding: const EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(5),
          border: BorderSide(color: Colors.grey.shade400, width: 1),
          dropdownButtonColor: Colors.white,
          value: value,
          onChanged: (val) {
            onChanged(val.toString());
          },
          items: items!
              .map((value) => DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
