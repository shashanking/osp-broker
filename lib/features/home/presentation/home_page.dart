import 'package:flutter/material.dart';
import 'package:osp_broker/core/theme/app_colors.dart';
import 'package:osp_broker/core/theme/app_text_styles.dart';
import 'package:osp_broker/features/home/presentation/about_us_section.dart';
import 'package:osp_broker/features/home/presentation/explore_section.dart';
import 'package:osp_broker/features/home/presentation/footer_section.dart';
import 'package:osp_broker/features/home/presentation/featured_section.dart';
import './rfp_section.dart';
import 'package:osp_broker/features/home/presentation/what_we_offer_section.dart';
import 'package:osp_broker/features/home/presentation/membership_page.dart';
import 'package:osp_broker/features/home/presentation/testimonial_section.dart';
import 'package:video_player/video_player.dart';
import 'hero_section_visibility_wrapper.dart';
import 'widgets/navbar.dart';
import 'auction_sections.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late ScrollController _scrollController;
  Color _navBarBgColor = Colors.transparent;
  late VideoPlayerController _controller;
  late AnimationController _gradientController;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _controller = VideoPlayerController.asset('assets/landing-banner.mp4')
      ..initialize().then((_) {
        setState(() {
          _initialized = true;
          _controller.setLooping(true);
          _controller.setVolume(0);
          _controller.play();
        });
      });
    _gradientController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  void _onScroll() {
    if (_scrollController.offset > 20 && _navBarBgColor != AppColors.light) {
      setState(() {
        _navBarBgColor = AppColors.light;
      });
    } else if (_scrollController.offset <= 20 &&
        _navBarBgColor != Colors.transparent) {
      setState(() {
        _navBarBgColor = Colors.transparent;
      });
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _initialized) {
      // Resume video playback when app returns to foreground
      if (!_controller.value.isPlaying) {
        _controller.play();
      }
    } else if (state == AppLifecycleState.paused && _initialized) {
      // Optionally pause video when app is backgrounded
      if (_controller.value.isPlaying) {
        _controller.play();
      }
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // When dependencies change (e.g., scroll back to HeroSection), try to resume video
    if (_initialized && !_controller.value.isPlaying) {
      _controller.play();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
    _controller.dispose();
    _gradientController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      extendBodyBehindAppBar: true,
      appBar: AppNavBar(bgColor: _navBarBgColor),
      body: ListView(
        controller: _scrollController,
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: HeroSectionVisibilityWrapper(
              onVisible: () {
                if (_initialized && !_controller.value.isPlaying) {
                  _controller.play();
                }
              },
              onInvisible: () {
                if (_initialized && _controller.value.isPlaying) {
                  _controller.pause();
                }
              },
              child: HeroSection(
                controller: _controller,
                gradientController: _gradientController,
                initialized: _initialized,
              ),
            ),
          ),
          SizedBox(
            child: const AuctionsSection(),
          ),
          SizedBox(
            child: const AboutUsSection(),
          ),
          SizedBox(
            child: const WhatWeOfferSection(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: const RFPSection(),
          ),
          SizedBox(
            child: const MembershipSection(),
          ),
          SizedBox(
            child: const FeaturedSection(),
          ),

          SizedBox(
            child: const TestimonialSection(),
          ),
          // explore section
          SizedBox(
            child: const ExploreSection(),
          ),
          SizedBox(
            child: const FooterSection(),
          ),
          // footer
          SizedBox(
            child: const SizedBox(),
          ),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  final VideoPlayerController controller;
  final AnimationController gradientController;
  final bool initialized;

  const HeroSection({
    required this.controller,
    required this.gradientController,
    required this.initialized,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      key: const Key('hero-section'),
      children: [
        // Background Video or fallback image

        Positioned.fill(
          child: initialized
              ? FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: controller.value.size.width,
                    height: controller.value.size.height,
                    child: VideoPlayer(controller),
                  ),
                )
              : Image.asset(
                  'assets/images/0_Hero.png',
                  fit: BoxFit.cover,
                  width: width,
                  height: height,
                ),
        ),
        // Left-to-right gradient overlay
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFFEBE6DC),
                  Color(0x00EBE6DC), // transparent
                ],
              ),
            ),
          ),
        ),
        // Main content (left aligned)
        Positioned(
          left: 140,
          top: 142,
          child: SizedBox(
            width: 692,
            height: 887,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome pill
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF24439B), Color(0xFF0A72B3)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow,
                        offset: const Offset(3, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Text(
                    'Welcome to OSP BROKERS',
                    style: AppTextStyles.welcomePill,
                  ),
                ),
                const SizedBox(height: 32),
                // Headline
                AnimatedBuilder(
                  animation: gradientController,
                  builder: (context, child) {
                    final List<Color> colors = [
                      Color.lerp(AppColors.heroGradientStart,
                          AppColors.heroGradientEnd, gradientController.value)!,
                      Color.lerp(
                          AppColors.heroGradientEnd,
                          AppColors.heroGradientStart,
                          gradientController.value)!,
                    ];
                    return RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Discover, Bid, and Win – All in One\n',
                            style: AppTextStyles.heroHeadline,
                          ),
                          TextSpan(
                            text: 'Dynamic Platform',
                            style: TextStyle(
                              fontFamily: 'Basement Grotesque',
                              fontWeight: FontWeight.w800,
                              fontSize: 64,
                              height: 1.2,
                              foreground: Paint()
                                ..shader = LinearGradient(
                                  colors: colors,
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ).createShader(
                                    const Rect.fromLTWH(0, 0, 644, 77)),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                // Subtitle
                Text(
                  'Join a vibrant community where exclusive auctions, real-time bidding, and expert forums come together to create unmatched opportunities for buyers, sellers, and businesses.',
                  style: AppTextStyles.heroSubtitle,
                ),
                const SizedBox(height: 16),
                // Trust Pilot
                Text(
                  'Great ⭐ 4.2/5 Trust Pilot Review',
                  style: AppTextStyles.heroSubtitle,
                ),
                const SizedBox(height: 24),
                // Buttons Row (Auctions & Forums)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _HeroButton(
                      label: 'Auctions',
                      background: AppColors.primary,
                      onTap: () {},
                    ),
                    const SizedBox(width: 32),
                    _HeroButton(
                      label: 'Forums',
                      background: AppColors.secondary,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // RFP Button (full width, below)
                _HeroButton(
                  label: 'RFP',
                  background: AppColors.dark,
                  width: 472, // full width of the content box
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _HeroButton extends StatelessWidget {
  final String label;
  final Color background;
  final double width;
  final VoidCallback onTap;
  const _HeroButton({
    required this.label,
    required this.background,
    required this.onTap,
    this.width = 220,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(50),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: AppTextStyles.heroButton,
        ),
      ),
    );
  }
}
