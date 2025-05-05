import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/rfp_notifier.dart';
import 'package:flutter/services.dart';

class RfpFormSection extends ConsumerStatefulWidget {
  const RfpFormSection({super.key});

  @override
  @override
  ConsumerState<RfpFormSection> createState() => _RfpFormSectionState();
}

class _RfpFormSectionState extends ConsumerState<RfpFormSection> {
  RangeValues _budgetRange = const RangeValues(5000, 140000);

  double _budget = 54000;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 48.h, horizontal: 24.w),
      child: Center(
        child: Container(
          width: 1200.w,
          padding: EdgeInsets.all(32.w),
          decoration: BoxDecoration(
            color: const Color(0xFFF9F5ED),
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left side
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Submit Your RFP',
                        style: TextStyle(
                          fontFamily: 'Basement Grotesque',
                          fontWeight: FontWeight.w800,
                          fontSize: 36.sp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 32.h),
                      // Project Title
                      _buildLabel('Project Title'),
                      SizedBox(height: 6.h),
                      _buildTextField('Name of the project'),
                      SizedBox(height: 18.h),
                      // Project Description
                      _buildLabel('Project Description'),
                      SizedBox(height: 6.h),
                      _buildTextField('Message', maxLines: 4),
                      SizedBox(height: 18.h),
                      // Budget Range
                      _buildLabel('Budget Range'),
                      SizedBox(height: 8.h),
                      _BudgetRangeWidget(),
                      SizedBox(height: 24.h),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildLabel('Deadline'),
                                SizedBox(height: 8.h),
                                _DeadlineField(),
                              ],
                            ),
                          ),
                          SizedBox(width: 24.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildLabel('Additional Files'),
                                SizedBox(height: 8.h),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF24439B),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32.r),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 18.h),
                                    ),
                                    child: Text(
                                      'ADD +',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 18.h),
                      SizedBox(height: 18.h),
                      // Additional Files
                      // Row(
                      //   children: [
                      //     _buildLabel('Additional Files'),
                      //     SizedBox(width: 24.w),
                      //     ElevatedButton(
                      //       onPressed: () {},
                      //       style: ElevatedButton.styleFrom(
                      //         backgroundColor: const Color(0xFF24439B),
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(32.r),
                      //         ),
                      //         padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
                      //       ),
                      //       child: Text(
                      //         'ADD +',
                      //         style: TextStyle(
                      //           fontFamily: 'Montserrat',
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: 16.sp,
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                // Divider
                Container(
                  width: 1.2.w,
                  height: 700.h,
                  margin: EdgeInsets.symmetric(horizontal: 32.w),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF15A5CD),
                        Color(0x0015A5CD),
                      ],
                    ),
                  ),
                ),
                // Right side
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 46.h),
                      Row(
                        children: [
                          Expanded(child: _buildLabel('Name')),
                          SizedBox(width: 18.w),
                          Expanded(child: _buildLabel('Phone number')),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: _buildTextField('Enter name')),
                          SizedBox(width: 18.w),
                          Expanded(
                            child: Consumer(
                              builder: (context, ref, _) {
                                final rfpState = ref.watch(rfpNotifierProvider);
                                return TextFormField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                  onChanged: (val) => ref.read(rfpNotifierProvider.notifier).setPhone(val),
                                  decoration: InputDecoration(
                                    hintText: 'Phone number',
                                    errorText: rfpState.phone.isNotEmpty && !rfpState.isPhoneValid ? 'Enter a valid 10-digit phone' : null,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32.r),
                                      borderSide: BorderSide(
                                        color: rfpState.phone.isNotEmpty && !rfpState.isPhoneValid ? Colors.red : const Color(0xFFD1D1D1),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32.r),
                                      borderSide: BorderSide(
                                        color: rfpState.phone.isNotEmpty && !rfpState.isPhoneValid ? Colors.red : const Color(0xFFD1D1D1),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32.r),
                                      borderSide: BorderSide(
                                        color: rfpState.phone.isNotEmpty && !rfpState.isPhoneValid ? Colors.red : const Color(0xFF24439B),
                                        width: 2,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 18.h),
                      Row(
                        children: [
                          Expanded(child: _buildLabel('Email ID')),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Consumer(
                              builder: (context, ref, _) {
                                final rfpState = ref.watch(rfpNotifierProvider);
                                return TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (val) => ref.read(rfpNotifierProvider.notifier).setEmail(val),
                                  decoration: InputDecoration(
                                    hintText: 'Enter Email ID',
                                    errorText: rfpState.email.isNotEmpty && !rfpState.isEmailValid ? 'Enter a valid email' : null,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32.r),
                                      borderSide: BorderSide(
                                        color: rfpState.email.isNotEmpty && !rfpState.isEmailValid ? Colors.red : const Color(0xFFD1D1D1),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32.r),
                                      borderSide: BorderSide(
                                        color: rfpState.email.isNotEmpty && !rfpState.isEmailValid ? Colors.red : const Color(0xFFD1D1D1),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32.r),
                                      borderSide: BorderSide(
                                        color: rfpState.email.isNotEmpty && !rfpState.isEmailValid ? Colors.red : const Color(0xFF24439B),
                                        width: 2,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 18.h),
                      Row(
                        children: [
                          Expanded(child: _buildLabel('Message')),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: _buildTextField('Enter message (Optional)')),
                        ],
                      ),
                      SizedBox(height: 106.h),
                      Center(
                        child: SizedBox(
                          // width: 320.w,
                          height: 54.h,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.r),
                              ),
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                            ),
                            
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xFF24439B), Color(0xFF15A5CD)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(32.r),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Create Pricing',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        fontSize: 18.sp,
        color: Colors.black,
      ),
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1}) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          fontSize: 15.sp,
          color: const Color(0xFF636E72),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: maxLines > 1 ? 18.h : 12.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.r),
          borderSide: const BorderSide(color: Color(0xFFD1D1D1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.r),
          borderSide: const BorderSide(color: Color(0xFFD1D1D1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.r),
          borderSide: const BorderSide(color: Color(0xFF24439B), width: 2),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}

class _BudgetRangeWidget extends StatefulWidget {
  @override
  State<_BudgetRangeWidget> createState() => _BudgetRangeWidgetState();
}

class _BudgetRangeWidgetState extends State<_BudgetRangeWidget> {
  RangeValues _range = const RangeValues(5000, 140000);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RangeSlider(
          values: _range,
          min: 5000,
          max: 140000,
          divisions: 27,
          onChanged: (values) {
            setState(() {
              _range = values;
            });
          },
          activeColor: const Color(0xFF25B4DC),
          inactiveColor: const Color(0xFFD1D1D1),
        ),
        SizedBox(height: 6.h),
        Row(
          children: [
            _pillText(_formatCurrency(_range.start)),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Divider(
                  color: const Color(0xFFD1D1D1),
                  thickness: 2,
                ),
              ),
            ),
            _pillText(_formatCurrency(_range.end)),
          ],
        ),
      ],
    );
  }

  Widget _pillText(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
          fontSize: 18.sp,
          color: Colors.black,
        ),
      ),
    );
  }

  String _formatCurrency(double value) {
    // Format as $ 5,000
    return '\$ ' + value.toStringAsFixed(0).replaceAllMapped(
      RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"),
      (Match m) => ",${m[1]}",
    ).replaceFirst(',', '');
  }
}


class _DeadlineField extends StatefulWidget {
  @override
  State<_DeadlineField> createState() => _DeadlineFieldState();
}

class _DeadlineFieldState extends State<_DeadlineField> {
  DateTime? _selectedDate;
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xFF24439B),
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Color(0xFF24439B),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _controller.text = _formatDate(picked);
      });
    }
  }

  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickDate(context),
      child: AbsorbPointer(
        child: TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Mention deadline',
            hintStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              fontSize: 15.sp,
              color: const Color(0xFF636E72),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.r),
              borderSide: const BorderSide(color: Color(0xFF24439B)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.r),
              borderSide: const BorderSide(color: Color(0xFF24439B)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.r),
              borderSide: const BorderSide(color: Color(0xFF24439B), width: 2),
            ),
            fillColor: Colors.white,
            filled: true,
            suffixIcon: Icon(Icons.calendar_today, color: Colors.black, size: 22.w),
          ),
        ),
      ),
    );
  }
}
