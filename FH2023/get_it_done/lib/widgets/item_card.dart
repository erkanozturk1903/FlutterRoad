import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final bool isDone;
  final Function(bool?) toggleStatus;
  final Function() deleteItem;

  const ItemCard({
    super.key,
    required this.title,
    required this.isDone,
    required this.toggleStatus,
    required this.deleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (_) => deleteItem(),
      key: Key(title),
      child: Card(
          color: isDone ? Colors.green[100] : Colors.white,
          elevation: isDone ? 1 : 5,
          shadowColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                decoration: isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: Checkbox(
              value: isDone,
              onChanged: toggleStatus,
            ),
          )),
    );
  }
}
