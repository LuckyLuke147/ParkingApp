import 'package:flutter/material.dart';
import 'package:parking_app/providers/reservation.dart';
import 'package:parking_app/providers/reservations.dart';
import 'package:provider/provider.dart';

class Selectable {
  final int id;
  final String label;

  Selectable(this.id, this.label);

}
class ChipWidget extends StatefulWidget {
  final List<Selectable> reportList;

  var onSelected;

  var getCurrentValue;
  ChipWidget(this.reportList, this.onSelected, this.getCurrentValue);
  @override
  _ChipWidgetState createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {
  _buildChoiceList() {
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item.label, style: TextStyle(color: Colors.black)),
          selected: widget.getCurrentValue() == item.id,
          selectedColor: Colors.orange,
          onSelected: (_) => widget.onSelected(item),
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
