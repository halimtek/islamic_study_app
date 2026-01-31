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
  // Local state for toggles not yet synced to a database
  bool backgroundNasheed = true;
  bool prayerAlerts = false;

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppStateProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF081411), // Your deep green
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppStrings.get("settings", context),
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(appState),
            const SizedBox(height: 30),

            _sectionTitle("PREFERENCES"),
            _buildSettingsGroup([
              _settingsRow(
                Icons.language,
                "Language",
                trailing: "${appState.currentLanguageDisplayName} >",
                onTap: () => _showLanguagePicker(context),
              ),
              _settingsSwitch(
                Icons.dark_mode,
                "Dark Mode",
                appState.isDarkMode,
                (v) => appState.toggleTheme(v),
              ),
            ]),
            const SizedBox(height: 25),

            _sectionTitle("AUDIO & VISUAL"),
            _buildSettingsGroup([
              _settingsSwitch(
                Icons.volume_up,
                "Sound Effects",
                appState.soundEnabled,
                (v) => appState.toggleSound(v),
              ),
              _settingsSwitch(
                Icons.music_note,
                "Background Nasheed",
                backgroundNasheed,
                (v) => setState(() => backgroundNasheed = v),
              ),
              _settingsSwitch(
                Icons.vibration,
                "Vibration",
                appState.vibrations,
                (v) => appState.toggleVibration(v),
              ),
            ]),
            const SizedBox(height: 25),

            _sectionTitle("NOTIFICATIONS"),
            _buildSettingsGroup([
              _settingsSwitch(
                Icons.notifications_active,
                "Daily Reminders",
                appState.soundEnabled, // Using sound status as placeholder
                (v) => appState.toggleSound(v),
              ),
              _settingsSwitch(
                Icons.mosque,
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
              _settingsRow(Icons.logout, "Log Out", color: Colors.redAccent),
            ]),
            const SizedBox(height: 40),

            _buildFooter(),
          ],
        ),
      ),
    );
  }

  // --- UI COMPONENTS ---

  Widget _buildProfileHeader(AppStateProvider appState) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: const Color(0xFFFFD700), // Gold border
            child: CircleAvatar(
              radius: 32,
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
                    color: Colors.black87,
                  ),
                ),
                Text(
                  "Level 5 • Scholar",
                  style: TextStyle(
                    color: Colors.teal.shade700,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => ProfileUtils.showEditSheet(context),
            style: TextButton.styleFrom(
              backgroundColor: Colors.teal.withOpacity(0.1),
              shape: const StadiumBorder(),
            ),
            child: const Text(
              "Edit",
              style: TextStyle(
                color: Color(0xFF26A69A),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.amber, // Golden accents
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildSettingsGroup(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: children),
    );
  }

  Widget _settingsRow(IconData icon, String title, {String? trailing, Color color = Colors.black87, VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: Colors.teal.shade400, size: 22),
      title: Text(
        title,
        style: TextStyle(color: color, fontWeight: FontWeight.w500, fontSize: 15),
      ),
      trailing: trailing != null
          ? Text(trailing, style: const TextStyle(color: Colors.teal, fontSize: 14))
          : const Icon(Icons.chevron_right, color: Colors.grey),
    );
  }

  Widget _settingsSwitch(IconData icon, String title, bool value, Function(bool) onChanged) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal.shade400, size: 22),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 15),
      ),
      trailing: CupertinoSwitch(
        value: value,
        activeTrackColor: const Color(0xFF26A69A),
        onChanged: onChanged,
      ),
    );
  }

  void _showLanguagePicker(BuildContext context) {
    final appState = Provider.of<AppStateProvider>(context, listen: false);
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF081411),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) {
        List<Map<String, String>> languages = [
          {"name": "English", "code": "en"},
          {"name": "Arabic", "code": "ar"},
          {"name": "Urdu", "code": "ur"},
          {"name": "Malay", "code": "ms"},
          {"name": "French", "code": "fr"},
        ];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: languages.map((lang) => ListTile(
              title: Text(lang["name"]!, style: const TextStyle(color: Colors.white)),
              trailing: appState.locale.languageCode == lang["code"] 
                  ? const Icon(Icons.check_circle, color: Color(0xFF26A69A)) 
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