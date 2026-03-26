import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../data/dummy_data.dart';
import '../../models/calls_model.dart';

class CallsScreen extends StatefulWidget {
  const CallsScreen({super.key});

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverToBoxAdapter(child: _buildCallActions()),
          SliverToBoxAdapter(
            child: Padding(
              // Horizontal 10 agar sejajar dengan alignment chat/updates
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
              child: const Text(
                "Recent", 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildCallTile(DummyData.calls[index]),
              childCount: DummyData.calls.length,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)), // Spasi bawah agar tidak tertutup FAB
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.darkGreen,
        child: const Icon(Icons.add_call, color: AppColors.white),
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
        "Calls", 
        style: TextStyle(
          color: Colors.black, 
          fontSize: 20, // Konsisten dengan tab lain
          fontWeight: FontWeight.normal
        )
      ),
      actions: [
        IconButton(
          iconSize: 18,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: const Icon(Icons.search, color: Colors.black), 
          onPressed: () {}
        ),
        const SizedBox(width: 15),
        IconButton(
          iconSize: 18,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: const Icon(Icons.more_vert, color: Colors.black), 
          onPressed: () {}
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget _buildCallActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _actionItem(Icons.call_outlined, "Call"),
          _actionItem(Icons.calendar_month_outlined, "Schedule"),
          _actionItem(Icons.dialpad_outlined, "Keypad"),
          _actionItem(Icons.favorite_border, "Favorites"),
        ],
      ),
    );
  }

  Widget _actionItem(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 26, // Dikecilkan sedikit agar lebih proporsional
          backgroundColor: AppColors.surfaceGray,
          child: Icon(icon, color: Colors.black, size: 22),
        ),
        const SizedBox(height: 8),
        Text(
          label, 
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal)
        ),
      ],
    );
  }

  Widget _buildCallTile(CallModel call) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: -2.5), // Konsisten rapat
      contentPadding: const EdgeInsets.symmetric(horizontal: 10), // Konsisten 10
      horizontalTitleGap: 12, // Konsisten sejajar
      minLeadingWidth: 0,
      leading: CircleAvatar(
        radius: 18, // Konsisten dengan ChatScreen (Diameter 36)
        backgroundColor: Colors.purple.shade50,
        backgroundImage: call.imageUrl.isNotEmpty ? NetworkImage(call.imageUrl) : null,
        child: call.imageUrl.isEmpty 
            ? Text(call.name[0], style: const TextStyle(color: Colors.deepPurple, fontSize: 14)) 
            : null,
      ),
      title: Text(
        call.name, 
        style: TextStyle(
          fontWeight: FontWeight.bold, 
          fontSize: 14,
          color: call.isMissed ? Colors.red : Colors.black,
        )
      ),
      subtitle: Row(
        children: [
          Icon(
            call.isIncoming ? Icons.call_received : Icons.call_made,
            size: 14,
            color: call.isMissed ? Colors.red : AppColors.darkGreen,
          ),
          const SizedBox(width: 4),
          Text(
            call.time,
            style: const TextStyle(fontSize: 13, color: AppColors.textGray), // Size 13 sesuai catatan
          ),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          call.isVideo ? Icons.videocam_outlined : Icons.call_outlined, 
          color: Colors.black, // Hijau khas WhatsApp untuk ikon telepon
          size: 22,
        ),
        onPressed: () {},
      ),
    );
  }
}