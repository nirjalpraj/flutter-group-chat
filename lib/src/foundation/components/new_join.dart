import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';

class NewJoin extends StatelessWidget {
  const NewJoin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Icon(
                Icons.arrow_forward,
                color: Colors.green,
              ),
              SizedBox(width: 10),
              Initicon(
                text: "Full Name",
                elevation: 4,
                backgroundColor: Colors.purple,
                // color: Colors.purple,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                child: Text(
                  'Anna Shrestha',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text('joined the group.')
            ],
          ),
        ));
  }
}
