import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/post_model.dart';


class ChatController extends GetxController {
  var messages = <Message>[].obs;
  final TextEditingController textController = TextEditingController();

  void sendMessage() {
    if (textController.text.isNotEmpty) {
      messages.add(Message(textController.text, true));
      messages.add(Message(textController.text, false)); // Adding a mock reply
      textController.clear();
    }
  }
}
