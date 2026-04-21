import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'search_filter_colors.dart';

class FilterPriceSection extends StatelessWidget {
  const FilterPriceSection({
    super.key,
    required this.values,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  final RangeValues values;
  final double min;
  final double max;
  final ValueChanged<RangeValues> onChanged;

  String _formatPrice(double price) => '\$${price.round()}';

  @override
  Widget build(BuildContext context) {
    final SliderThemeData sliderTheme = SliderTheme.of(context).copyWith(
      trackHeight: 2,
      activeTrackColor: SearchFilterColors.black,
      inactiveTrackColor: SearchFilterColors.subtleLine,
      overlayShape: SliderComponentShape.noOverlay,
      rangeThumbShape: const _FilterRangeThumbShape(),
      thumbColor: SearchFilterColors.white,
      rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'PRICE',
          style: GoogleFonts.bebasNeue(
            fontSize: 26,
            fontWeight: FontWeight.w400,
            color: SearchFilterColors.black,
            height: 1,
          ),
        ),
        const SizedBox(height: 18),
        SliderTheme(
          data: sliderTheme,
          child: RangeSlider(
            values: values,
            min: min,
            max: max,
            onChanged: onChanged,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: Row(
            children: <Widget>[
              Text(
                _formatPrice(values.start),
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: SearchFilterColors.lightGray,
                  height: 1,
                ),
              ),
              const Spacer(),
              Text(
                _formatPrice(values.end),
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: SearchFilterColors.lightGray,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FilterRangeThumbShape extends RangeSliderThumbShape {
  const _FilterRangeThumbShape();

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size.square(14);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = false,
    bool isOnTop = false,
    required SliderThemeData sliderTheme,
    TextDirection textDirection = TextDirection.ltr,
    Thumb thumb = Thumb.start,
    bool isPressed = false,
  }) {
    final Canvas canvas = context.canvas;
    final Paint fillPaint = Paint()..color = SearchFilterColors.white;
    final Paint strokePaint = Paint()
      ..color = SearchFilterColors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawCircle(center, 5, fillPaint);
    canvas.drawCircle(center, 5, strokePaint);
  }
}