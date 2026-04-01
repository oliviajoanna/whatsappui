import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../data/dummy_data.dart';
import '../../models/chat_model.dart';
import 'chat_room_screen.dart';
import '../camera/camera_screen.dart';

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
              //const Divider(height: 1, indent: 0, color: AppColors.surfaceGray), // Indent 65 agar garis mulai setelah avatar
              // Mapping data from DummyData class
              ...DummyData.chats.map((chat) => _buildChatTile(chat)),
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
          fontSize: 20,
        ),
      ),
      actions: [
        IconButton(
          iconSize: 18,
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.camera_alt_outlined, color: Colors.black), 
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Camera()),
          );
          }
        ),
        IconButton(
          iconSize: 18,
          icon: const Icon(Icons.more_vert, color: Colors.black), 
          onPressed: () {}
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          //META AI SEARCH
          child: SizedBox(
            height: 35,
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Ask Meta AI or Search",
                hintStyle: const TextStyle(
                  color: AppColors.textGray, 
                  fontWeight: FontWeight.normal,
                  fontSize: 14
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
     padding: const EdgeInsets.only(
        top: 14,      // Bagian atas diubah menjadi 15 sesuai permintaan
        bottom: 6,    // Bagian bawah tetap 6 (diambil dari vertical: 6 sebelumnya)
        left: 10,     // Kiri tetap 10 (diambil dari horizontal: 10)
        right: 10,    // Kanan tetap 10 (diambil dari horizontal: 10)
      ),
      child: Row(
        children: [
          ...filters.map((f) => Padding(
            padding: const EdgeInsets.only(right: 4),
            child: ChoiceChip(
              // 1. Shrinks the interactive area to the size of the chip
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, 
              // 2. Further reduces the vertical density
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              // 3. Reduces internal space around the text
              labelPadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
              label: Text(f),
              selected: f == "All",
              onSelected: (val) {},
              selectedColor: const Color(0xFFD8FDD2),
              backgroundColor: AppColors.surfaceGray,

              labelStyle: TextStyle(
                color: f == "All" ? AppColors.tealGreen : AppColors.textGray,
                fontWeight: f == "All" ? FontWeight.bold : FontWeight.normal,
                fontSize: 12,
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
    // 1. Menyamakan kepadatan vertikal agar gap hilang
    visualDensity: VisualDensity(vertical: -2), 
    // 2. Menyamakan padding horizontal dengan chat tile (10)
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    // 3. Menyamakan gap antara icon dan teks (12)
    horizontalTitleGap: 12,
    // 4. Menghilangkan lebar minimum default agar alignment sejajar
    minLeadingWidth: 0,
    leading: Padding(
      // Padding kiri disesuaikan agar icon archive berada di tengah kolom avatar
      padding: EdgeInsets.only(left: 6.0, right: 6.0), 
      child: Icon(Icons.archive_outlined, color: AppColors.textGray, size: 22),
    ),
    title: Text(
      "Archived", 
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textGray),
    ),
    trailing: Text(
      "12", 
      style: TextStyle(
        color: AppColors.textGray, 
        fontSize: 11, 
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

  Widget _buildChatTile(ChatModel chat) {
    return ListTile(
      // Properti navigasi yang ditambahkan
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatRoom(chat: chat), // Mengirim data chat ke room
          ),
        );
      },
      visualDensity: const VisualDensity(vertical: -2.5),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      horizontalTitleGap: 12,   
      minLeadingWidth: 0,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(chat.imageUrl),
        radius: 18,
      ),
      title: Text(chat.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      subtitle: Text(
        chat.lastMessage, 
        maxLines: 1, 
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: AppColors.textGray, fontSize: 13), 
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            chat.time,
            style: TextStyle(
              color: chat.unreadCount > 0 ? AppColors.darkGreen : AppColors.textGray,
              fontSize: 10,
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
                  fontSize: 8, 
                  fontWeight: FontWeight.bold
                ),
              ),
            )
          else if (chat.isPinned)
            const Icon(Icons.push_pin, size: 12, color: AppColors.textGray),
        ],
      ),
    );
  }
}