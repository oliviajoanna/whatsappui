import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../data/dummy_data.dart';
import '../../models/chat_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // Controller to handle the text input for the stateful search bar
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildFilterChips(),
              _buildArchivedTile(),
              // Mapping data from your DummyData class
              ...DummyData.chats.map((chat) => _buildChatTile(chat)).toList(),
            ]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.darkGreen,
        child: const Icon(Icons.add_comment, color: AppColors.white),
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      floating: false,
      pinned: true,
      title: const Text(
        "WhatsApp",
        style: TextStyle(
          color: AppColors.darkGreen,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.camera_alt_outlined, color: Colors.black), 
          onPressed: () {}
        ),
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.black), 
          onPressed: () {}
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SizedBox(
            height: 45,
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Ask Meta AI or Search",
                hintStyle: const TextStyle(
                  color: AppColors.textGray, 
                  fontWeight: FontWeight.normal
                ),
                prefixIcon: const Icon(Icons.search, color: AppColors.textGray),
                filled: true,
                fillColor: AppColors.surfaceGray,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    final filters = ["All", "Unread", "Favorites", "Groups"];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          ...filters.map((f) => Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(f),
              selected: f == "All",
              onSelected: (val) {},
              selectedColor: const Color(0xFFD8FDD2),
              backgroundColor: AppColors.surfaceGray,
              labelStyle: TextStyle(
                color: f == "All" ? AppColors.tealGreen : AppColors.textGray,
                fontWeight: f == "All" ? FontWeight.bold : FontWeight.normal,
              ),
              side: BorderSide.none,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          )),
          const Icon(Icons.add, color: AppColors.textGray),
        ],
      ),
    );
  }

  Widget _buildArchivedTile() {
    return const ListTile(
      leading: Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: Icon(Icons.archive_outlined, color: AppColors.tealGreen),
      ),
      title: Text("Archived", style: TextStyle(fontWeight: FontWeight.bold)),
      trailing: Text(
        "12", 
        style: TextStyle(
          color: AppColors.darkGreen, 
          fontSize: 12, 
          fontWeight: FontWeight.bold
        )
      ),
    );
  }

  Widget _buildChatTile(ChatModel chat) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(chat.imageUrl),
        radius: 25,
      ),
      title: Text(chat.name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(
        chat.lastMessage, 
        maxLines: 1, 
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: AppColors.textGray),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            chat.time,
            style: TextStyle(
              color: chat.unreadCount > 0 ? AppColors.darkGreen : AppColors.textGray,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 5),
          if (chat.unreadCount > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
              decoration: const BoxDecoration(
                color: AppColors.darkGreen, 
                shape: BoxShape.circle
              ),
              child: Text(
                '${chat.unreadCount}',
                style: const TextStyle(
                  color: AppColors.white, 
                  fontSize: 10, 
                  fontWeight: FontWeight.bold
                ),
              ),
            )
          else if (chat.isPinned)
            const Icon(Icons.push_pin, size: 16, color: AppColors.textGray),
        ],
      ),
    );
  }
}