import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../app_theme.dart';
import '../../controllers/home_controller.dart';
import '../widgets/daily_verse_card.dart';
import '../widgets/live_session_card.dart';
import '../widgets/notification_card.dart';
import '../widgets/wog_bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Connection: Connect UI to HomeController (UI receives data, calls Controller actions)
    return Consumer<HomeController>(
      builder: (context, controller, child) {
        return Scaffold(
          // Header implementation based on image
          appBar: AppBar(
            backgroundColor: AppTheme.backgroundColor,
            scrolledUnderElevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.white, size: 28),
              onPressed: () {
                // Future Drawer action
              },
            ),
            title: null, // Title is handled as an action on the right
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  "WOG",
                  style: GoogleFonts.marcellus( // Closest classic serif style
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Daily Verse Section (Connects to controller data)
                  DailyVerseCard(
                    verse: controller.dailyVerseText,
                    reference: controller.dailyVerseReference,
                  ),
                  const SizedBox(height: 16),
                  
                  // Notifications Section (Connects to controller data)
                  NotificationCard(
                    message: controller.notificationText,
                  ),
                  const SizedBox(height: 16),
                  
                  // Live Session Section (Connects to controller data and action)
                  LiveSessionCard(
                    isLive: controller.isLive,
                    title: controller.liveTitle,
                    description: controller.liveDescription,
                    onTapConnect: controller.connectToJitsi,
                  ),
                  
                  // Bottom padding for scrollability above nav
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
          
          // Separate Bottom Nav component
          bottomNavigationBar: WogBottomNavigation(
            currentIndex: controller.currentNavIndex,
            onTap: (index) => controller.setNavIndex(index),
          ),
        );
      },
    );
  }
}
