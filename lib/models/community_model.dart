class CommunityModel {
  final String name;
  final String imageUrl;
  final List<SubGroupModel> subGroups;

  const CommunityModel({required this.name, required this.imageUrl, required this.subGroups});
}

class SubGroupModel {
  final String name;
  final String lastSender;
  final String lastMessage;
  final String time;
  final String imageUrl;
  final bool isAnnouncements;

  const SubGroupModel({
    required this.name,
    required this.lastSender,
    required this.lastMessage,
    required this.time,
    required this.imageUrl,
    this.isAnnouncements = false,
  });
}