import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/settings_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: settings.isDarkMode,
            onChanged: (value) {
              settings.toggleDarkMode(value);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Font Size'),
            trailing: DropdownButton<double>(
              value: settings.fontSize,
              items: const [
                DropdownMenuItem(value: 14.0, child: Text('Small (14px)')),
                DropdownMenuItem(value: 20.0, child: Text('Large (20px)')),
              ],
              onChanged: (value) {
                if (value != null) settings.updateFontSize(value);
              },
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Font Family'),
            trailing: DropdownButton<String>(
              value: settings.fontFamily,
              items: const [
                DropdownMenuItem(value: 'Roboto', child: Text('Roboto')),
                DropdownMenuItem(value: 'Serif', child: Text('Serif')),
                DropdownMenuItem(value: 'Monospace', child: Text('Monospace')),
              ],
              onChanged: (value) {
                if (value != null) settings.updateFontFamily(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
