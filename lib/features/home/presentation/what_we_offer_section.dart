import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'what_we_offer_section_card.dart';

class WhatWeOfferSection extends StatelessWidget {
  const WhatWeOfferSection({super.key});

  @override
  Widget build(BuildContext context) {
    final offers = [
      {
        'icon': 'assets/icons/membership.png',
        'title': 'Tiered Membership Plans',
        'desc':
            'Choose the plan that fits your needs, from Free access to exclusive Diamond-tier privileges.',
      },
      {
        'icon': 'assets/icons/forum.png',
        'title': 'Interactive Community Forums',
        'desc':
            'Engage in meaningful discussions, share knowledge, and build valuable connections.',
      },
      {
        'icon': 'assets/icons/auction.png',
        'title': 'Powerful Auction System',
        'desc': 'List, bid, and win with our streamlined auction marketplace.',
      },
      {
        'icon': 'assets/icons/rfp.png',
        'title': 'Request For Pricing',
        'desc':
            'Submit a Request for Pricing and connect with experienced professionals ready to meet your needs.',
      },
    ];

    return Container(
      width: double.infinity,
      color: const Color(0xFFEBE6DC),
      padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'What We Offer',
            style: TextStyle(
              fontFamily: 'Basement Grotesque',
              fontWeight: FontWeight.w800,
              fontSize: 40.sp,
              height: 1.35,
              color: const Color(0xFF121212),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 48.h),
          Center(
            child: Wrap(
              spacing: 36.w,
              runSpacing: 32.h,
              alignment: WrapAlignment.center,
              children: offers.map((offer) {
                return OfferCard(
                  icon: offer['icon']!,
                  title: offer['title']!,
                  desc: offer['desc']!,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
