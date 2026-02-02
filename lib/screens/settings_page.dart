import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../providers/app_state_provider.dart';
import '../utils/profile_utils.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class AppStrings {
  static const Map<String, Map<String, String>> _data = {
    'en': {'settings': 'Settings', 'start': 'Start Quiz'},
    'ar': {'settings': 'الإعدادات', 'start': 'ابدأ الاختبار'},
    'ur': {'settings': 'ترتیبات', 'start': 'کوئز شروع کریں'},
  };

  static String get(String key, BuildContext context) {
    String code = Provider.of<AppStateProvider>(context).locale.languageCode;
    return _data[code]?[key] ?? _data['en']![key]!;
  }
}

class _SettingsPageState extends State<SettingsPage> {
  bool backgroundNasheed = true;
  bool prayerAlerts = false;

  final Color accentTeal = const Color(0xFF26A69A);
  final Color darkCard = const Color(0xFF132521);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppStateProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF0A1A16), // HalimTek Dark Base
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppStrings.get("settings", context),
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(appState),
            const SizedBox(height: 35),

            _sectionTitle("PREFERENCES"),
            _buildSettingsGroup([
              _settingsRow(
                Icons.language_outlined,
                "Language",
                trailing: "${appState.currentLanguageDisplayName} >",
                onTap: () => _showLanguagePicker(context),
              ),
              _settingsSwitch(
                Icons.dark_mode_outlined,
                "Dark Mode",
                appState.isDarkMode,
                (v) => appState.toggleTheme(v),
              ),
            ]),
            const SizedBox(height: 25),

            _sectionTitle("AUDIO & VISUAL"),
            _buildSettingsGroup([
              _settingsSwitch(
                Icons.volume_up_outlined,
                "Sound Effects",
                appState.soundEnabled,
                (v) => appState.toggleSound(v),
              ),
              _settingsSwitch(
                Icons.music_note_outlined,
                "Background Nasheed",
                backgroundNasheed,
                (v) => setState(() => backgroundNasheed = v),
              ),
              _settingsSwitch(
                Icons.vibration_outlined,
                "Vibration",
                appState.vibrations,
                (v) => appState.toggleVibration(v),
              ),
            ]),
            const SizedBox(height: 25),

            _sectionTitle("NOTIFICATIONS"),
            _buildSettingsGroup([
              _settingsSwitch(
                Icons.notifications_active_outlined,
                "Daily Reminders",
                appState.soundEnabled,
                (v) => appState.toggleSound(v),
              ),
              _settingsSwitch(
                Icons.mosque_outlined,
                "Prayer Time Alerts",
                prayerAlerts,
                (v) => setState(() => prayerAlerts = v),
              ),
            ]),
            const SizedBox(height: 25),

            _sectionTitle("SUPPORT"),
            _buildSettingsGroup([
              _settingsRow(Icons.help_outline, "Help Center"),
              _settingsRow(Icons.security, "Privacy Policy"),
              _settingsRow(Icons.logout_rounded, "Log Out", color: Colors.redAccent),
            ]),
            const SizedBox(height: 50),

            _buildFooter(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(AppStateProvider appState) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: darkCard,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: accentTeal.withOpacity(0.5), width: 2),
            ),
            child: CircleAvatar(
              radius: 32,
              backgroundColor: Colors.white10,
              backgroundImage: appState.imageFile != null
                  ? FileImage(appState.imageFile!) as ImageProvider
                  : const AssetImage('assets/profile_picture.jpg'),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appState.userName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Level 5 • Scholar",
                  style: TextStyle(
                    color: accentTeal,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => ProfileUtils.showEditSheet(context),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: accentTeal.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Edit",
                  style: TextStyle(
                    color: accentTeal,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.amber,
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  Widget _buildSettingsGroup(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: darkCard,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: children.asMap().entries.map((entry) {
          int idx = entry.key;
          Widget child = entry.value;
          return Column(
            children: [
              child,
              if (idx != children.length - 1)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(color: Colors.white.withOpacity(0.05), height: 1),
                ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _settingsRow(IconData icon, String title, {String? trailing, Color color = Colors.white, VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: accentTeal, size: 22),
      title: Text(
        title,
        style: TextStyle(color: color, fontWeight: FontWeight.w500, fontSize: 15),
      ),
      trailing: trailing != null
          ? Text(trailing, style: TextStyle(color: accentTeal, fontSize: 13, fontWeight: FontWeight.bold))
          : const Icon(Icons.chevron_right, color: Colors.white24, size: 20),
    );
  }

  Widget _settingsSwitch(IconData icon, String title, bool value, Function(bool) onChanged) {
    return ListTile(
      leading: Icon(icon, color: accentTeal, size: 22),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
      ),
      trailing: CupertinoSwitch(
        value: value,
        activeColor: accentTeal,
        onChanged: onChanged,
      ),
    );
  }

  void _showLanguagePicker(BuildContext context) {
    final appState = Provider.of<AppStateProvider>(context, listen: false);
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF0A1A16),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) {
        List<Map<String, String>> languages = [
          {"name": "English", "code": "en"},
          {"name": "Arabic", "code": "ar"},
          {"name": "Urdu", "code": "ur"},
          {"name": "Malay", "code": "ms"},
          {"name": "French", "code": "fr"},
        ];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: languages.map((lang) => ListTile(
              title: Text(lang["name"]!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
              trailing: appState.locale.languageCode == lang["code"] 
                  ? Icon(Icons.check_circle, color: accentTeal) 
                  : null,
              onTap: () {
                appState.setLocale(lang["code"]!);
                Navigator.pop(context);
              },
            )).toList(),
          ),
        );
      },
    );
  }

  Widget _buildFooter() {
    return Center(
      child: Column(
        children: [
          Icon(Icons.stars_rounded, color: accentTeal.withOpacity(0.5), size: 35),
          const SizedBox(height: 15),
          const Text("Version 1.0.2", style: TextStyle(color: Colors.white24, fontSize: 12)),
          const SizedBox(height: 5),
          const Text("Made with ♥ for the Ummah", style: TextStyle(color: Colors.white10, fontSize: 10)),
        ],
      ),
    );
  }
}