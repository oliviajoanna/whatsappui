class ChatModel {
  final String name;
  final String lastMessage;
  final String time;
  final String imageUrl;
  final int unreadCount;
  final bool isPinned;

  const ChatModel({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.imageUrl,
    this.unreadCount = 0,
    this.isPinned = false,
  });
}