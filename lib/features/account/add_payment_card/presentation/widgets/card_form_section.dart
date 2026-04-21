import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CardFormSection extends StatelessWidget {
  const CardFormSection({
    super.key,
    required this.name,
    required this.cardNumber,
    required this.expMonth,
    required this.expYear,
    required this.cvv,
    required this.onNameChanged,
    required this.onCardNumberChanged,
    required this.onExpMonthChanged,
    required this.onExpYearChanged,
    required this.onCvvChanged,
  });

  final String name;
  final String cardNumber;
  final String expMonth;
  final String expYear;
  final String cvv;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onCardNumberChanged;
  final ValueChanged<String> onExpMonthChanged;
  final ValueChanged<String> onExpYearChanged;
  final ValueChanged<String> onCvvChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTextField(
            value: name,
            onChanged: onNameChanged,
            label: 'Name On Card',
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
          ),
          const SizedBox(height: 20),
          _buildTextField(
            value: cardNumber,
            onChanged: onCardNumberChanged,
            label: 'Card Number',
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(16),
              _CardNumberFormatter(),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: <Widget>[
              Expanded(
                child: _buildTextField(
                  value: expMonth,
                  onChanged: onExpMonthChanged,
                  label: 'Exp Month',
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _buildTextField(
                  value: expYear,
                  onChanged: onExpYearChanged,
                  label: 'Exp Year',
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildTextField(
            value: cvv,
            onChanged: onCvvChanged,
            label: 'CVV',
            keyboardType: TextInputType.number,
            obscureText: true,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String value,
    required ValueChanged<String> onChanged,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    List<TextInputFormatter>? inputFormatters,
    TextCapitalization textCapitalization = TextCapitalization.none,
  }) {
    return TextFormField(
      initialValue: value,
      keyboardType: keyboardType,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      style: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF000000),
        height: 1.4,
      ),
      cursorColor: const Color(0xFFFF6A2B),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF8A8A8A),
          height: 1.4,
        ),
        floatingLabelStyle: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF8A8A8A),
        ),
        contentPadding: const EdgeInsets.only(bottom: 8, top: 12),
        isDense: true,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE4E4E4), width: 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFF6A2B), width: 1.5),
        ),
      ),
    );
  }
}

class _CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final String digits = newValue.text.replaceAll(' ', '');
    final StringBuffer buffer = StringBuffer();

    for (int index = 0; index < digits.length; index++) {
      if (index > 0 && index % 4 == 0) {
        buffer.write(' ');
      }
      buffer.write(digits[index]);
    }

    final String formatted = buffer.toString();
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
