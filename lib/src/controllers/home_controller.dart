import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  // Static data based on UI image for now. 
  // Future Firebase connection logic will update these fields.
  
  // 1. Daily Verse Data
  final String dailyVerseText = "యెహోవా నా కాపరి";
  final String dailyVerseReference = "- కీర్తనలు 1:1";

  // 2. Notification Data
  final String notificationText = "ఈరోజు లైవ్ లో ప్రార్థనలు జరుగుతాయి.";

  // 3. Live Session Data
  bool isLive = true;
  final String liveTitle = "Evening Fellowship & Prayer";
  final String liveDescription = "Join our daily live session with the community. Connect directly via Jitsi.";

  // 4. Navigation State
  int _currentNavIndex = 2; // Home is index 2 (middle)
  int get currentNavIndex => _currentNavIndex;

  void setNavIndex(int index) {
    _currentNavIndex = index;
    notifyListeners();
  }

  // Placeholder action for Jitsi connection (will call Firebase/Api later)
  void connectToJitsi() {
    // UI just calls this. Logic here is separated.
    debugPrint("Connecting to Jitsi...");
  }
}
