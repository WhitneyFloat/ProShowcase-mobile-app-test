import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../constants.dart';
import 'job_details_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ListView(
        children: [
          _buildHeader(),
          _buildStatusCards(),
          const SizedBox(height: 16),
          _buildActiveNow(context),
          const SizedBox(height: 16),
          _buildTodaysJobs(),
          const SizedBox(height: 16),
          _buildResourceLinks(),
          const SizedBox(height: 120), // Extra padding for bottom nav
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 2),
                  image: const DecorationImage(
                    image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuBl7r0x5XbxSafQ9e6iBYH_GCmrpfmJLJR19RW5T-bi_iQqWgsLtza5zW90yzVODFu2relzgZjL0Ua4_o6xhhL0n-35tOx1kED9FzHosjjruf45hg19xrGmupw79M2-Oo05enA5Tqfr4Gy5ErnO_Y3dwImf4uOgXVLfFwAjZ4vHd4za3ZSchHmzlHXXqlsr5COvSf_ZjWmvlEKQC6_uW4e4KOc4L4kE9JSBV_oeYxyjmRoxXV4OgW0UL0AWAaRv7SfzH1MO4GQfEPKV'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SOLARPULSE SYSTEMS',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      color: AppColors.navy.withOpacity(0.6),
                    ),
                  ),
                  const Text(
                    'Alex Thompson',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(LucideIcons.bell, color: AppColors.navy),
                onPressed: () {},
              ),
              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          _statusCard('PENDING', '02', null),
          const SizedBox(width: 12),
          _statusCard('ACTIVE', '01', AppColors.primary),
          const SizedBox(width: 12),
          _statusCard('DONE', '05', null, textColor: AppColors.green),
        ],
      ),
    );
  }

  Widget _statusCard(String label, String value, Color? dotColor, {Color? textColor}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.navy.withOpacity(0.05)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: AppColors.navy.withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: textColor ?? AppColors.navy,
                  ),
                ),
                if (dotColor != null) ...[
                  const SizedBox(width: 8),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: dotColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveNow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ACTIVE NOW',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              color: AppColors.navy.withOpacity(0.4),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.navy,
              borderRadius: BorderRadius.circular(24),
              image: const DecorationImage(
                image: AssetImage(AppAssets.dashboardBg),
                fit: BoxFit.cover,
                opacity: 0.2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'PRIORITY 1',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                            color: AppColors.navy,
                          ),
                        ),
                      ),
                      const Text(
                        'Slot: 09:00 - 11:30',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Inverter Replacement',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '10kW Photovoltaic Array • Model X-200',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const Icon(LucideIcons.mapPin, color: Colors.white70, size: 14),
                      const SizedBox(width: 8),
                      Text(
                        '123 Solar Way, Brightville, CA',
                        style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.9)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(LucideIcons.user, color: Colors.white70, size: 14),
                      const SizedBox(width: 8),
                      Text(
                        'Customer: John Doe',
                        style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.9)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const JobDetailsScreen()),
                            );
                          },
                          icon: const Icon(LucideIcons.play, size: 18),
                          label: const Text('START JOB'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.navy,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 14,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(LucideIcons.navigation, color: AppColors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodaysJobs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'TODAY\'S JOBS',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: AppColors.navy.withOpacity(0.4),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'View Schedule',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.navy),
                ),
              ),
            ],
          ),
          _jobItem('Next Task • 13:00', 'Annual Maintenance', '5.5kW System', '1.5 Hours', '456 Oak Crescent, Sunnyvale'),
          const SizedBox(height: 12),
          _jobItem('Afternoon • 15:30', 'Battery Hub Install', 'Tesla Powerwall', '3 Hours', '789 Pine Road, Riverside'),
        ],
      ),
    );
  }

  Widget _jobItem(String tag, String title, String subtitle1, String subtitle2, String address) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.navy.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tag,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColors.navy.withOpacity(0.4),
                    ),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.navy,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  _circularAction(LucideIcons.phone),
                  const SizedBox(width: 8),
                  _circularAction(LucideIcons.fileText),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _iconText(LucideIcons.zap, subtitle1),
              const SizedBox(width: 16),
              _iconText(LucideIcons.clock, '~$subtitle2'),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1, color: Color(0xFFF0F0F0)),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(LucideIcons.mapPin, size: 14, color: AppColors.navy.withOpacity(0.4)),
              const SizedBox(width: 8),
              Text(
                address,
                style: TextStyle(fontSize: 12, color: AppColors.navy.withOpacity(0.6)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _circularAction(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.navy.withOpacity(0.05),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 18, color: AppColors.navy),
    );
  }

  Widget _iconText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.navy.withOpacity(0.6)),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.navy.withOpacity(0.6)),
        ),
      ],
    );
  }

  Widget _buildResourceLinks() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'RESOURCE LINKS',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              color: AppColors.navy.withOpacity(0.4),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _resourceCard(LucideIcons.map, 'Open Maps'),
              const SizedBox(width: 12),
              _resourceCard(LucideIcons.bookOpen, 'Manuals'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _resourceCard(IconData icon, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.navy.withOpacity(0.05)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 20, color: AppColors.navy),
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
