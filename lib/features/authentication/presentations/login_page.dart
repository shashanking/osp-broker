import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBE6DC),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1600, maxHeight: 1000),
          margin: EdgeInsets.symmetric(vertical: 40.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.r),
          ),
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              // Left Image & Overlay (reuse from SignupPage)
              Expanded(
                flex: 5,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 1200),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24.r),
                          child: Image.asset(
                            'assets/images/user_login_hero_img.png',
                            fit: BoxFit.cover,
                            height: 1000.h,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(96, 126, 194, 243),
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(32.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/osp-logo.png',
                            height: 40.h,
                          ),
                          const Spacer(),
                          Text(
                            'Login to your account',
                            style: TextStyle(
                              fontFamily: 'Basement Grotesque',
                              fontWeight: FontWeight.w800,
                              fontSize: 32.sp,
                              color: Colors.white,
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ac lectus nec enim tempor suscipit.',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Right Login Form
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 48.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login to your account',
                        style: TextStyle(
                          fontFamily: 'Basement Grotesque',
                          fontWeight: FontWeight.w800,
                          fontSize: 40.sp,
                          height: 1.0,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ac lectus nec enim tempor suscipit.',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      // User/Business Toggle
                      Row(
                        children: [
                          _RoleToggleButton(selected: true, label: 'User'),
                          SizedBox(width: 8.w),
                          _RoleToggleButton(selected: false, label: 'Business + Representative'),
                        ],
                      ),
                      SizedBox(height: 32.h),
                      // Form fields (email & password only)
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Enter details',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Montserrat',
                                fontSize: 18.sp,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Email', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp)),
                                      SizedBox(height: 6.h),
                                      _LoginTextField(hint: 'Enter Email ID', isPassword: false),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Password', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp)),
                                      SizedBox(height: 6.h),
                                      _LoginTextField(hint: 'Enter Password', isPassword: true),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 250,
                          height: 48.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(36, 67, 155, 1),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Sgn Up',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: const Color.fromRGBO(36, 67, 155, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32),
                      Divider(),
                      SizedBox(height: 12),
                      Center(
                        child: Text(
                          'Or login with',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xFF333333),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _SocialLoginButton(
                            icon: 'assets/icons/logo_google.png',
                            label: 'Google',
                            backgroundColor: Colors.white,
                            textColor: const Color(0xFF333333),
                            borderColor: const Color(0xFFE0E0E0),
                          ),
                          _SocialLoginButton(
                            icon: 'assets/icons/logo_apple.png',
                            label: 'Apple',
                            backgroundColor: Colors.white,
                            textColor: const Color(0xFF333333),
                            borderColor: const Color(0xFFE0E0E0),
                          ),
                          _SocialLoginButton(
                            icon: 'assets/icons/logo_facebook.png',
                            label: 'Facebook',
                            backgroundColor: Colors.white,
                            textColor: const Color.fromRGBO(0, 109, 223, 1),
                            borderColor: const Color(0xFFE0E0E0),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleToggleButton extends StatelessWidget {
  final bool selected;
  final String label;
  const _RoleToggleButton({required this.selected, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF242B9B) : Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: selected ? const Color(0xFF242B9B) : const Color(0xFFE0E0E0),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
          color: selected ? Colors.white : const Color(0xFF333333),
        ),
      ),
    );
  }
}

class _LoginTextField extends StatefulWidget {
  final String hint;
  final bool isPassword;
  const _LoginTextField({required this.hint, this.isPassword = false, Key? key}) : super(key: key);

  @override
  State<_LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<_LoginTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        hintText: widget.hint,
        filled: true,
        fillColor: const Color.fromARGB(255, 255, 255, 255),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  size: 20.sp,
                  color: _obscureText ? Colors.black : Colors.blue,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: const BorderSide(color: Color(0xFFD9D9D9), width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: const BorderSide(color: Color(0xFFD9D9D9), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: const BorderSide(color: Color(0xFF242B9B), width: 1.5),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      ),
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
      ),
    );
  }
}

class _SocialLoginButton extends StatelessWidget {
  final String icon;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  const _SocialLoginButton({
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 120.w,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon, height: 24.h),
          SizedBox(width: 8.w),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
