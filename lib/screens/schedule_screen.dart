import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../constants.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Service Schedule', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy)),
        actions: [
          IconButton(icon: const Icon(LucideIcons.calendar, color: AppColors.navy), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          _buildCalendarStrip(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildTimeSlot('09:00', 'Inverter Replacement', '123 Solar Way', true),
                _buildTimeSlot('11:30', 'Lunch Break', '', false, isBreak: true),
                _buildTimeSlot('13:00', 'Annual Maintenance', '456 Oak Crescent', false),
                _buildTimeSlot('15:30', 'Battery Hub Install', '789 Pine Road', false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarStrip() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _dateItem('MON', '21', false),
          _dateItem('TUE', '22', false),
          _dateItem('WED', '23', true),
          _dateItem('THU', '24', false),
          _dateItem('FRI', '25', false),
        ],
      ),
    );
  }

  Widget _dateItem(String day, String date, bool isSelected) {
    return Column(
      children: [
        Text(day, style: TextStyle(fontSize: 10, color: isSelected ? AppColors.primary : Colors.grey, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.navy : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Text(date, style: TextStyle(color: isSelected ? Colors.white : AppColors.navy, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _buildTimeSlot(String time, String title, String address, bool isActive, {bool isBreak = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(time, style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy.withOpacity(0.5))),
          const SizedBox(width: 24),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isBreak ? Colors.grey.withOpacity(0.1) : (isActive ? AppColors.navy : Colors.white),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.navy.withOpacity(0.05)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: isBreak ? Colors.grey : (isActive ? Colors.white : AppColors.navy), fontSize: 16)),
                  if (address.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(LucideIcons.mapPin, size: 12, color: isActive ? Colors.white70 : Colors.grey),
                        const SizedBox(width: 8),
                        Text(address, style: TextStyle(color: isActive ? Colors.white70 : Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
