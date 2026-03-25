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
          fontSize: 24,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildNewCommunityTile() {
    return ListTile(
      leading: Stack(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.groups, color: Colors.white, size: 30),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.darkGreen,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 18),
            ),
          ),
        ],
      ),
      title: const Text("New community", style: TextStyle(fontWeight: FontWeight.bold)),
      onTap: () {},
    );
  }

  Widget _buildCommunityGroup(community) {
    return Column(
      children: [
        // Header Komunitas Utama
        ListTile(
          leading: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(community.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(community.name, style: const TextStyle(fontWeight: FontWeight.bold)),
          onTap: () {},
        ),
        const Divider(indent: 80, height: 1),
        // Daftar Sub-Grup di dalam Komunitas
        ...community.subGroups.map<Widget>((sub) => ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CircleAvatar(
              backgroundColor: sub.isAnnouncements ? const Color(0xFFE7FCE3) : null,
              backgroundImage: sub.isAnnouncements ? null : NetworkImage(sub.imageUrl),
              child: sub.isAnnouncements 
                  ? const Icon(Icons.campaign, color: AppColors.darkGreen) 
                  : null,
            ),
          ),
          title: Text(sub.name, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text("${sub.lastSender}: ${sub.lastMessage}", maxLines: 1, overflow: TextOverflow.ellipsis),
          trailing: Text(sub.time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        )).toList(),
        // Tombol View All
        ListTile(
          leading: const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Icon(Icons.chevron_right, color: Colors.grey),
          ),
          title: const Text("View all", style: TextStyle(color: Colors.grey)),
          onTap: () {},
        ),
        const Divider(thickness: 8, height: 8, color: Color(0xFFF6F7F9)),
      ],
    );
  }
}