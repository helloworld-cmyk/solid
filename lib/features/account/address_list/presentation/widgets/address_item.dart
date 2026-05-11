import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:solid/core/bloc/address/address_model.dart';

class AddressItem extends StatelessWidget {
  final AddressModel address;
  final bool isSelected;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  const AddressItem({
    super.key,
    required this.address,
    required this.isSelected,
    required this.onDelete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color cardBackground = isSelected
        ? const Color(0xFFF9F9F9)
        : Colors.white;
    final Color cardBorder = isSelected
        ? Colors.transparent
        : const Color(0xFFEAEAEA);
    final Color nameColor = isSelected
        ? const Color(0xFF000000)
        : const Color(0xFF8F8F8F);
    final Color detailColor = const Color(0xFF8F8F8F);
    final Color arrowColor = isSelected
        ? const Color(0xFF000000)
        : const Color(0xFF8F8F8F);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Dismissible(
        key: Key(address.id),
        direction: DismissDirection.endToStart,
        onDismissed: (_) => onDelete(),
        background: Container(
          color: const Color(0xFFE43030),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 32),
          child: const Icon(
            Icons.delete_outline,
            color: Colors.white,
            size: 24,
          ),
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: cardBackground,
              border: Border.all(color: cardBorder, width: 1),
            ),
            child: Stack(
              children: [
                if (isSelected)
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(width: 3, color: const Color(0xFFFF6A2B)),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 34,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              address.name,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: nameColor,
                                height: 1,
                                letterSpacing: 0,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              address.address,
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: detailColor,
                                height: 1,
                                letterSpacing: 0,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              address.email,
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: detailColor,
                                height: 1,
                                letterSpacing: 0,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              address.phone,
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: detailColor,
                                height: 1,
                                letterSpacing: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: arrowColor,
                      ),
                    ],
                  ),
                ),
                if (isSelected)
                  Positioned(
                    top: 10,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 6,
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF6A2B),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(18),
                          topLeft: Radius.circular(18),
                        ),
                      ),
                      child: Text(
                        'Selected',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          height: 1,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
