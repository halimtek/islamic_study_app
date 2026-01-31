import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../providers/app_state_provider.dart';

class ProfileUtils {
  // 1. Logic for picking the image
  static Future<void> handleImageSelection(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final appState = Provider.of<AppStateProvider>(context, listen: false);

    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        // FIX: Resize the image to a reasonable size for a profile picture
        maxWidth: 512,
        maxHeight: 512,
        // FIX: Compress the file to reduce memory usage
        imageQuality: 75,
      );

      if (pickedFile != null) {
        appState.updateImage(File(pickedFile.path));
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
      // Optional: Show a snackbar to the user
    }
  }

  // 2. Logic for showing the Bottom Sheet
  static void showEditSheet(BuildContext context) {
    final appState = Provider.of<AppStateProvider>(context, listen: false);
    final TextEditingController nameController = TextEditingController(
      text: appState.userName,
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF081411),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 40,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Consumer<AppStateProvider>(
                    builder: (context, state, child) {
                      return CircleAvatar(
                        radius: 50,
                        backgroundImage: state.imageFile != null
                            ? FileImage(state.imageFile!) as ImageProvider
                            : const AssetImage('assets/profile_picture.jpg'),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        // FIXED: Calling the static method correctly
                        ProfileUtils.handleImageSelection(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Color(0xFF26A69A),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              TextField(
                controller: nameController,
                onChanged: (v) => appState.updateName(v),
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: "Display Name",
                  labelStyle: TextStyle(color: Color(0xFF26A69A)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white24),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        );
      },
    );
  }
}
