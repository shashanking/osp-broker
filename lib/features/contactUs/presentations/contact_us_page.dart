import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osp_broker/core/widgets/footer_section.dart';
import '../../../core/widgets/navbar.dart';
import 'contact_us_section.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFEBE6DC),
            Color(0xFFEBE6DC),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AppNavBar(),
              const SizedBox(height: 60),
              // Hero Image Section

              LayoutBuilder(
                builder: (context, constraints) {
                  final double maxWidth =
                      constraints.maxWidth >= 1600 ? 1600 : 1200;
                  final double maxHeight =
                      constraints.maxWidth >= 1200 ? 700 : 450;
                  return Center(
                    child: Container(
                      width: maxWidth,
                      height: maxHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/images/contact_us_heroimg.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(28)),
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Color(0xFF000000),
                              Color(0x00000000),
                            ],
                            stops: [0.0, 1.0],
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Contact Us',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 48,
                              shadows: [
                                Shadow(
                                  color: Colors.black54,
                                  offset: Offset(2, 2),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 80),
              // Contact Form Section
              const ContactUsSection(),
              const FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
