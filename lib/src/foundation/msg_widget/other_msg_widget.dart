import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_initicon/flutter_initicon.dart';

class OtherMsgWidget extends StatelessWidget {
  final String sender;
  final String msg;

  const OtherMsgWidget({Key? key, required this.msg, required this.sender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 60,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Text(
                '$sender - 7:08 AM',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Initicon(
                      text: 'Anna Shrestha',
                      size: 32,
                      elevation: 4,
                      backgroundColor: Colors.purple,
                    ),
                  ),
                  const SizedBox(
                      width:
                          2), // Adjust the spacing between initicon and message
                  Expanded(
                    child: Card(
                      color: Colors.grey[200],
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          msg,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
