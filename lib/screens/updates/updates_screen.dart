import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../data/dummy_data.dart';

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
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Status",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              _buildStatusSection(), // Horizontal scrollable status
              const SizedBox(height: 16),
              _buildChannelsSection(), // Vertical channels list
            ]),
          ),
        ],
      ),
      // Floating Action Button ganda (Kamera & Edit) seperti di gambar
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.small(
            onPressed: () {},
            backgroundColor: AppColors.surfaceGray,
            elevation: 2,
            child: const Icon(Icons.edit, color: AppColors.darkGreen),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.darkGreen,
            elevation: 4,
            child: const Icon(Icons.camera_alt, color: AppColors.white),
          ),
        ],
      ),
    );
  }

  // Navbar Updates
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
          fontSize: 24,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.black),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  // Horizontal Scrollable Status Section
  Widget _buildStatusSection() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: DummyData.statuses.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildAddStatusCard();
          }
          final status = DummyData.statuses[index - 1];
          return _buildStatusCard(status);
        },
      ),
    );
  }

  Widget _buildAddStatusCard() {
    return Container(
      width: 110,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Stack(
        children: [
          const Center(
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Color(0xFFE9EDF0),
              child: Icon(Icons.person, color: Colors.white, size: 30),
            ),
          ),
          Positioned(
            top: 60,
            left: 65,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: AppColors.darkGreen,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 18),
            ),
          ),
          const Positioned(
            bottom: 12,
            left: 12,
            child: Text(
              "Add\nstatus",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusCard(status) {
    return Container(
      width: 110,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(status.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Overlay gelap tipis agar teks putih terlihat
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.4)],
              ),
            ),
          ),
          // Ring Foto Profil (Hijau jika belum dilihat)
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.darkGreen, width: 2),
              ),
              child: CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(status.imageUrl),
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            right: 8,
            child: Text(
              status.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  // Channels Section
Widget _buildChannelsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Channels",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Row(
                  children: [
                    Text("Explore", style: TextStyle(color: AppColors.darkGreen, fontWeight: FontWeight.bold)),
                    Icon(Icons.chevron_right, color: AppColors.darkGreen, size: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
        
        // Daftar Channel yang sudah di-follow (mengambil dari DummyData)
        ...DummyData.channels.map((channel) => ListTile(
              leading: CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(channel.imageUrl),
              ),
              title: Text(channel.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(channel.description, maxLines: 1, overflow: TextOverflow.ellipsis),
              trailing: Text(channel.date, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            )),
            
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Find channels to follow",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
        
        // Contoh Find Channels menggunakan helper widget
        ...List.generate(3, (index) => _buildFollowChannelTile(index)),

        const SizedBox(height: 24),

        // Tombol Explore More
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
              side: BorderSide(color: Colors.grey.shade300),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.grid_view_rounded, color: AppColors.darkGreen, size: 20),
                SizedBox(width: 8),
                Text("Explore more", style: TextStyle(color: AppColors.darkGreen, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Tombol Create Channel
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
              side: BorderSide(color: Colors.grey.shade300),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, color: AppColors.darkGreen, size: 20),
                SizedBox(width: 8),
                Text("Create channel", style: TextStyle(color: AppColors.darkGreen, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        
        const SizedBox(height: 80), // Jarak ekstra agar tidak tertutup tombol FAB (Kamera)
      ],
    );
  }

  // Helper widget untuk daftar channel yang bisa di-follow
  Widget _buildFollowChannelTile(int index) {
    List<String> names = ["Ust Abdul Somad", "Ust Adi Hidayat", "RESEP DAPUR RUMA...", "FC Barcelona", "Manchester United"];
    return ListTile(
      leading: const CircleAvatar(radius: 24, backgroundColor: Colors.grey),
      title: Text(names[index % names.length], style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: const Text("1.2M followers"),
      trailing: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xFFE7FCE3),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: const Text("Follow", style: TextStyle(color: AppColors.darkGreen, fontWeight: FontWeight.bold)),
      ),
    );
  }
  }