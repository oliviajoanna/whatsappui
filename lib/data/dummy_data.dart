import '../models/chat_model.dart';
import '../models/status_model.dart';
import '../models/channel_model.dart';
import '../models/community_model.dart';
import '../models/calls_model.dart';
import '../models/find_channel_model.dart';
import '../models/camera_model.dart';


class DummyData {
  static const List<ChatModel> chats = [
    ChatModel(
      name: "Sistem Informasi 2024",
      lastMessage: "Olivia (IS 24): Guys hari ini present....",
      time: "09:13",
      imageUrl: "https://picsum.photos/id/60/200",
      unreadCount: 2,
    ),
    ChatModel(
      name: "HMPSSI 2025/2026",
      lastMessage: "Mishael: Join live hm guys",
      time: "09:09",
      imageUrl: "https://picsum.photos/id/158/200",
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
      name: "Pak Suworno (gojek)",
      lastMessage: "Sticker",
      time: "Yesterday",
      imageUrl: "https://picsum.photos/seed/jane/200",
    ),
    ChatModel(
      name: "Mami 🤱",
      lastMessage: "Jangan lupa makan",
      time: "Yesterday",
      imageUrl: "https://picsum.photos/seed/family/200",
    ),
    ChatModel(
      name: "+62 888-8000-333",
      lastMessage: "Berikut terlampir untuk minimum charge",
      time: "3/23/26",
      imageUrl: "https://picsum.photos/seed/project/200",
    ),
  ];


// TAMBAHKAN DATA STATUS DI SINI
  static const List<StatusModel> statuses = [
    StatusModel(
    name: "Uri Pilates Studio",
      imageUrl: "https://picsum.photos/seed/uri/400/700",
    ),
    StatusModel(
      name: "Angela Markus",
      imageUrl: "https://picsum.photos/seed/cat/400/700",
    ),
    StatusModel(
      name: "Mr. Esron",
      imageUrl: "https://picsum.photos/seed/esron/400/700",
    ),
    StatusModel(
      name: "Melisa Gunawan",
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
      name: "Sisfor UPH",
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

  static const List<FindChannelModel> suggestedChannels = [
  FindChannelModel(
    name: "No One Cares",
    description: "",
    date: "",
    imageUrl: "https://picsum.photos/id/200/200",
    followers: "8.5M",
    isVerified: true,
  ),
  FindChannelModel(
    name: "Info Stock",
    description: "",
    date: "",
    imageUrl: "https://picsum.photos/id/201/200",
    followers: "231M",
    isVerified: true,
  ),
  FindChannelModel(
    name: "stiker meme rndm.",
    description: "",
    date: "",
    imageUrl: "https://picsum.photos/id/202/200",
    followers: "54K",
    isVerified: false,
  ),
];

  

  static const List<CommunityModel> communities = [
   CommunityModel(
      name: "Information Systems UPH",
      imageUrl: "https://picsum.photos/seed/uph/200",
      subGroups: [
        SubGroupModel(
          name: "Announcements",
          lastSender: "Calandra)",
          lastMessage: "Dear Mahasiswa",
          time: "Yesterday",
          imageUrl: "",
          isAnnouncements: true,
        ),
        SubGroupModel(
          name: "IS Regular 24",
          lastSender: "Calandra",
          lastMessage: "Reminder: Meeting tomorrow at 10 AM",
          time: "08:44",
          imageUrl: "https://picsum.photos/seed/chat/100",
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
    
  ];

  static const List<CallModel> calls = [
    CallModel(name: "Mami 🤱", time: "Today, 08:22", imageUrl: "https://picsum.photos/id/50/200", isVideo: true, isIncoming: false),
    CallModel(name: "Dokter Sandra", time: "Yesterday, 20:47", imageUrl: "", isIncoming: false),
    CallModel(name: "Ellen (UMN 23)", time: "Yesterday, 19:59", imageUrl: "", isIncoming: false),
    CallModel(name: "Chrisy (dkv 25)", time: "Yesterday, 17:16", imageUrl: "https://picsum.photos/seed/kate/200", isIncoming: false),
    CallModel(name: "Boss", time: "Yesterday, 11:27", imageUrl: "https://picsum.photos/seed/boss/200"),
    CallModel(name: "Ex 💔", time: "March 24, 02:59", imageUrl: "https://picsum.photos/id/237/200", isMissed: true),
    CallModel(name: "Ex 💔", time: "March 24, 02:53", imageUrl: "https://picsum.photos/id/237/200", isMissed: true),
    CallModel(name: "Ex 💔", time: "March 23, 23:12", imageUrl: "https://picsum.photos/id/237/200", isMissed: true),
    CallModel(name: "Pheodore Tandela", time: "March 2, 08:30", imageUrl: "", isIncoming: false),
    CallModel(name: "Pheodore Tandela", time: "March 2, 08:22", imageUrl: "", isMissed: true),
    CallModel(name: "Ibu Dinda", time: "March 1, 09:12", imageUrl: "https://picsum.photos/id/22/200",),
    CallModel(name: "Mami 🤱", time: "January 22, 08:22", imageUrl: "https://picsum.photos/id/50/200", isVideo: true),
  ];

  // Di bagian atas file dummy_data.dart


// Di dalam class DummyData
static const List<CameraGalleryModel> cameraGallery = [
  CameraGalleryModel(
    id: "1",
    imageUrl: "https://picsum.photos/id/1/200/300",
    isVideo: false,
  ),
  CameraGalleryModel(
    id: "2",
    imageUrl: "https://picsum.photos/id/10/200/300",
    isVideo: true,
  ),
  CameraGalleryModel(
    id: "3",
    imageUrl: "https://picsum.photos/id/20/200/300",
    isVideo: false,
  ),
  CameraGalleryModel(
    id: "4",
    imageUrl: "https://picsum.photos/id/30/200/300",
    isVideo: false,
  ),
  CameraGalleryModel(
    id: "5",
    imageUrl: "https://picsum.photos/id/40/200/300",
    isVideo: true,
  ),
];


}