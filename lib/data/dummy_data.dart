import '../models/chat_model.dart';

class DummyData {
  static const List<ChatModel> chats = [
    ChatModel(
      name: "Sistem Informasi 2024",
      lastMessage: "Olivia (IS 24): Guys hari ini present....",
      time: "09:13",
      imageUrl: "https://picsum.photos/seed/si24/200",
      unreadCount: 2,
    ),
    ChatModel(
      name: "HMPSSI 2025/2026",
      lastMessage: "HMPSSI 2025/2026: tolong kabari ya",
      time: "09:09",
      imageUrl: "https://picsum.photos/seed/hmpssi/200",
      unreadCount: 12,
      isPinned: true,
    ),
    ChatModel(
      name: "ICC",
      lastMessage: "Nihon Utopia 25/26: 🇯🇵",
      time: "09:05",
      imageUrl: "https://picsum.photos/seed/icc/200",
      unreadCount: 5,
    ),
    ChatModel(
      name: "Jenneth (UPH)",
      lastMessage: "Boleh tolong share gak?",
      time: "09:30",
      imageUrl: "https://picsum.photos/seed/john/200",
    ),
    ChatModel(
      name: "+62 821-2459-1994",
      lastMessage: "Kalau ada perkembangan baru kasih tau ya",
      time: "09:45",
      imageUrl: "https://picsum.photos/seed/unknown/200",
      unreadCount: 3,
    ),
    ChatModel(
      name: "Qpon",
      lastMessage: "Tap the login button to access your Qpon app",
      time: "Sunday",
      imageUrl: "https://picsum.photos/seed/qpon/200",
    ),
    ChatModel(
      name: "Jane Smith",
      lastMessage: "Sticker",
      time: "Yesterday",
      imageUrl: "https://picsum.photos/seed/jane/200",
    ),
    ChatModel(
      name: "Mami",
      lastMessage: "Jangan lupa makan",
      time: "Yesterday",
      imageUrl: "https://picsum.photos/seed/family/200",
    ),
    ChatModel(
      name: "Sportify",
      lastMessage: "Typing...",
      time: "08:15",
      imageUrl: "https://picsum.photos/seed/project/200",
    ),
  ];
}