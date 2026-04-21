import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CouponSection extends StatefulWidget {
  const CouponSection({
    super.key,
    required this.couponInput,
    required this.placeholder,
    required this.applyLabel,
    required this.isApplying,
    this.appliedCouponCode,
    required this.onCouponChanged,
    required this.onApply,
  });

  final String couponInput;
  final String placeholder;
  final String applyLabel;
  final bool isApplying;
  final String? appliedCouponCode;
  final ValueChanged<String> onCouponChanged;
  final VoidCallback onApply;

  @override
  State<CouponSection> createState() => _CouponSectionState();
}

class _CouponSectionState extends State<CouponSection> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.couponInput);
  }

  @override
  void didUpdateWidget(covariant CouponSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.couponInput == _controller.text) {
      return;
    }

    _controller.value = _controller.value.copyWith(
      text: widget.couponInput,
      selection: TextSelection.collapsed(offset: widget.couponInput.length),
      composing: TextRange.empty,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _controller,
                  onChanged: widget.onCouponChanged,
                  textInputAction: TextInputAction.done,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF000000),
                  ),
                  decoration: InputDecoration(
                    hintText: widget.placeholder,
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFFCFCFCF),
                    ),
                    isDense: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              TextButton(
                onPressed: widget.isApplying ? null : widget.onApply,
                child: widget.isApplying
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(
                        widget.applyLabel,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF000000),
                        ),
                      ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: Color(0xFFE9E9E9), height: 1),
          if (widget.appliedCouponCode != null) ...<Widget>[
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Applied: ${widget.appliedCouponCode}',
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF2E7D32),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
