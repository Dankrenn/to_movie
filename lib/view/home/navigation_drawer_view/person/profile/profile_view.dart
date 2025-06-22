import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_movie/data/user_app.dart';
import 'package:to_movie/view/home/navigation_drawer_view/person/person_provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PersonProvider>(context);
    return  SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _UserInfoSection(user: provider.user),
            const SizedBox(height: 32),
          ],
        ),
      );
  }
}



class _UserInfoSection extends StatelessWidget {
  final UserApp user;

  const _UserInfoSection({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Основная информация',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _InfoRow(icon: Icons.person, text: user.name),
            _InfoRow(icon: Icons.email, text: user.email),
            _InfoRow(icon: Icons.person_pin, text: 'ID: ${user.id}'),
          ],
        ),
      ),
    );
  }
}


class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(width: 16),
          Text(text),
        ],
      ),
    );
  }
}