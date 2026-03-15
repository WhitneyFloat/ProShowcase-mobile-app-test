import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:signature/signature.dart';
import '../constants.dart';

class SignOffScreen extends StatefulWidget {
  const SignOffScreen({super.key});

  @override
  State<SignOffScreen> createState() => _SignOffScreenState();
}

class _SignOffScreenState extends State<SignOffScreen> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 3,
    penColor: AppColors.navy,
    exportBackgroundColor: Colors.white,
  );

  bool _inspected = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.chevronLeft, color: AppColors.navy),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Project Completion Sign-off', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Final Review', 'Ref: SP-2023-1024-X'),
            _buildProjectSummary(),
            const SizedBox(height: 32),
            _buildSectionHeader('Authorization Statement', null),
            _buildAuthorizationCard(),
            const SizedBox(height: 24),
            _buildInspectionCheckbox(),
            const SizedBox(height: 32),
            _buildSignaturePad(),
            const SizedBox(height: 32),
            _buildSubmitButton(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String? ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.navy)),
        if (ref != null) Text(ref, style: TextStyle(fontSize: 14, color: AppColors.navy.withOpacity(0.5))),
      ],
    );
  }

  Widget _buildProjectSummary() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.navy.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          Container(
            height: 120,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              image: DecorationImage(image: AssetImage(AppAssets.signOffBg), fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Project Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.navy)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Client: SolarPulse Systems', style: TextStyle(color: AppColors.navy.withOpacity(0.6))),
                        Text('Installation Date: Oct 24, 2023', style: TextStyle(color: AppColors.navy.withOpacity(0.6))),
                        Text('System Capacity: 12kW', style: TextStyle(color: AppColors.navy.withOpacity(0.6))),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.2), borderRadius: BorderRadius.circular(4)),
                      child: const Text('VERIFIED', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.navy)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAuthorizationCard() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEEF7),
        borderRadius: BorderRadius.circular(12),
        border: const Border(left: BorderSide(color: AppColors.navy, width: 4)),
      ),
      child: const Text(
        'I, the undersigned, confirm that the solar installation has been completed to my satisfaction and the system is operational. I acknowledge that I have received a thorough briefing on system operation, safety procedures, and emergency shutdowns. By signing below, I authorize the final activation and grid connection of the SolarPulse residential system.',
        style: TextStyle(color: AppColors.navy, height: 1.5, fontSize: 13),
      ),
    );
  }

  Widget _buildInspectionCheckbox() {
    return GestureDetector(
      onTap: () => setState(() => _inspected = !_inspected),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.navy.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(4),
            ),
            child: _inspected ? const Icon(LucideIcons.check, size: 18, color: AppColors.navy) : const SizedBox(width: 18, height: 18),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'I have inspected the installation and hardware.',
              style: TextStyle(color: AppColors.navy, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignaturePad() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('CLIENT SIGNATURE', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.navy)),
            TextButton.icon(
              onPressed: () => _controller.clear(),
              icon: const Icon(LucideIcons.refreshCcw, size: 14),
              label: const Text('CLEAR', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              style: TextButton.styleFrom(foregroundColor: AppColors.navy),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.navy.withOpacity(0.1)),
          ),
          child: Stack(
            children: [
              Signature(
                controller: _controller,
                height: 200,
                backgroundColor: Colors.transparent,
              ),
              if (_controller.isEmpty)
                const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(LucideIcons.penTool, size: 40, color: Color(0xFFE0E0E0)),
                      SizedBox(height: 8),
                      Text('SIGN HERE', style: TextStyle(color: Color(0xFFB0B0B0), fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Center(
          child: Text(
            'Digital signature timestamp: 2023-10-24 14:32:08 UTC',
            style: TextStyle(fontSize: 10, color: Colors.grey.shade500, fontStyle: FontStyle.italic),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Text('SUBMIT SIGN-OFF', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
            label: const Icon(LucideIcons.chevronRight, size: 18),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.navy,
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(LucideIcons.lock, size: 12, color: Colors.grey.shade500),
            const SizedBox(width: 8),
            Text(
              'Secured by SolarPulse Cloud Encryption',
              style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
            ),
          ],
        ),
      ],
    );
  }
}
