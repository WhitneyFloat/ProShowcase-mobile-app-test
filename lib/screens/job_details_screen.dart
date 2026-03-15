import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../constants.dart';
import 'gallery_screen.dart';
import 'sign_off_screen.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({super.key});

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
            const Text('JOB #SP-9420', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.navy)),
            Text('Residential Array - 12kW', style: TextStyle(fontSize: 10, color: AppColors.navy.withOpacity(0.6))),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.share2, color: AppColors.navy),
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(radius: 4, backgroundColor: Colors.green),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildJobHeader(),
            _buildContactActions(),
            _buildInstallationPhotos(context),
            _buildSystemSpecs(),
            _buildTechnicianNotes(),
            _buildMapPreview(),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomAction(context),
    );
  }

  Widget _buildJobHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Thompson\nResidence',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.navy, height: 1.1),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  children: [
                    Text('IN', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.navy)),
                    Text('PROGRESS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.navy)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(LucideIcons.mapPin, size: 16, color: AppColors.navy.withOpacity(0.6)),
              const SizedBox(width: 8),
              Text('482 Oak Ridge Ln, Austin, TX', style: TextStyle(fontSize: 14, color: AppColors.navy.withOpacity(0.6))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          _contactButton(LucideIcons.phone, 'Call Client'),
          const SizedBox(width: 12),
          _contactButton(LucideIcons.messageSquare, 'Message'),
        ],
      ),
    );
  }

  Widget _contactButton(IconData icon, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.navy.withOpacity(0.1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: AppColors.navy),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy)),
          ],
        ),
      ),
    );
  }

  Widget _buildInstallationPhotos(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(LucideIcons.image, size: 20, color: AppColors.navy),
                  SizedBox(width: 8),
                  Text('Installation Photos', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.navy)),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const GalleryScreen())),
                child: const Text('VIEW ALL', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.navy)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              _photoItem('South Facing - Main Roof', 'https://lh3.googleusercontent.com/aida-public/AB6AXuAWtY7_AVzOFStVA5BZu4WSd7UuXTkFQmD5Qq17x8lIFlddQSrG4ZCVqKhbmv_mVIHlpgZHndl_AS-FmqMuRhTi4y5ja9ZVG2Kb9kZuVSqxLe1XDkYWKpYdEm64MeYc3Qx_ipY84of-ZeLX8P3zVD-Ryt5F4eSJX7bv0NhV16_4FgUaEuQBV2yegp0UuMlmZSXC4a40VGI7MF7LSjSpH0XcNAGOZCwZNKBMKcWF5hJQwOu3OpHazcTPkEEAzIvOy3CDpuaRqLXTDDVD'),
              const SizedBox(width: 12),
              _photoItem('Hybrid Inverter', 'https://lh3.googleusercontent.com/aida-public/AB6AXuAb7r0x5XbxSafQ9e6iBYH_GCmrpfmJLJR19RW5T-bi_iQqWgsLtza5zW90yzVODFu2relzgZjL0Ua4_o6xhhL0n-35tOx1kED9FzHosjjruf45hg19xrGmupw79M2-Oo05enA5Tqfr4Gy5ErnO_Y3dwImf4uOgXVLfFwAjZ4vHd4za3ZSchHmzlHXXqlsr5COvSf_ZjWmvlEKQC6_uW4e4KOc4L4kE9JSBV_oeYxyjmRoxXV4OgW0UL0AWAaRv7SfzH1MO4GQfEPKV'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _photoItem(String label, String url) {
    return Container(
      width: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: Colors.black45, borderRadius: BorderRadius.circular(4)),
              child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 10)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSystemSpecs() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.navy.withOpacity(0.05)),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            const Row(
              children: [
                Icon(LucideIcons.settings, size: 18, color: AppColors.navy),
                SizedBox(width: 8),
                Text('System Specifications', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.navy)),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _specItem('PANEL TYPE', 'Mono 400W (x30)'),
                _specItem('INVERTER', 'String Hybrid'),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _specItem('STORAGE', '10kWh LFP Battery'),
                _specItem('EFFICIENCY', '22.4% Peak'),
              ],
            ),
            const SizedBox(height: 24),
            const Divider(color: Color(0xFFF0F0F0)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(LucideIcons.wifi, size: 14, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text('Gateway Online', style: TextStyle(fontSize: 12, color: AppColors.navy.withOpacity(0.6))),
                  ],
                ),
                Text('SN: SP-882-9901-X', style: TextStyle(fontSize: 10, color: AppColors.navy.withOpacity(0.4))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _specItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.blue.shade600)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.navy)),
      ],
    );
  }

  Widget _buildTechnicianNotes() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.navy,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(LucideIcons.fileText, size: 18, color: AppColors.primary),
                SizedBox(width: 8),
                Text('Field Technician Notes', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primary)),
              ],
            ),
            const SizedBox(height: 20),
            _noteItem('Roof pitch is 35 degrees; safety harnesses mandatory for all phases.'),
            _noteItem('Ensure wiring path bypasses the ventilation stack on the North face.'),
            _noteItem('Oak tree shading verified; optimizer placement critical for strings 2 & 3.'),
          ],
        ),
      ),
    );
  }

  Widget _noteItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6.0),
            child: CircleAvatar(radius: 3, backgroundColor: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 13, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapPreview() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.shade300,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                child: const Icon(LucideIcons.zap, color: AppColors.navy),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomAction(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFF0F0F0))),
      ),
      child: SafeArea(
        child: ElevatedButton.icon(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SignOffScreen())),
          icon: const Icon(LucideIcons.navigation, size: 18),
          label: const Text('GET DIRECTIONS'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.navy,
            padding: const EdgeInsets.symmetric(vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
