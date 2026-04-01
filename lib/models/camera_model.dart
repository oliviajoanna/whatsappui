class CameraGalleryModel {
  final String id;
  final String imageUrl;
  final bool isVideo;

  const CameraGalleryModel({
    required this.id,
    required this.imageUrl,
    this.isVideo = false,
  });
}