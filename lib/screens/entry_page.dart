import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state_provider.dart';
import '../l10n/app_strings.dart'; // The dictionary we created
import 'bottomNav/main_screen.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppStateProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF081411),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.mosque, size: 100, color: Color(0xFF26A69A)),
              const SizedBox(height: 20),
              
              // This text now changes INSTANTLY when you tap a language
              Text(
                AppStrings.of(context, 'welcome'),
                style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
              ),
              
              const SizedBox(height: 40),
              
              // Language Selection Buttons
              _langButton(context, "English", "en", appState),
              const SizedBox(height: 15),
              _langButton(context, "العربية", "ar", appState),
              const SizedBox(height: 15),
              _langButton(context, "اردو", "ur", appState),
              
              const SizedBox(height: 50),
              
              // GET STARTED button also translates instantly
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF26A69A),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MainScreen()),
                    );
                  },
                  child: Text(
                    AppStrings.of(context, 'start_quiz').toUpperCase(),
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _langButton(BuildContext context, String label, String code, AppStateProvider provider) {
    bool isSelected = provider.locale.languageCode == code;
    
    return GestureDetector(
      onTap: () {
        // THIS IS THE KEY: We tell the provider to change the language code
        provider.setLocale(code); 
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: isSelected ? const Color(0xFF26A69A) : Colors.white24, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
            if (isSelected) const Icon(Icons.check_circle, color: Color(0xFF26A69A)),
          ],
        ),
      ),
    );
  }
}