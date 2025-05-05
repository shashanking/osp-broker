import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/auth_notifier.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    return Scaffold(
      backgroundColor: const Color(0xFFEBE6DC),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1600, maxHeight: 1000),
          margin: EdgeInsets.symmetric(vertical: 40.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: const Color(0xFFEBE6DC),
            borderRadius: BorderRadius.circular(24.r),
          ),
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              // Left Image & Overlay
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
                            'Lorem ipsum',
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
              // Right Signup Form

              Expanded(
                flex: 7,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 36.w, vertical: 48.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create an account',
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
                          _RoleToggleButton(
                              selected: false,
                              label: 'Business + Representative'),
                        ],
                      ),
                      SizedBox(height: 32.h),
                      // Form fields
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                          // color: const Color(0xFFF5EFE6),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Enter details',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Full Name',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.sp)),
                                      SizedBox(height: 6.h),
                                      _SignupTextField(
                                        hint: 'First Name',
                                        label: '',
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Email',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.sp)),
                                      SizedBox(height: 6.h),
                                      _SignupTextField(
                                        hint: 'Enter Email ID',
                                        label: 'Email',
                                        onChanged: (value) =>
                                            ref.read(authNotifierProvider.notifier).setEmail(value),
                                        errorText: authState.email.isNotEmpty &&
                                                !authState.isEmailValid
                                            ? 'Invalid email (must be @... and .com)'
                                            : null,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 14.h),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Phone Number',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.sp)),
                                      SizedBox(height: 6.h),
                                      _SignupTextField(
                                        hint: 'Enter Phone Number',
                                        label: 'Phone',
                                        onChanged: (value) =>
                                            ref.read(authNotifierProvider.notifier).setPhone(value),
                                        errorText: authState.phone.isNotEmpty &&
                                                !authState.isPhoneValid
                                            ? 'Phone must be 10 digits'
                                            : null,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Password',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.sp)),
                                      SizedBox(height: 6.h),
                                      _SignupTextField(
                                        hint: 'Enter Password',
                                        label: 'Password',
                                        isPassword: true,
                                        onChanged: (value) =>
                                            ref.read(authNotifierProvider.notifier).setPassword(value),
                                        errorText: authState.password.isNotEmpty &&
                                                !authState.isPasswordValid
                                            ? 'Passwords do not match'
                                            : null,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 14.h),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Confirm Password',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.sp)),
                                      SizedBox(height: 6.h),
                                      _SignupTextField(
                                        hint: 'Confirm Password',
                                        label: 'Confirm Password',
                                        isPassword: true,
                                        onChanged: (value) =>
                                            ref.read(authNotifierProvider.notifier).setConfirmPassword(value),
                                        errorText: authState.confirmPassword.isNotEmpty &&
                                                !authState.isPasswordValid
                                            ? 'Passwords do not match'
                                            : null,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Date of Birth',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.sp)),
                                      SizedBox(height: 6.h),
                                      _SignupTextField(
                                        hint: 'Enter Date of Birth',
                                        label: 'Date of Birth',
                                        isDate: true,
                                      ),
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
                              backgroundColor:
                                  const Color.fromRGBO(36, 67, 155, 1),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(56.r),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Sign Up',
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
                            'Already have an account?',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Login',
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
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text(
                              'Or login with',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(height: 32),

                      SizedBox(height: 12),

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
        color: selected ? const Color(0xFF333333) : const Color(0xFFEBE6DC),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: selected ? const Color(0xFF333333) : const Color(0xFFD9D9D9),
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

class _SignupTextField extends StatefulWidget {
  final String hint;
  final String label;
  final bool isPassword;
  final bool isDate;
  final void Function(String)? onChanged;
  final String? errorText;
  const _SignupTextField({
    required this.hint,
    required this.label,
    this.isPassword = false,
    this.isDate = false,
    this.onChanged,
    this.errorText,
    Key? key,
  }) : super(key: key);

  @override
  State<_SignupTextField> createState() => _SignupTextFieldState();
}

class _SignupTextFieldState extends State<_SignupTextField> {
  late bool _obscureText;
  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
    if (widget.isDate) {
      _controller = TextEditingController();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.isDate ? _controller : null,
      obscureText: widget.isPassword ? _obscureText : false,
      readOnly: widget.isDate,
      keyboardType: widget.isDate
          ? TextInputType.none
          : widget.label.toLowerCase().contains('phone')
              ? TextInputType.number
              : TextInputType.text,
      inputFormatters: widget.label.toLowerCase().contains('phone')
          ? [FilteringTextInputFormatter.digitsOnly]
          : null,
      decoration: InputDecoration(
        hintText: widget.hint,
        filled: true,
        fillColor: const Color(0xFFEBE6DC),
        errorText: widget.errorText,
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
            : widget.isDate
                ? IconButton(
                    icon: Icon(Icons.calendar_today_outlined, size: 20.sp),
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000, 1, 1),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        _controller?.text = "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
                      }
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
      onTap: widget.isDate
          ? () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: DateTime(2000, 1, 1),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (picked != null) {
                _controller?.text = "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
              }
            }
          : null,
      onChanged: widget.onChanged,
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
      height: 56.h,
      width: 230.w,
      decoration: BoxDecoration(
        color:const Color(0xFFEBE6DC),
        borderRadius: BorderRadius.circular(56.r),
        border: Border.all(color: const Color.fromARGB(255, 189, 189, 189)),
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
