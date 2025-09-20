import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _onboardingData = [
    OnboardingData(
      image: 'assets/onb1.png',
      title: 'Purchase Online !!',
      subtitle: 'Discover products to purchase',
      useWhiteLogos: true,
    ),
    OnboardingData(
      image: 'assets/onb2.png',
      title: 'Track order !!',
      subtitle: 'Purchase desired products',
      useWhiteLogos: false,
    ),
    OnboardingData(
      image: 'assets/onb3.png',
      title: 'Get your order !!',
      subtitle: 'Get your products delivered',
      useWhiteLogos: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // PageView for swipeable screens
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _onboardingData.length,
            itemBuilder: (context, index) {
              return _buildOnboardingPage(_onboardingData[index]);
            },
          ),
          // Page indicators
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _onboardingData.length,
                    (index) => _buildPageIndicator(index),
              ),
            ),
          ),
          // Back button (only show if not on first page)
          if (_currentPage > 0)
            Positioned(
              top: 50,
              left: 20,
              child: SafeArea(
                child: GestureDetector(
                  onTap: () {
                    if (_currentPage > 0) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          // Skip/Done button
          Positioned(
            bottom: 30,
            right: 30,
            child: GestureDetector(
              onTap: () {
                if (_currentPage == _onboardingData.length - 1) {
                  // Navigate to main app or home screen
                  Navigator.pop(context); // For now, just go back
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _currentPage == _onboardingData.length - 1 ? 'Done' : 'Skip',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingPage(OnboardingData data) {
    return Stack(
      children: [
        // Background image for top curved section
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background3.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // White bottom section
        Positioned(
          top: MediaQuery.of(context).size.height * 0.32,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
          ),
        ),
        // Content
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              const SizedBox(height: 80),
              // Logo section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo3.png', // Always use white logo for top section
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/logo1.png', // Always use white text for top section
                    height: 50,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              // Subtitle
              Text(
                data.subtitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 60),
              // Main illustration - positioned in white section
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40), // Push image into white section
                    Image.asset(
                      data.image,
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 40),
                    // Title - in black since it's on white background
                    Text(
                      data.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPageIndicator(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index
            ? Colors.blue
            : Colors.grey.withOpacity(0.5),
      ),
    );
  }
}

class OnboardingData {
  final String image;
  final String title;
  final String subtitle;
  final bool useWhiteLogos;

  OnboardingData({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.useWhiteLogos,
  });
}

class CurvedBackgroundPainter extends CustomPainter {
  final Color color;
  final bool isReversed;

  CurvedBackgroundPainter({required this.color, this.isReversed = false});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();

    if (isReversed) {
      // For screens 1 and 3 - curved at bottom
      path.moveTo(0, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height * 0.6);
      path.quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.8,
        0,
        size.height * 0.6,
      );
      path.close();
    } else {
      // For screen 2 - curved at top
      path.moveTo(0, size.height * 0.4);
      path.quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.2,
        size.width,
        size.height * 0.4,
      );
      path.lineTo(size.width, 0);
      path.lineTo(0, 0);
      path.close();
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}