import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../data/dummy_data.dart';
import '../../models/find_channel_model.dart'; // Pastikan path ini benar sesuai struktur folder Anda

class UpdatesScreen extends StatefulWidget {
  const UpdatesScreen({super.key});

  @override
  State<UpdatesScreen> createState() => _UpdatesScreenState();
}

class _UpdatesScreenState extends State<UpdatesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 16, 10, 8),
                child: const Text(
                  "Status",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              _buildStatusSection(),
              const SizedBox(height: 16),
              _buildChannelsSection(),
              const SizedBox(height: 24),
              _buildFindChannelsSection(), 
            ]),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.small(
            onPressed: () {},
            backgroundColor: AppColors.surfaceGray,
            elevation: 2,
            child: const Icon(Icons.edit, color: AppColors.textGray, size: 20),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.darkGreen,
            elevation: 4,
            child: const Icon(Icons.camera_alt, color: AppColors.white, size: 24),
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
        "Updates",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 20,
        ),
      ),
      actions: [
        IconButton(
          iconSize: 18,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: const Icon(Icons.search, color: Colors.black),
          onPressed: () {},
        ),
        const SizedBox(width: 15),
        IconButton(
          iconSize: 18,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: const Icon(Icons.more_vert, color: Colors.black),
          onPressed: () {},
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget _buildStatusSection() {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: DummyData.statuses.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) return _buildAddStatusCard();
          return _buildStatusCard(DummyData.statuses[index - 1]);
        },
      ),
    );
  }

  Widget _buildAddStatusCard() {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Stack(
        children: [
          const Center(
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xFFE9EDF0),
              child: Icon(Icons.person, color: Colors.white, size: 24),
            ),
          ),
          Positioned(
            bottom: 45,
            right: 32,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(color: AppColors.darkGreen, shape: BoxShape.circle),
              child: const Icon(Icons.add, color: Colors.white, size: 14),
            ),
          ),
          const Positioned(
            bottom: 8,
            left: 8,
            child: Text("Add\nstatus", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusCard(status) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(image: NetworkImage(status.imageUrl), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
              ),
            ),
          ),
          Positioned(
            top: 6,
            left: 6,
            child: CircleAvatar(
              radius: 14,
              backgroundColor: AppColors.darkGreen,
              child: CircleAvatar(radius: 12, backgroundImage: NetworkImage(status.imageUrl)),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            right: 4,
            child: Text(
              status.name,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChannelsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Channels", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceGray,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Explore",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
        ...DummyData.channels.map((channel) => ListTile(
          visualDensity: const VisualDensity(vertical: -2.5),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          horizontalTitleGap: 12,
          minLeadingWidth: 0,
          leading: CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(channel.imageUrl),
          ),
          title: Row(
            children: [
              Text(channel.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              const SizedBox(width: 4),
              const Icon(Icons.verified, color: Colors.blue, size: 14),
            ],
          ),
          subtitle: Text(
            channel.description, 
            maxLines: 1, 
            overflow: TextOverflow.ellipsis, 
            style: const TextStyle(fontSize: 13, color: AppColors.textGray)
          ),
          trailing: Text(channel.date, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        )),
      ],
    );
  }

  Widget _buildFindChannelsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Find channels to follow",
            style: TextStyle(color: AppColors.textGray, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
        const SizedBox(height: 8),
        // MENGAMBIL DATA DARI DummyData.suggestedChannels SESUAI MODEL BARU ANDA
        ...DummyData.suggestedChannels.map((channel) => _buildFollowChannelTile(channel)),
        
        const SizedBox(height: 24),
        _buildBottomButton("Explore more", Icons.grid_view_rounded),
        const SizedBox(height: 12),
        _buildBottomButton("Create channel", Icons.add),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildFollowChannelTile(FindChannelModel channel) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: -2),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      horizontalTitleGap: 12,
      minLeadingWidth: 0,
      leading: CircleAvatar(
        radius: 22, 
        backgroundColor: AppColors.surfaceGray, 
        backgroundImage: NetworkImage(channel.imageUrl),
      ),
      title: Row(
        children: [
          Text(channel.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          if (channel.isVerified) ...[
            const SizedBox(width: 4),
            const Icon(Icons.verified, color: Colors.blue, size: 14),
          ],
        ],
      ),
      subtitle: Text(
        "${channel.followers} followers", 
        style: const TextStyle(fontSize: 13, color: AppColors.textGray)
      ),
      trailing: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE7FCE3),
          foregroundColor: AppColors.darkGreen,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: const Text("Follow", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
      ),
    );
  }

  Widget _buildBottomButton(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(double.infinity, 45),
          side: BorderSide(color: Colors.grey.shade300),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.darkGreen, size: 18),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(color: AppColors.darkGreen, fontWeight: FontWeight.bold, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}