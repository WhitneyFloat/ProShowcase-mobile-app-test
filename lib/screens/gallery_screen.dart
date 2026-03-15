import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../constants.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.chevronLeft, color: AppColors.navy),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          children: [
            const Text('SITE SURVEY', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
            const Text('#SP-8821', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.navy)),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(LucideIcons.moreVertical, color: AppColors.navy), onPressed: () {}),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLocationHeader(),
          _buildTabs(),
          Expanded(child: _buildGalleryGrid()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: const Icon(LucideIcons.camera, color: AppColors.navy),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildLocationHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('123 Solar Way', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.navy)),
              const Text('Tech City, California', style: TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: AppColors.green.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                const CircleAvatar(radius: 3, backgroundColor: AppColors.green),
                const SizedBox(width: 8),
                const Text('ACTIVE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.green)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _tabItem(0, 'All Photos (24)'),
          _tabItem(1, 'Roof'),
          _tabItem(2, 'Electrical Panel'),
        ],
      ),
    );
  }

  Widget _tabItem(int index, String label) {
    final isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTab = index),
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.navy : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? AppColors.navy : Colors.grey.shade300),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade600,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildGalleryGrid() {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 0.85,
      children: [
        _galleryItem('MAIN ROOF AREA', '10:45 AM', 'https://lh3.googleusercontent.com/aida-public/AB6AXuAWtY7_AVzOFStVA5BZu4WSd7UuXTkFQmD5Qq17x8lIFlddQSrG4ZCVqKhbmv_mVIHlpgZHndl_AS-FmqMuRhTi4y5ja9ZVG2Kb9kZuVSqxLe1XDkYWKpYdEm64MeYc3Qx_ipY84of-ZeLX8P3zVD-Ryt5F4eSJX7bv0NhV16_4FgUaEuQBV2yegp0UuMlmZSXC4a40VGI7MF7LSjSpH0XcNAGOZCwZNKBMKcWF5hJQwOu3OpHazcTPkEEAzIvOy3CDpuaRqLXTDDVD', status: 'SYNCED'),
        _galleryItem('ELECTRICAL PANEL', 'SYNCING...', 'https://lh3.googleusercontent.com/aida-public/AB6AXuAb7r0x5XbxSafQ9e6iBYH_GCmrpfmJLJR19RW5T-bi_iQqWgsLtza5zW90yzVODFu2relzgZjL0Ua4_o6xhhL0n-35tOx1kED9FzHosjjruf45hg19xrGmupw79M2-Oo05enA5Tqfr4Gy5ErnO_Y3dwImf4uOgXVLfFwAjZ4vHd4za3ZSchHmzlHXXqlsr5COvSf_ZjWmvlEKQC6_uW4e4KOc4L4kE9JSBV_oeYxyjmRoxXV4OgW0UL0AWAaRv7SfzH1MO4GQfEPKV', status: 'SYNCING'),
        _galleryItem('UTILITY METER', '11:02 AM', 'https://lh3.googleusercontent.com/aida-public/AB6AXuBl7r0x5XbxSafQ9e6iBYH_GCmrpfmJLJR19RW5T-bi_iQqWgsLtza5zW90yzVODFu2relzgZjL0Ua4_o6xhhL0n-35tOx1kED9FzHosjjruf45hg19xrGmupw79M2-Oo05enA5Tqfr4Gy5ErnO_Y3dwImf4uOgXVLfFwAjZ4vHd4za3ZSchHmzlHXXqlsr5COvSf_ZjWmvlEKQC6_uW4e4KOc4L4kE9JSBV_oeYxyjmRoxXV4OgW0UL0AWAaRv7SfzH1MO4GQfEPKV', status: 'SYNCED'),
        _galleryItem('CHIMNEY OBSTRUCTION', 'RETRY UPLOAD', 'https://lh3.googleusercontent.com/aida-public/AB6AXuAWtY7_AVzOFStVA5BZu4WSd7UuXTkFQmD5Qq17x8lIFlddQSrG4ZCVqKhbmv_mVIHlpgZHndl_AS-FmqMuRhTi4y5ja9ZVG2Kb9kZuVSqxLe1XDkYWKpYdEm64MeYc3Qx_ipY84of-ZeLX8P3zVD-Ryt5F4eSJX7bv0NhV16_4FgUaEuQBV2yegp0UuMlmZSXC4a40VGI7MF7LSjSpH0XcNAGOZCwZNKBMKcWF5hJQwOu3OpHazcTPkEEAzIvOy3CDpuaRqLXTDDVD', status: 'ERROR'),
      ],
    );
  }

  Widget _galleryItem(String label, String time, String url, {required String status}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover, opacity: status == 'SYNCING' ? 0.6 : 1.0),
      ),
      child: Stack(
        children: [
          if (status == 'SYNCING')
            const Center(child: CircularProgressIndicator(color: AppColors.primary)),
          Positioned(
            top: 12,
            right: 12,
            child: Icon(
              status == 'SYNCED' ? LucideIcons.checkCircle2 : (status == 'ERROR' ? LucideIcons.alertCircle : LucideIcons.loader),
              color: status == 'SYNCED' ? AppColors.green : (status == 'ERROR' ? AppColors.red : AppColors.primary),
              size: 20,
            ),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                Text(time, style: const TextStyle(color: Colors.white70, fontSize: 8)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 70,
      decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade200))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navIcon(LucideIcons.fileText, 'PROJECTS'),
          _navIcon(LucideIcons.image, 'GALLERY', isSelected: true),
          _navIcon(LucideIcons.refreshCw, 'SYNC'),
          _navIcon(LucideIcons.user, 'PROFILE'),
        ],
      ),
    );
  }

  Widget _navIcon(IconData icon, String label, {bool isSelected = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: isSelected ? AppColors.navy : Colors.grey),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: isSelected ? AppColors.navy : Colors.grey)),
      ],
    );
  }
}
