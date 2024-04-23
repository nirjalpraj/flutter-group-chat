import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';

class OwnMsgWidget extends StatefulWidget {
  final String sender;
  final String msg;
  const OwnMsgWidget({Key? key, required this.msg, required this.sender})
      : super(key: key);

  @override
  _OwnMsgWidgetState createState() => _OwnMsgWidgetState();
}

class _OwnMsgWidgetState extends State<OwnMsgWidget> {
  String? _lastSender;

  @override
  Widget build(BuildContext context) {
    final isFirstMessageFromSender = widget.sender != _lastSender;
    print(isFirstMessageFromSender);

    _lastSender = widget.sender;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width - 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Adjust the spacing between initicon and message
                Padding(
                  padding: isFirstMessageFromSender
                      ? EdgeInsets.zero
                      : const EdgeInsets.symmetric(horizontal: 32, vertical: 0),
                  child: Flexible(
                    child: Card(
                      elevation: 0,
                      color: Colors.blue[400],
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          widget.msg,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
