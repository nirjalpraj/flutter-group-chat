import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/foundation/components/chat_welcome.dart';
import 'package:flutter_application_1/src/foundation/components/date_display.dart';
import 'package:flutter_application_1/src/foundation/components/new_join.dart';
import 'package:flutter_application_1/src/foundation/msg_widget/other_msg_widget.dart';
import 'package:flutter_application_1/src/foundation/msg_widget/own_msg_widget.dart';
import 'package:flutter_application_1/src/pages/group/msg_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;

class GroupPage extends StatefulWidget {
  final String name;
  final String userId;
  final String groupId = '2222';
  const GroupPage({Key? key, required this.name, required this.userId})
      : super(key: key);

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  IO.Socket? socket;
  List<MsgModel> listMsg = [];
  TextEditingController _msgController = TextEditingController();
  @override
  void initState() {
    super.initState();
    print('connected to frontenddddd');

    connect();
  }

  void connect() {
    socket = IO.io("http://localhost:3000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket!.connect();
    socket!.onConnect((_) {
      print('connected to frontend');

      socket!.emit('join', '222211');

      socket!.on("sendMsgServer", (msg) {
        print(msg);

        if (msg["userId"] != widget.userId) {
          setState(() {
            listMsg.add(MsgModel(
                msg: msg["msg"], type: msg["type"], sender: msg["senderName"]));
          });
        }
      });
    });
  }

  bool _showEmoji = false;

  void sendMsg(String msg, String senderName) {
    MsgModel ownMsg = MsgModel(msg: msg, type: "ownMsg", sender: senderName);
    listMsg.add(ownMsg);
    setState(() {
      listMsg;
    });
    socket!.emit('sendMsg', {
      "type": "ownMsg",
      "msg": msg,
      "senderName": senderName,
      "groupId": '222222',
      "userId": widget.userId
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Group Project One",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.orange[400],
          ),
          body: Column(
            children: [
              // NewJoin(),
              // Welcome_Group_Chat(),
              // Date_Display(),
              Expanded(
                  child: ListView.builder(
                      itemCount: listMsg.length,
                      itemBuilder: (context, index) {
                        if (listMsg[index].type == "ownMsg") {
                          return OtherMsgWidget(
                              msg: listMsg[index].msg,
                              sender: listMsg[index].sender);
                        } else {
                          return OtherMsgWidget(
                              msg: listMsg[index].msg,
                              sender: listMsg[index].sender);
                        }
                      })),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 45,
                        child: TextFormField(
                          controller: _msgController,
                          onTap: () => {
                            setState(() {
                              if (_showEmoji) {
                                _showEmoji = !_showEmoji;
                              }
                            })
                          },
                          decoration: InputDecoration(
                              hintText: "Type a message",
                              hintStyle:
                                  TextStyle(fontWeight: FontWeight.normal),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 10),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade100, width: 2)),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _showEmoji = !_showEmoji;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.emoji_emotions_outlined,
                                    // color: Colors.orange,
                                  ))),
                        ),
                      )),
                      IconButton(
                          onPressed: () {
                            String msg = _msgController.text;
                            if (msg.isNotEmpty) {
                              sendMsg(_msgController.text, widget.name);
                            }
                            _msgController.clear();
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.orange,
                          )),
                    ],
                  )),
              if (_showEmoji)
                SingleChildScrollView(
                  child: SizedBox(
                    // height: 20,
                    child: EmojiPicker(
                        textEditingController: _msgController,
                        config: Config(
                          emojiViewConfig: EmojiViewConfig(
                            emojiSizeMax: 28 *
                                (foundation.defaultTargetPlatform ==
                                        TargetPlatform.iOS
                                    ? 1.20
                                    : 1.0),
                          ),
                          height: 256,
                        )),
                  ),
                )
            ],
          )),
    );
  }
}
