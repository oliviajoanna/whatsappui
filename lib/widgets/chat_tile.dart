import 'package:flutter/material.dart';
import '../models/chat_model.dart';

class ChatTile extends StatelessWidget {
  final ChatModel chat;

  const ChatTile({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(chat.imageUrl),
      ),
      title: Text(
        chat.name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(chat.lastMessage),
      trailing: Text(
        chat.time,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}