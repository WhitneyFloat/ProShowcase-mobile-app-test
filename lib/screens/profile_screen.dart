import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(LucideIcons.chevronLeft, color: AppColors.navy),
        title: const Text(
          'Technician Profile',
          style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy),
        ),
        actions: const [
          Icon(LucideIcons.moreVertical, color: AppColors.navy),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            _buildProfileCard(),
            const SizedBox(height: 32),
            _buildStats(),
            const SizedBox(height: 32),
            _buildWeeklyActivity(),
            const SizedBox(height: 32),
            _buildCertifications(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.white, width: 4),
                image: const DecorationImage(
                  image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuBl7r0x5XbxSafQ9e6iBYH_GCmrpfmJLJR19RW5T-bi_iQqWgsLtza5zW90yzVODFu2relzgZjL0Ua4_o6xhhL0n-35tOx1kED9FzHosjjruf45hg19xrGmupw79M2-Oo05enA5Tqfr4Gy5ErnO_Y3dwImf4uOgXVLfFwAjZ4vHd4za3ZSchHmzlHXXqlsr5COvSf_ZjWmvlEKQC6_uW4e4KOc4L4kE9JSBV_oeYxyjmRoxXV4OgW0UL0AWAaRv7SfzH1MO4GQfEPKV'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: 8,
              bottom: 8,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white, width: 3),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Marcus Rivera',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.navy),
        ),
        const Text(
          'Lead Field Engineer',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(LucideIcons.zap, size: 14, color: AppColors.navy),
              const SizedBox(width: 8),
              Text(
                'SOLARPULSE SYSTEMS',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: AppColors.navy,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.navy,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Edit Profile', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.navy.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(LucideIcons.mail, color: AppColors.navy),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          _statCard(LucideIcons.layout, 'TOTAL INSTALLS', '142', '+12%'),
          const SizedBox(width: 16),
          _statCard(LucideIcons.star, 'AVG. RATING', '4.9', '+0.2'),
        ],
      ),
    );
  }

  Widget _statCard(IconData icon, String label, String value, String growth) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.navy.withOpacity(0.05)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: AppColors.navy.withOpacity(0.4), size: 18),
                Text(
                  growth,
                  style: const TextStyle(color: AppColors.green, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              label,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.grey),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.navy),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklyActivity() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Weekly Activity',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.navy),
              ),
              Text(
                'Last 7 Days',
                style: TextStyle(fontSize: 12, color: AppColors.grey),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 160,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.navy.withOpacity(0.05)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(),
                const Divider(height: 1, color: Color(0xFFF0F0F0)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Average daily hours', style: TextStyle(fontSize: 12, color: AppColors.grey)),
                    const Text('7.8 hrs', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.navy)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCertifications() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Certifications',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.navy),
              ),
              Text(
                'View All',
                style: TextStyle(fontSize: 12, color: AppColors.grey, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _certItem(LucideIcons.shieldCheck, 'NABCEP Certified PV Professional', 'Expires Oct 2025'),
          const SizedBox(height: 12),
          _certItem(LucideIcons.shieldAlert, 'OSHA Safety 30', 'Lifetime Validity'),
          const SizedBox(height: 12),
          _certItem(LucideIcons.zap, 'Electrical License Class A', 'Expires Jan 2026'),
        ],
      ),
    );
  }

  Widget _certItem(IconData icon, String title, String expiry) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.navy.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.navy, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy)),
                Text(expiry, style: TextStyle(fontSize: 12, color: AppColors.grey)),
              ],
            ),
          ),
          Icon(LucideIcons.chevronRight, size: 16, color: AppColors.grey),
        ],
      ),
    );
  }
}
