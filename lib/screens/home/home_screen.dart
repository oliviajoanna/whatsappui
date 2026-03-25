import 'package:flutter/material.dart';
import 'package:uas_flutter/screens/calls/calls_screen.dart';
import 'package:uas_flutter/screens/communities/communities_screen.dart';
import 'package:uas_flutter/screens/updates/updates_screen.dart';
import '../chats/chats_screen.dart'; // Ensure this path matches your tree

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Navigation targets based on your project tree
  final List<Widget> _screens = [
    const ChatScreen(), // Week 7: Tampilan Chats
    const UpdatesScreen(),
    const CommunitiesScreen(),
    const CallsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        backgroundColor: Colors.white,
        onDestinationSelected: (i) => setState(() => _selectedIndex = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.chat_outlined), 
            selectedIcon: Icon(Icons.chat),
            label: 'Chats',
          ),
          NavigationDestination(
            icon: Icon(Icons.update_outlined), 
            selectedIcon: Icon(Icons.update),
            label: 'Updates',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline), 
            selectedIcon: Icon(Icons.people),
            label: 'Communities',
          ),
          NavigationDestination(
            icon: Icon(Icons.call_outlined), 
            selectedIcon: Icon(Icons.call),
            label: 'Calls',
          ),
        ],
      ),
    );
  }
}