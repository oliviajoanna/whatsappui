class CallModel {
  final String name;
  final String time;
  final String imageUrl;
  final bool isVideo;
  final bool isIncoming;
  final bool isMissed;

  const CallModel({
    required this.name,
    required this.time,
    required this.imageUrl,
    this.isVideo = false,
    this.isIncoming = true,
    this.isMissed = false,
  });
}