import 'package:flutter/material.dart';
import '../../data/dummy_data.dart'; 
import '../../core/theme/app_colors.dart'; 
import '../../models/camera_model.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  // 0 untuk Video, 1 untuk Photo. Default ke Photo (1) sesuai screenshot.
  int _selectedModeIndex = 1; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Layar hitam sesuai prototipe
      body: Stack(
        children: [
          // 1. Top Bar rapat (Tombol Back, Flash, Mic, Gear)
          Positioned(
            top: 10,
            left: 5,
            right: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTopIconButton(Icons.close, onPressed: () => Navigator.pop(context)),
                Row(
                  children: [
                    _buildTopIconButton(Icons.flash_off),
                    const SizedBox(width: 5),
            
                  ],
                ),
              ],
            ),
          ),

          // 2. Bottom Controls Area (Galeri, Jepret, Switch Cam, Mode)
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // A. Preview Galeri Media (Data dari DummyData)
                _buildGalleryPreview(),

                const SizedBox(height: 12),

                // B. Main Control Row (Galeri, Filter, Jepret, Switch)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Tombol Galeri (Kiri) - Ikon Lebih Kecil (18)
                      _buildBottomIconButton(Icons.photo_library_outlined, size: 18),

                      const SizedBox(width: 10), 
                      
                      // Tombol Magic Filter (Baru) - Ikon Lebih Kecil (18)
                      _buildBottomIconButton(Icons.auto_fix_high_outlined, size: 14),

                      const SizedBox(width: 10), 
                      
                      // Tombol Jepret Utama (Tengah) - Ukuran Disesuaikan
                      _buildCaptureButton(),

                      const SizedBox(width: 40), 
                      
                      // Tombol Switch Kamera (Kanan) - Ikon Lebih Kecil (18)
                      _buildBottomIconButton(Icons.cameraswitch_outlined, size: 18),
                      
                      // Spasi kosong agar layout seimbang (karena ada 4 item di Row ini)
                      
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                // C. Mode Selector (Video / Photo) di paling bawah
                _buildModeSelector(),
                
                const SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- WIDGET HELPER ---

  // Ikon Kecil untuk Top Bar (Size 20)
  Widget _buildTopIconButton(IconData icon, {VoidCallback? onPressed}) {
    return IconButton(
      iconSize: 20,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      icon: Icon(icon, color: Colors.white),
      onPressed: onPressed ?? () {},
    );
  }

  // Widget List Foto Horizontal (Mengambil dari DummyData.suggestedChannels/sejenisnya)
  Widget _buildGalleryPreview() {
  // Mengambil data dari list cameraGallery yang baru kita buat
  final List<CameraGalleryModel> galleryItems = DummyData.cameraGallery;

  return SizedBox(
    height: 55,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      itemCount: galleryItems.length,
      itemBuilder: (context, index) {
        final item = galleryItems[index];
        return Container(
          width: 55,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.white24, width: 1),
            image: DecorationImage(
              image: NetworkImage(item.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          // Menampilkan ikon video jika item.isVideo == true
          child: item.isVideo 
            ? const Center(
                child: Icon(Icons.play_circle_outline, color: Colors.white, size: 20),
              )
            : null,
        );
      },
    ),
  );
}

  // Tombol Ikon Bulat Gelap di Samping Jepret (Ikon Diperkecil)
  Widget _buildBottomIconButton(IconData icon, {double size = 22}) {
    return Container(
      padding: const EdgeInsets.all(10), // Padding disesuaikan
      decoration: const BoxDecoration(
        color: Colors.white10, // Gelap transparan
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: size), // Size dikirim dari parameter
    );
  }

  // Tombol Jepret Besar (Desain Lingkaran Ganda)
  Widget _buildCaptureButton() {
    return Container(
      height: 60, // Sedikit lebih kecil agar rapat
      width: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3.5), // Border lebih tipis
      ),
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  // Pemilih Mode Video/Photo di Paling Bawah
  Widget _buildModeSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2225).withOpacity(0.8), // Latar gelap membulat
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _modeText("Video", 0),
          const SizedBox(width: 8),
          _modeText("Photo", 1),
        ],
      ),
    );
  }

  Widget _modeText(String text, int index) {
    bool isSelected = _selectedModeIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedModeIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent, // Background putih jika terpilih
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white60, // Teks hitam jika terpilih
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}