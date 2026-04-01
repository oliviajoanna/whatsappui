import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../models/chat_model.dart';

class ChatRoom extends StatelessWidget {
  final ChatModel chat;

  const ChatRoom({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background krem khas WhatsApp
      backgroundColor: const Color(0xFFE5DDD5),
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              children: [
                _buildChatBubble(
                  context: context,
                  message: "Halo, mau ketemu jam berapa ya untuk presentasi hari ini? Apakah masih tetap di jam 4 sore?",
                  time: "10:47",
                  isMe: false,
                ),
                _buildChatBubble(
                  context: context,
                  message: "Diharapkan tetap hadir ya sore ke malam maks 19.00 wib.\n\nMohon bantuannya dan kerjasamanya supaya lebih berpeluang lolos.\n\n🙏 🙏 🙏",
                  time: "10:47",
                  isMe: false,
                ),
                _buildChatBubble(
                  context: context,
                  message: "Oke bisa. Untuk dresscodenya pakai apa ya? \n\nTerima kasih 🙏",
                  time: "10:47",
                  isMe: true,
                ),
                _buildChatBubble(
                  context: context,
                  message: "Pakai baju formal aja ya, biar lebih rapi dan profesional. \n\nTerima kasih 🙏",
                  time: "11:13",
                  isMe: false,
                ),
                _buildChatBubble(
                  context: context,
                  message: "Oke 😙",
                  time: "11:25",
                  isMe: true,
                ),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  // AppBar dengan foto profil dan tombol back rapat
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leadingWidth: 75,
      titleSpacing: 0,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 8),
            const Icon(Icons.arrow_back, color: Colors.black, size: 24),
            const SizedBox(width: 4),
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(chat.imageUrl),
            ),
          ],
        ),
      ),
      title: Text(
        chat.name,
        style: const TextStyle(
          color: Colors.black, 
          fontSize: 16, 
          fontWeight: FontWeight.bold
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.videocam_outlined, color: Colors.black), 
          onPressed: () {}
        ),
        IconButton(
          icon: const Icon(Icons.call_outlined, color: Colors.black), 
          onPressed: () {}
        ),
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.black), 
          onPressed: () {}
        ),
      ],
    );
  }

  // Widget Bubble Chat dengan perbaikan context
  Widget _buildChatBubble({
    required BuildContext context, 
    required String message, 
    required String time, 
    required bool isMe
  }) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        // Menggunakan context untuk mendapatkan lebar layar
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8
        ),
        decoration: BoxDecoration(
          color: isMe ? const Color(0xFFD9FDD3) : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: Radius.circular(isMe ? 12 : 0),
            bottomRight: Radius.circular(isMe ? 0 : 12),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05), 
              blurRadius: 1, 
              offset: const Offset(0, 1)
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message, 
              style: const TextStyle(fontSize: 14.5, color: Colors.black)
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  time, 
                  style: const TextStyle(fontSize: 10, color: AppColors.textGray)
                ),
                if (isMe) ...[
                  const SizedBox(width: 4),
                  const Icon(Icons.done_all, size: 16, color: Colors.blue),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Barisan input pesan di bagian bawah
  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white, 
                borderRadius: BorderRadius.circular(25)
              ),
              child: const Row(
                children: [
                  Icon(Icons.emoji_emotions_outlined, color: AppColors.textGray),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Message", 
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  Icon(Icons.attach_file, color: AppColors.textGray),
                  SizedBox(width: 12),
                  Icon(Icons.camera_alt, color: AppColors.textGray),
                  SizedBox(width: 4),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          const CircleAvatar(
            backgroundColor: AppColors.darkGreen,
            radius: 24,
            child: Icon(Icons.mic, color: Colors.white),
          ),
        ],
      ),
    );
  }
}