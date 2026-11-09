import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../core/constants/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String selectedRole = 'Customer';
  bool isLoading = false;

  void handleRegister() {
    setState(() => isLoading = true);
    Future.delayed(const Duration(seconds: 1), () {
      setState(() => isLoading = false);
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create Account',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Join VillageConnect today',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 30),
              CustomTextField(
                label: 'Full Name',
                hint: 'Enter your full name',
                controller: nameController,
                prefixIcon: Icons.person,
              ),
              CustomTextField(
                label: 'Phone Number',
                hint: 'Enter your phone number',
                controller: phoneController,
                keyboardType: TextInputType.phone,
                prefixIcon: Icons.phone,
              ),
              CustomTextField(
                label: 'Password',
                hint: 'Create a password',
                controller: passwordController,
                isPassword: true,
                prefixIcon: Icons.lock,
              ),
              const SizedBox(height: 16),
              const Text(
                'I am a:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _RoleCard(
                      title: 'Customer',
                      icon: Icons.person_search,
                      isSelected: selectedRole == 'Customer',
                      onTap: () => setState(() => selectedRole = 'Customer'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _RoleCard(
                      title: 'Worker',
                      icon: Icons.handyman,
                      isSelected: selectedRole == 'Worker',
                      onTap: () => setState(() => selectedRole = 'Worker'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: 'Register',
                onPressed: handleRegister,
                isLoading: isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _RoleCard({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryLight.withValues(alpha: 0.1)
              : Colors.white,
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : Colors.grey.shade300,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon,
                color: isSelected ? AppColors.primaryColor : Colors.grey,
                size: 32),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? AppColors.primaryColor : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
