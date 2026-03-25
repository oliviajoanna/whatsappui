import '../models/chat_model.dart';
import '../models/status_model.dart';
import '../models/channel_model.dart';
import '../models/community_model.dart';


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


// TAMBAHKAN DATA STATUS DI SINI
  static const List<StatusModel> statuses = [
    StatusModel(
    name: "Uri Pilates Studio P...",
      imageUrl: "https://picsum.photos/seed/uri/400/700",
    ),
    StatusModel(
      name: "Kusno",
      imageUrl: "https://picsum.photos/seed/cat/400/700",
    ),
    StatusModel(
      name: "Mr. Esron Sinambela",
      imageUrl: "https://picsum.photos/seed/esron/400/700",
    ),
    StatusModel(
      name: "Melisa Ekahana",
      imageUrl: "https://picsum.photos/seed/melisa/400/700",
    ),
  ];

  // TAMBAHKAN DATA CHANNEL DI SINI
  static const List<ChannelModel> channels = [
    ChannelModel(
      name: "Olympics",
      description: "Confidence ✅ Passion ✅ Fit ch...",
      date: "Yesterday",
      imageUrl: "https://picsum.photos/seed/olympics/200",
    ),
    ChannelModel(
      name: "Sistem Informasi UPH",
      description: "Sekilas cuplikan dari keseharian ...",
      date: "11/15/25",
      imageUrl: "https://picsum.photos/seed/uph/200",
    ),
    ChannelModel(
      name: "SI-Update",
      description: "The channel 'SI-Update' was created",
      date: "Yesterday",
      imageUrl: "https://picsum.photos/seed/siupdate/200",
    ),
  ];

  static const List<CommunityModel> communities = [
    CommunityModel(
      name: "HMPSSI 2025/2026",
      imageUrl: "https://picsum.photos/seed/hmpssi/200",
      subGroups: [
        SubGroupModel(
          name: "Announcements",
          lastSender: "Tristanto Wijaya (IS 24)",
          lastMessage: "added the gr...",
          time: "10/29/25",
          imageUrl: "",
          isAnnouncements: true,
        ),
        SubGroupModel(
          name: "Creative Media HMPSSI 2...",
          lastSender: "Mishael",
          lastMessage: "Thank you",
          time: "08:44",
          imageUrl: "https://picsum.photos/seed/media/200",
        ),
      ],
    ),
    CommunityModel(
      name: "Panitia IS Night 2026",
      imageUrl: "https://picsum.photos/seed/isnight/200",
      subGroups: [
        SubGroupModel(
          name: "Announcements",
          lastSender: "+62 813-8787-3288",
          lastMessage: "joined",
          time: "3/12/26",
          imageUrl: "",
          isAnnouncements: true,
        ),
      ],
    ),
  ];
}