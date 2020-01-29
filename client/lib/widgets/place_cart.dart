import 'package:flutter/material.dart';

import '../screens/overview_admin_disable_place_screen.dart';

class PlaceCart extends StatelessWidget {
  String id;
  int place_no;

  PlaceCart(
    this.id,
    this.place_no,
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
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
            title: Text(
              'Delete Alert',
              style: TextStyle(
                letterSpacing: 0.92,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              'Are you sure you want to delete this place?',
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
                child: VerticalDivider(
                ),
              ),
              FlatButton(
                child: Text(
                  'Yes',
                  style: TextStyle(
                    letterSpacing: 0.92,
                    color: Colors.red,
                  ),
                ),
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        //Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: ListTile(
          trailing: CircleAvatar(
            backgroundColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: FittedBox(
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.green,
                  size: 30,
                ),
              ),
            ),
          ),
          title: Text(
            'No. ' + place_no.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 0.92,
            ),
          ),
          onTap: () {
              Navigator.of(context)
                        .pushNamed(DisablePlaceScreen.routeName);
          },
        ),
      ),
    );
  }
}
