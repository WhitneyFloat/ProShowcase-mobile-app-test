import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../constants.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Truck Inventory', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy)),
        actions: [
          IconButton(icon: const Icon(LucideIcons.search, color: AppColors.navy), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStockBanner(),
            const SizedBox(height: 24),
            const Text('CATEGORIES', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1, color: Colors.grey)),
            const SizedBox(height: 16),
            _buildCategoryGrid(),
            const SizedBox(height: 24),
            const Text('CRITICAL LOW STOCK', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1, color: AppColors.red)),
            const SizedBox(height: 16),
            _inventoryItem('Solar Panels 400W', '2 units left', AppColors.red),
            _inventoryItem('MC4 Connectors', '12 units left', Colors.orange),
            _inventoryItem('Roof Brackets', '5 units left', AppColors.red),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 32),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(LucideIcons.plus, size: 18),
          label: const Text('ADD PARTS'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.navy,
            padding: const EdgeInsets.symmetric(horizontal: 24),
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
    );
  }

  Widget _buildStockBanner() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [AppColors.navy, Color(0xFF1A1F3C)]),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Total Assets', style: TextStyle(color: Colors.white70, fontSize: 12)),
              SizedBox(height: 4),
              Text('1,402 items', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
            child: const Icon(LucideIcons.package, color: AppColors.primary, size: 32),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.5,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: [
        _categoryCard(LucideIcons.zap, 'Electrics', '840 items'),
        _categoryCard(LucideIcons.truck, 'Hardware', '120 items'),
        _categoryCard(LucideIcons.wrench, 'Tools', '42 items'),
        _categoryCard(LucideIcons.shieldCheck, 'Safety Gear', '15 items'),
      ],
    );
  }

  Widget _categoryCard(IconData icon, String title, String count) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.navy.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary, size: 20),
          const Spacer(),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy)),
          Text(count, style: const TextStyle(color: Colors.grey, fontSize: 10)),
        ],
      ),
    );
  }

  Widget _inventoryItem(String title, String status, Color statusColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.navy.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(height: 8, width: 8, decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle)),
          const SizedBox(width: 16),
          Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold))),
          Text(status, style: TextStyle(color: statusColor, fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
