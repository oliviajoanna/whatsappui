import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../data/dummy_data.dart';

class CommunitiesScreen extends StatefulWidget {
  const CommunitiesScreen({super.key});

  @override
  State<CommunitiesScreen> createState() => _CommunitiesScreenState();
}

class _CommunitiesScreenState extends State<CommunitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildNewCommunityTile(),
              const Divider(thickness: 8, height: 8, color: Color(0xFFF6F7F9)),
              // Mengambil data komunitas dari dummy_data
              ...DummyData.communities.map((community) => _buildCommunityGroup(community)).toList(),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      floating: false,
      pinned: true,
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      title: const Text(
        "Communities",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 20, // Konsisten dengan Updates & Chat
        ),
      ),
      actions: [
        IconButton(
          iconSize: 18, // Konsisten kecil
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: const Icon(Icons.more_vert, color: Colors.black),
          onPressed: () {},
        ),
        const SizedBox(width: 15),
      ],
    );
  }

  Widget _buildNewCommunityTile() {
    return ListTile(
      visualDensity: const VisualDensity(vertical: -1),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      horizontalTitleGap: 12,
      minLeadingWidth: 0,
      leading: Stack(
        children: [
          Container(
            height: 40, // Disesuaikan agar proporsional dengan avatar 18 radius
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.groups, color: Colors.white, size: 24),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.darkGreen,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 14),
            ),
          ),
        ],
      ),
      title: const Text(
        "New community", 
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)
      ),
      onTap: () {},
    );
  }

  Widget _buildCommunityGroup(community) {
    return Column(
      children: [
        // Header Komunitas Utama
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          horizontalTitleGap: 12,
          minLeadingWidth: 0,
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(community.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            community.name, 
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)
          ),
          onTap: () {},
        ),
        const Divider(indent: 0, height: 1), // Indent disesuaikan dengan lebar avatar + gap

        // Daftar Sub-Grup
        ...community.subGroups.map<Widget>((sub) => ListTile(
          visualDensity: const VisualDensity(vertical: -2.5), // Rapat seperti chat
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          horizontalTitleGap: 12,
          minLeadingWidth: 0,
          leading: CircleAvatar(
            radius: 18, // Konsisten dengan ChatScreen
            backgroundColor: sub.isAnnouncements ? const Color(0xFFE7FCE3) : null,
            backgroundImage: sub.isAnnouncements ? null : NetworkImage(sub.imageUrl),
            child: sub.isAnnouncements 
                ? const Icon(Icons.campaign, color: AppColors.darkGreen, size: 20) 
                : null,
          ),
          title: Text(
            sub.name, 
            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14)
          ),
          subtitle: Text(
            "${sub.lastSender}: ${sub.lastMessage}", 
            maxLines: 1, 
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 13, color: AppColors.textGray), // Size 13 sesuai catatan
          ),
          trailing: Text(
            sub.time, 
            style: const TextStyle(fontSize: 10, color: Colors.grey)
          ),
        )).toList(),

        // Tombol View All
        ListTile(
          visualDensity: const VisualDensity(vertical: -3),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          horizontalTitleGap: 12,
          minLeadingWidth: 0,
          leading: const SizedBox(
            width: 40,
            child: Icon(Icons.chevron_right, color: Colors.grey, size: 20),
          ),
          title: const Text(
            "View all", 
            style: TextStyle(color: Colors.grey, fontSize: 13)
          ),
          onTap: () {},
        ),
        const Divider(thickness: 8, height: 8, color: Color(0xFFF6F7F9)),
      ],
    );
  }
}