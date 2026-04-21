import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LocationMapSection extends StatelessWidget {
  const LocationMapSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose Location',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF000000),
              height: 1,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 14),

          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: double.infinity,
              height: 180,
              child: Stack(
                children: [
                  // Static map image as placeholder
                  Image.network(
                    'https://api.mapbox.com/styles/v1/mapbox/light-v11/static/-118.2437,34.0522,13,0/600x360?access_token=pk.placeholder',
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 180,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0EDE8),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: CustomPaint(
                          painter: _MapPlaceholderPainter(),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: const Color(0xFFFF6A2B),
                                  size: 36,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'Tap to choose location',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF666666),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 18),
                      child: Icon(
                        Icons.location_on,
                        color: const Color(0xFFFF6A2B),
                        size: 40,
                      ),
                    ),
                  ),

                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                        },
                      ),
                    ),
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

class _MapPlaceholderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFDDD8D0)
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    for (double y = 30; y < size.height; y += 40) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    for (double x = 40; x < size.width; x += 55) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    final diagPaint = Paint()
      ..color = const Color(0xFFE2DDD5)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(0, size.height * 0.3),
      Offset(size.width, size.height * 0.8),
      diagPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.2, 0),
      Offset(size.width * 0.9, size.height),
      diagPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
