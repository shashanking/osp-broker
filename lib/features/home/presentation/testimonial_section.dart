import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestimonialSection extends StatefulWidget {
  const TestimonialSection({super.key});

  @override
  State<TestimonialSection> createState() => _TestimonialSectionState();
}

class _TestimonialSectionState extends State<TestimonialSection> {
  int currentIndex = 0;
  late final PageController _pageController;
  final List<Map<String, dynamic>> testimonials = [
    {
      'name': 'Angela White',
      'image': 'assets/images/testimonial-img.png',
      'text':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vitae sapien bibendum, consequat ante nec, iaculis augue. Mauris facilisis scelerisque metus a feugiat. Ut id nisl eget magna sodales dapibus. Nullam posuere iaculis lacinia.',
      'rating': 5,
    },
    {
      'name': 'David Smith',
      'image': 'assets/images/testimonial-img.png',
      'text':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vitae sapien bibendum, consequat ante nec, iaculis augue. Mauris facilisis scelerisque metus a feugiat. Ut id nisl eget magna sodales dapibus. Nullam posuere iaculis lacinia.',
      'rating': 5,
    },
    {
      'name': 'Sam Altman',
      'image': 'assets/images/testimonial-img.png',
      'text':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vitae sapien bibendum, consequat ante nec, iaculis augue. Mauris facilisis scelerisque metus a feugiat. Ut id nisl eget magna sodales dapibus. Nullam posuere iaculis lacinia.',
      'rating': 5,
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(viewportFraction: 0.35, initialPage: currentIndex);
  }

  void _prev() {
    if (currentIndex > 0) {
      setState(() => currentIndex--);
      _pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
    }
  }

  void _next() {
    if (currentIndex < testimonials.length - 1) {
      setState(() => currentIndex++);
      _pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1080.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/testimonial-bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Right blue gradient + image background
          Positioned(
            right: -0.1.sw,
            top: (1080.h - 600.h) / 2,
            child: Image.asset(
              'assets/images/testimonial-right-bg.png',
              scale: 2,
              height: 600.h,
              fit: BoxFit.contain,
              width: 1.sw * 0.54,
            ),
          ),
          // Testimonial cards
          Positioned(
            left: 0.44.sw,
            top: (1080.h - 402.h) / 2,
            child: SizedBox(
              width: 3 * 440.w + 2 * 48.w,
              height: 402.h,
              child: PageView.builder(
                controller: _pageController,
                itemCount: testimonials.length,
                onPageChanged: (i) {
                  setState(() => currentIndex = i);
                },
                itemBuilder: (context, i) {
                  double pageOffset = 0;
                  if (_pageController.hasClients &&
                      _pageController.page != null) {
                    pageOffset = (_pageController.page! - i).abs();
                  } else {
                    pageOffset = (currentIndex - i).abs().toDouble();
                  }
                  // Highlight center card: scale up, border, shadow. Side cards: fade and shrink.
                  final isCenter = (i == currentIndex);
                  final isLeft = (i == currentIndex - 1);
                  final scale =
                      1.0 + (isCenter ? 0.08 : -0.08 * pageOffset.clamp(0, 1));
                  final opacity = isCenter
                      ? 1.0
                      : isLeft
                          ? 1.0
                          : (1 - (pageOffset * 0.8)).clamp(0.22, 0.7);
                  final borderColor =
                      isCenter ? Colors.transparent : Colors.transparent;
                  final boxShadow = isCenter
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.30),
                            blurRadius: 12.r,
                            offset: Offset(0, 6),
                          )
                        ]
                      : [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.13),
                            blurRadius: 4.r,
                          )
                        ];
                  return Opacity(
                      opacity: opacity,
                      child: Transform.scale(
                        scale: scale,
                        child: Container(
                          width: 440.w,
                          height: 372.h,
                          margin: EdgeInsets.symmetric(horizontal: 24.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(
                                color: borderColor,
                                width: isCenter ? 3.2 : 1.2),
                            boxShadow: boxShadow,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(24.r),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.r),
                                      child: Image.asset(
                                        testimonials[i]['image'],
                                        width: 90.w,
                                        height: 90.w,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 20.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          testimonials[i]['name'],
                                          style: TextStyle(
                                            fontFamily: 'Basement Grotesque',
                                            fontWeight: FontWeight.w800,
                                            fontSize: 20.sp,
                                            color: const Color(0xFF2D3436),
                                          ),
                                        ),
                                        SizedBox(height: 8.h),
                                        Row(
                                          children: List.generate(
                                              5,
                                              (star) => Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 2.w),
                                                    child: Icon(Icons.star,
                                                        color:
                                                            Color(0xFFEBB428),
                                                        size: 24.w),
                                                  )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 24.h),
                                Text(
                                  testimonials[i]['text'],
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20.sp,
                                    height: 1.5,
                                    color: Color(0xFF636E72),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ));
                },
              ),
            ),
          ),
          // Left: Text and arrows
          Positioned(
            left: 0.0729.sw,
            top: (1080.h - 342.h) / 2,
            child: SizedBox(
              width: 533.w,
              height: 342.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 230.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'What Our ',
                                style: TextStyle(
                                  fontFamily: 'Basement Grotesque',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 40.sp,
                                  color: Color(0xFF121212),
                                ),
                              ),
                              TextSpan(
                                text: 'Happy\nCustomers ',
                                style: TextStyle(
                                  fontFamily: 'Basement Grotesque',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 40.sp,
                                  color: Color(0xFFD49823),
                                ),
                              ),
                              TextSpan(
                                text: 'Say!',
                                style: TextStyle(
                                  fontFamily: 'Basement Grotesque',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 40.sp,
                                  color: Color(0xFF121212),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Text(
                          'Real stories from buyers and sellers who found their perfect car with us. See why thousands trust our marketplace for their automotive needs!',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            fontSize: 20.sp,
                            color: Color(0xFF333333),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 60.h),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: _prev,
                        child: Container(
                          width: 52.w,
                          height: 52.w,
                          decoration: BoxDecoration(
                            color: Color(0xFF24439B),
                            borderRadius: BorderRadius.circular(43.r),
                          ),
                          child: Transform.rotate(
                            angle: 0,
                            child: Image.asset(
                                'assets/icons/arrow-circle-left.png',
                                width: 24.w,
                                height: 24.w),
                          ),
                        ),
                      ),
                      SizedBox(width: 32.w),
                      GestureDetector(
                        onTap: _next,
                        child: Container(
                          width: 52.w,
                          height: 52.w,
                          decoration: BoxDecoration(
                            color: Color(0xFF24439B),
                            borderRadius: BorderRadius.circular(43.r),
                          ),
                          child: Transform.rotate(
                            angle: 180 * 3.1415926535 / 180,
                            child: Image.asset(
                                'assets/icons/arrow-circle-left.png',
                                width: 24.w,
                                height: 24.w),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
