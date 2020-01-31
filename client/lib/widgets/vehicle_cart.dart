import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/users.dart';

class VehicleCart extends StatefulWidget {
  String id;
  String carBrand;
  String carModel;
  String carRegistrationNo;

  VehicleCart(
    this.id,
    this.carBrand,
    this.carModel,
    this.carRegistrationNo,
  );

  @override
  _VehicleCartState createState() => _VehicleCartState();
}

class _VehicleCartState extends State<VehicleCart> {
  @override
  void didChangeDependencies() {
    Provider.of<Users>(context).findById(1);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Delete Alert',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.92,
                      )),
                  content: Text(
                    'Are you sure you want to delete this car?',
                    style: TextStyle(
                      letterSpacing: 0.92,
                    ),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text(
                        'No',
                        style: TextStyle(
                          letterSpacing: 0.92,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(ctx).pop(false);
                      },
                    ),
                    Container(
                      height: 30,
                      child: VerticalDivider(),
                    ),
                    FlatButton(
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          letterSpacing: 0.92,
                          color: Colors.red,
                        ),
                      ),
                      onPressed: () async {
                        Navigator.of(ctx).pop(true);
                        try {
                          await Provider.of<Users>(context)
                              .deleteVehicle(int.parse(widget.id));
                        } catch (error) {}
                      },
                    ),
                  ],
                ));
      },
      onDismissed: (direction) {},
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: FittedBox(
                child: Icon(
                  Icons.directions_car,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
          title: Text(
            widget.carBrand + ' ' + widget.carModel,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 0.92,
            ),
          ),
          subtitle: Text(
            widget.carRegistrationNo,
            style: TextStyle(
              letterSpacing: 0.92,
            ),
          ),
        ),
      ),
    );
  }
}
