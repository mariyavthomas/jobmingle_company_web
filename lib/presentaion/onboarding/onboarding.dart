import 'package:floating_text/floating_text.dart';
import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';

class Onboarding extends StatefulWidget {
  Onboarding({super.key});

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation1;
  late Animation<Offset> _animation2;
  late Animation<Offset> _animation3;

  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: Color.fromARGB(255, 113, 144, 255),
      end: const Color.fromARGB(255, 10, 90, 13),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _animation1 = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.33, curve: Curves.easeInOut),
    ));

    _animation2 = Tween<Offset>(
      begin: Offset(1, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.33, 0.66, curve: Curves.easeInOut),
    ));

    _animation3 = Tween<Offset>(
      begin: Offset(1, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.66, 1.0, curve: Curves.easeInOut),
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width1 = MediaQuery.of(context).size.width;
    double height2 = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4.0,
        shadowColor: Colors.black,
       
        title: AnimatedBuilder(
          animation: _colorAnimation,
          builder: (context, child) {
            return FloatingText(
              onAnimationComplete: () {
                print('Floating text animation completed');
              },
              repeat: true,
              repeatCount: 0, // Infinite repeat
              text: 'Job Mingle'.toUpperCase(), // Text to be animated
              duration: Duration(milliseconds: 500), // Duration of one complete cycle
              textStyle: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
              floatingTextStyle: TextStyle(
                color: _colorAnimation.value,
                fontSize: 28,
                shadows: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10,
                  ),
                ],
              ),
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            child: Text('Login'),
          ),
          SizedBox(width: 10),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            child: Text('Register'),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'lib/assets/image/firstpage.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(0, 156, 156, 156), Colors.black.withOpacity(0.6)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Stack(
              children: [
                SlideTransition(
                  position: _animation1,
                  child: Container(
                    width: double.infinity,
                    child: Image.asset(
                      'lib/assets/image/onboading1.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SlideTransition(
                  position: _animation2,
                  child: Container(
                    width: double.infinity,
                    child: Image.asset(
                      'lib/assets/image/onboading7.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SlideTransition(
                  position: _animation3,
                  child: Container(
                    width: double.infinity,
                    child: Image.asset(
                      'lib/assets/image/onpading4.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 50, // Adjust bottom position to suit your layout
              left: 20,
              right: 20,
              child: Container(
                width: width1 * 0.7, // Adjusted width
                padding: EdgeInsets.all(20),
                height: height2 * 0.5, // Increased height
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TypeWriterText(
                        text: Text(
                          "Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work. The only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle. As with all matters of the heart, you'll know when you find it.-Steve Jobs”",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18, // Adjust font size as needed
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        duration: const Duration(milliseconds: 50),
                        repeat: true, // Repeat the typing animation
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
