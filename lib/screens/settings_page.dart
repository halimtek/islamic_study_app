import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // For the iOS-style switches

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // State for toggles
  bool isDarkMode = false;
  bool soundEffects = true;
  bool backgroundNasheed = true;
  bool vibrations = false;
  bool dailyReminders = true;
  bool prayerAlerts = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF081411), // Darkest green background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Settings", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 30),
            _sectionTitle("PREFERENCES"),
            _buildSettingsGroup([
              _settingsRow(Icons.language, "Language", trailing: "English >"),
              _settingsSwitch(Icons.dark_mode, "Dark Mode", isDarkMode, (v) => setState(() => isDarkMode = v)),
            ]),
            const SizedBox(height: 25),
            _sectionTitle("AUDIO & VISUAL"),
            _buildSettingsGroup([
              _settingsSwitch(Icons.volume_up, "Sound Effects", soundEffects, (v) => setState(() => soundEffects = v)),
              _settingsSwitch(Icons.music_note, "Background Nasheed", backgroundNasheed, (v) => setState(() => backgroundNasheed = v)),
              _settingsSwitch(Icons.vibration, "Vibration", vibrations, (v) => setState(() => vibrations = v)),
            ]),
            const SizedBox(height: 25),
            _sectionTitle("NOTIFICATIONS"),
            _buildSettingsGroup([
              _settingsSwitch(Icons.notifications_active, "Daily Reminders", dailyReminders, (v) => setState(() => dailyReminders = v)),
              _settingsSwitch(Icons.mosque, "Prayer Time Alerts", prayerAlerts, (v) => setState(() => prayerAlerts = v)),
            ]),
            const SizedBox(height: 25),
            _sectionTitle("SUPPORT"),
            _buildSettingsGroup([
              _settingsRow(Icons.help_outline, "Help Center"),
              _settingsRow(Icons.security, "Privacy Policy"),
              _settingsRow(Icons.logout, "Log Out", color: Colors.redAccent),
            ]),
            const SizedBox(height: 40),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 35,
            backgroundColor: Color(0xFFFFD700),
            child: CircleAvatar(radius: 32, backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=12')),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Ahmed Ali", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
                Text("Level 5 • Scholar", style: TextStyle(color: Colors.teal.shade700, fontSize: 13, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(backgroundColor: Colors.teal.withOpacity(0.1), shape: const StadiumBorder()),
            child: const Text("Edit", style: TextStyle(color: Color(0xFF26A69A), fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      child: Text(title, style: const TextStyle(color: Colors.amber, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
    );
  }

  Widget _buildSettingsGroup(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(children: children),
    );
  }

  Widget _settingsRow(IconData icon, String title, {String? trailing, Color color = Colors.black87}) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal.shade400, size: 22),
      title: Text(title, style: TextStyle(color: color, fontWeight: FontWeight.w500, fontSize: 15)),
      trailing: trailing != null ? Text(trailing, style: const TextStyle(color: Colors.teal, fontSize: 14)) : const Icon(Icons.chevron_right, color: Colors.grey),
    );
  }

  Widget _settingsSwitch(IconData icon, String title, bool value, Function(bool) onChanged) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal.shade400, size: 22),
      title: Text(title, style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 15)),
      trailing: CupertinoSwitch(
        value: value,
        activeColor: const Color(0xFF26A69A),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildFooter() {
    return Center(
      child: Column(
        children: const [
          Icon(Icons.stars, color: Colors.teal, size: 30),
          SizedBox(height: 10),
          Text("Version 1.0.2", style: TextStyle(color: Colors.white38, fontSize: 12)),
          Text("Made with ♥ for the Ummah", style: TextStyle(color: Colors.white38, fontSize: 10)),
        ],
      ),
    );
  }
}