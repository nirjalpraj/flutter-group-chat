import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';

class OtherMsgWidget extends StatefulWidget {
  final String sender;
  final String msg;

  const OtherMsgWidget({Key? key, required this.msg, required this.sender})
      : super(key: key);

  @override
  _OtherMsgWidgetState createState() => _OtherMsgWidgetState();
}

class _OtherMsgWidgetState extends State<OtherMsgWidget> {
  String? _lastSender;

  @override
  Widget build(BuildContext context) {
    final isFirstMessageFromSender = widget.sender != _lastSender;

    _lastSender = widget.sender;

    return Align(
      alignment: Alignment.bottomLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 60,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 0),
            //   child: Text(
            //     widget.sender,
            //     style: TextStyle(
            //       fontSize: 12,
            //       color: Colors.grey[500],
            //     ),
            //     overflow: TextOverflow.ellipsis,
            //   ),
            // ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isFirstMessageFromSender)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Initicon(
                        text: widget.sender,
                        size: 32,
                        elevation: 4,
                        backgroundColor: Colors.purple,
                      ),
                    ),
                  // if (isFirstMessageFromSender)
                  const SizedBox(
                    width: 2,
                  ), // Adjust the spacing between initicon and message
                  Padding(
                    padding: isFirstMessageFromSender
                        ? EdgeInsets.zero
                        : const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 0),
                    child: Flexible(
                      child: Card(
                        elevation: 0,
                        color: Colors.grey[200],
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            widget.msg,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
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
