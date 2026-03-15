import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'constants.dart';
import 'screens/dashboard_screen.dart';
import 'screens/job_details_screen.dart';
import 'screens/gallery_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/schedule_screen.dart';
import 'screens/inventory_screen.dart';

void main() {
  runApp(const SolarPulseApp());
}

class SolarPulseApp extends StatelessWidget {
  const SolarPulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SolarPulse Technician',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.navy,
          primary: AppColors.primary,
          surface: AppColors.white,
          background: AppColors.background,
        ),
        textTheme: GoogleFonts.interTextTheme(),
        useMaterial3: true,
      ),
      home: const MobileWebFrame(child: MainNavigation()),
    );
  }
}

class MobileWebFrame extends StatelessWidget {
  final Widget child;
  const MobileWebFrame({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 500) {
          return Container(
            color: const Color(0xFF1E1E1E),
            alignment: Alignment.center,
            child: Container(
              width: 400,
              height: 800,
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: const [
                  BoxShadow(color: Colors.black54, blurRadius: 20, spreadRadius: 5),
                ],
                border: Border.all(color: Colors.grey.shade800, width: 8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: child,
              ),
            ),
          );
        }
        return child;
      },
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const ScheduleScreen(),
    const InventoryScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.9),
          border: const Border(
            top: BorderSide(color: Color(0xFFE0E0E0), width: 0.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, LucideIcons.layout, 'DASHBOARD'),
            _buildNavItem(1, LucideIcons.calendar, 'CALENDAR'),
            _buildNavItem(2, LucideIcons.package, 'INVENTORY'),
            _buildNavItem(3, LucideIcons.user, 'PROFILE'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.navy : AppColors.grey,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: isSelected ? AppColors.navy : AppColors.grey,
              letterSpacing: -0.5,
            ),
          ),
        ],
      ),
    );
  }
}
