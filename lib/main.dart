import 'package:dartbyte_app/widgets/collections.dart';
import 'package:dartbyte_app/widgets/featured.dart';
import 'package:dartbyte_app/widgets/navbar.dart';
import 'package:dartbyte_app/widgets/quick_bytes.dart';
import 'package:dartbyte_app/widgets/recommended.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dartbyte App',
      theme: ThemeData.dark(),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        return _buildWebLayout(screenSize);
      } else {
        return _buildOtherLayout(screenSize);
      }
    });
  }

  Widget _buildWebLayout(Size screenSize) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left sidebar
          NavigationSidebar(),
          // Main content area
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // interpolate the screen width
                    const Text(
                      "Welcome to Dartbyte",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    QuickByteButton(),
                    const SizedBox(height: 24),
                    const Text(
                      'Recommended For You',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    RecommendedGuidesGrid(),
                    const SizedBox(height: 24),
                    const Text(
                      'Browse by Collection',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    CollectionChips(),
                    const SizedBox(height: 24),
                    const Text(
                      'Featured Guides',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    FeaturedGuidesGrid(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOtherLayout(Size screensize) {
    return const Scaffold(
      body: Center(
        child: Text('To be created by the reader 🛠️'),
      ),
    );
  }
}
