import 'package:flutter/material.dart';

class ChipWidget extends StatefulWidget {
  final List<String> reportList;
  ChipWidget(this.reportList);
  @override
  _ChipWidgetState createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {
  String selectedChoice = '';
  _buildChoiceList() {
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item, style: TextStyle(color: Colors.black)),
          selected: selectedChoice == item,
          selectedColor: Colors.orange,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
              print(item);
            });
          },
          backgroundColor: Colors.grey[300],
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
