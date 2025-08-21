import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/ee.jpg', fit: BoxFit.cover),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(24),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/wareef.jpg', height: 200),
                    const SizedBox(height: 20),
                    const Text(
                      'مرحبًا بك في أكاديمية وريف',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 81, 53, 2),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('وريف العطاء'),
                    const SizedBox(height: 30),
                    const SocialIcons(),
                    const SizedBox(height: 30),
                    AuthButton(
                      label: 'تسجيل الدخول',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      ),
                    ),
                    const SizedBox(height: 10),
                    AuthButton(
                      label: 'إنشاء حساب',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignupScreen()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(
            Icons.camera_alt,
            color: Color.fromARGB(196, 105, 137, 3),
          ),
          onPressed: () =>
              _launchURL('https://www.instagram.com/wareef_academy/'),
        ),
        IconButton(
          icon: const Icon(
            Icons.facebook,
            color: Color.fromARGB(196, 105, 137, 3),
          ),
          onPressed: () => _launchURL(
            'https://www.facebook.com/WareefAcademy/?locale=ar_AR',
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.phone,
            color: Color.fromARGB(196, 105, 137, 3),
          ),
          onPressed: () => _launchURL('https://wa.me/967775117639'),
        ),
      ],
    );
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'ما قدرنا نفتح الرابط: $url';
    }
  }
}

class AuthButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const AuthButton({required this.label, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 105, 135, 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }
}
