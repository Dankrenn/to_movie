import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_movie/global_setting_app/navigation/navigation_service.dart';
import 'package:to_movie/services/supabase_service.dart';
import 'package:to_movie/view/home/hub_provider.dart';

class HubView extends StatelessWidget {
  const HubView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HubProvider>(
      create: (context) => HubProvider(),
      child: const _HubScaffold(),
    );
  }
}

class _HubScaffold extends StatelessWidget {
  const _HubScaffold();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HubProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: _MenuButton(),
        title: const Text('ToMovie'),
        centerTitle: true,
      ),
      drawer: _AppDrawer(),
      body: provider.tabs[provider.selectedTab],
    );
  }
}

class _MenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () => Scaffold.of(context).openDrawer(),
    );
  }
}

class _AppDrawer extends StatelessWidget {

  const _AppDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HubProvider>(context);
    final theme = Theme.of(context);
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(16)),
      ),
      child: Column(
        children: [
          _DrawerHeader(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                _DrawerMenuItem(
                  icon: Icons.star,
                  label: 'Топ фильмы',
                  isSelected: provider.selectedTab == 0,
                    onTap: () => {
                      provider.selectedTab = 0,
                      Navigator.pop(context),
                    }
                ),
                _DrawerMenuItem(
                  icon: Icons.search,
                  label: 'Поиск',
                  isSelected: provider.selectedTab == 1,
                    onTap: () => {
                      provider.selectedTab = 1,
                      Navigator.pop(context),
                    }
                ),
                _DrawerMenuItem(
                  icon: Icons.recommend,
                  label: 'Рекомендации',
                  isSelected: provider.selectedTab == 2,
                    onTap: () => {
                      provider.selectedTab = 2,
                      Navigator.pop(context),
                    }
                ),
                _DrawerMenuItem(
                  icon: Icons.person,
                  label: 'Профиль',
                  isSelected: provider.selectedTab == 3,
                    onTap: () => {
                      provider.selectedTab = 3,
                      Navigator.pop(context),
                    }
                ),
                _DrawerMenuItem(
                  icon: Icons.settings,
                  label: 'Настройки',
                  isSelected: provider.selectedTab == 4,
                  onTap: () => {
                    provider.selectedTab = 4,
                    Navigator.pop(context),
                  }
                ),
              ],
            ),
          ),
          _LogoutButton(theme: theme),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primaryContainer,
          ],
        ),
      ),
      child: Stack(
        fit: StackFit.expand, // Растягиваем Stack на весь Container
        children: [
          // Фоновая иконка
          Positioned.fill( // Заполняет все доступное пространство
            child: Opacity(
              opacity: 0.2,
              child: Icon(
                Icons.movie_filter,
                size: 160, // Увеличиваем размер иконки
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
          // Текст поверх иконки
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'ToMovie',
                style: TextStyle(
                  color: theme.colorScheme.onPrimary,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 6,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _DrawerMenuItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isSelected
            ? theme.colorScheme.primary.withOpacity(0.1)
            : Colors.transparent,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected
              ? theme.colorScheme.primary
              : theme.colorScheme.onSurface.withOpacity(0.8),
        ),
        title: Text(
          label,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected
                ? theme.colorScheme.primary
                : theme.colorScheme.onSurface,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onTap: onTap,
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  final ThemeData theme;

  const _LogoutButton({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          Icons.exit_to_app,
        ),
        title: Text(
          'Выйти',
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onTap: () => {
          NavigationService.goToRegister(context),
        }
      ),
    );
  }
}