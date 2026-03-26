class FindChannelModel {
  final String name;
  final String description;
  final String date;
  final String imageUrl;
  final String followers; // Tambahan: Jumlah followers
  final bool isVerified;  // Tambahan: Status centang biru

  const FindChannelModel({
    required this.name,
    required this.description,
    required this.date,
    required this.imageUrl,
    this.followers = "0",     // Default 0
    this.isVerified = false,  // Default tidak verified
  });
}