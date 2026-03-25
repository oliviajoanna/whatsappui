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
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Text("Recent", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildCallTile(DummyData.calls[index]),
              childCount: DummyData.calls.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.darkGreen,
        child: const Icon(Icons.add_call, color: AppColors.white),
      ),
    );
  }

  Widget _buildCallActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
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
          radius: 28,
          backgroundColor: AppColors.surfaceGray,
          child: Icon(icon, color: Colors.black),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 13)),
      ],
    );
  }

  Widget _buildCallTile(CallModel call) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.purple.shade50,
        backgroundImage: call.imageUrl.isNotEmpty ? NetworkImage(call.imageUrl) : null,
        child: call.imageUrl.isEmpty 
            ? Text(call.name[0], style: const TextStyle(color: Colors.deepPurple)) 
            : null,
      ),
      title: Text(call.name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Row(
        children: [
          Icon(
            call.isIncoming ? Icons.call_received : Icons.call_made,
            size: 16,
            color: call.isMissed ? Colors.red : AppColors.darkGreen,
          ),
          const SizedBox(width: 4),
          Text(call.time),
        ],
      ),
      trailing: Icon(call.isVideo ? Icons.videocam_outlined : Icons.call_outlined, color: Colors.black),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      floating: false,
      pinned: true,
      backgroundColor: AppColors.white,
      title: const Text("Calls", style: TextStyle(color: Colors.black, fontSize: 24)),
      actions: [
        IconButton(icon: const Icon(Icons.camera_alt_outlined, color: Colors.black), onPressed: () {}),
        IconButton(icon: const Icon(Icons.search, color: Colors.black), onPressed: () {}),
        IconButton(icon: const Icon(Icons.more_vert, color: Colors.black), onPressed: () {}),
      ],
    );
  }
}