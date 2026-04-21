import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class BillingFormSection extends StatelessWidget {
  const BillingFormSection({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.street,
    required this.city,
    required this.phone,
    required this.email,
    required this.selectedCountry,
    required this.phoneCode,
    required this.onFirstNameChanged,
    required this.onLastNameChanged,
    required this.onStreetChanged,
    required this.onCityChanged,
    required this.onPhoneChanged,
    required this.onEmailChanged,
    required this.onCountryChanged,
    required this.onPhoneCodeChanged,
  });

  final String firstName;
  final String lastName;
  final String street;
  final String city;
  final String phone;
  final String email;
  final String selectedCountry;
  final String phoneCode;
  final ValueChanged<String> onFirstNameChanged;
  final ValueChanged<String> onLastNameChanged;
  final ValueChanged<String> onStreetChanged;
  final ValueChanged<String> onCityChanged;
  final ValueChanged<String> onPhoneChanged;
  final ValueChanged<String> onEmailChanged;
  final ValueChanged<String> onCountryChanged;
  final ValueChanged<String> onPhoneCodeChanged;



  TextStyle get _labelStyle => GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF999999),
    height: 1,
    letterSpacing: 0,
  );

  TextStyle get _inputStyle => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF000000),
    height: 1.4,
    letterSpacing: 0,
  );

  TextStyle get _hintStyle => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: const Color(0xFFCCCCCC),
    height: 1.4,
    letterSpacing: 0,
  );

  InputDecoration _underlineDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: _hintStyle,
      contentPadding: const EdgeInsets.only(bottom: 10, top: 6),
      isDense: true,
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: const Color(0xFFEBEBEB), width: 1),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: const Color(0xFFFF6A2B), width: 1.5),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _LabeledField(
                  label: 'First name *',
                  labelStyle: _labelStyle,
                  child: _BillingTextField(
                    value: firstName,
                    onChanged: onFirstNameChanged,
                    style: _inputStyle,
                    decoration: _underlineDecoration(''),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _LabeledField(
                  label: 'Last name *',
                  labelStyle: _labelStyle,
                  child: _BillingTextField(
                    value: lastName,
                    onChanged: onLastNameChanged,
                    style: _inputStyle,
                    decoration: _underlineDecoration(''),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          _LabeledField(
            label: 'Country / Region *',
            labelStyle: _labelStyle,
            child: _CountryDropdown(
              value: selectedCountry,
              onChanged: onCountryChanged,
              inputStyle: _inputStyle,
            ),
          ),

          const SizedBox(height: 24),

          _LabeledField(
            label: '',
            labelStyle: _labelStyle,
            child: _BillingTextField(
              value: street,
              onChanged: onStreetChanged,
              style: _inputStyle,
              decoration: _underlineDecoration('Street address *'),
            ),
          ),

          const SizedBox(height: 24),

          _LabeledField(
            label: '',
            labelStyle: _labelStyle,
            child: _BillingTextField(
              value: city,
              onChanged: onCityChanged,
              style: _inputStyle,
              decoration: _underlineDecoration('Town / City *'),
            ),
          ),

          const SizedBox(height: 24),

          _PhoneField(
            phoneCode: phoneCode,
            value: phone,
            inputStyle: _inputStyle,
            hintStyle: _hintStyle,
            onCodeChanged: onPhoneCodeChanged,
            onChanged: onPhoneChanged,
          ),

          const SizedBox(height: 24),

          // ── Email address ──
          _LabeledField(
            label: '',
            labelStyle: _labelStyle,
            child: _BillingTextField(
              value: email,
              onChanged: onEmailChanged,
              style: _inputStyle,
              keyboardType: TextInputType.emailAddress,
              decoration: _underlineDecoration('Email address *'),
            ),
          ),
        ],
      ),
    );
  }
}



class _LabeledField extends StatelessWidget {
  const _LabeledField({
    required this.label,
    required this.labelStyle,
    required this.child,
  });

  final String label;
  final TextStyle labelStyle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          Text(label, style: labelStyle),
          const SizedBox(height: 2),
        ],
        child,
      ],
    );
  }
}

class _CountryDropdown extends StatelessWidget {
  const _CountryDropdown({
    required this.value,
    required this.onChanged,
    required this.inputStyle,
  });

  final String value;
  final ValueChanged<String> onChanged;
  final TextStyle inputStyle;

  static const _countries = [
    'UNITED STATES',
    'CANADA',
    'UNITED KINGDOM',
    'AUSTRALIA',
    'GERMANY',
    'FRANCE',
    'JAPAN',
    'VIETNAM',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: const Color(0xFFEBEBEB), width: 1),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: const Color(0xFF000000),
            size: 22,
          ),
          style: inputStyle,
          items: _countries.map((c) {
            return DropdownMenuItem(
              value: c,
              child: Text(c, style: inputStyle),
            );
          }).toList(),
          onChanged: (val) {
            if (val != null) onChanged(val);
          },
        ),
      ),
    );
  }
}

class _PhoneField extends StatelessWidget {
  const _PhoneField({
    required this.phoneCode,
    required this.value,
    required this.inputStyle,
    required this.hintStyle,
    required this.onCodeChanged,
    required this.onChanged,
  });

  final String phoneCode;
  final String value;
  final TextStyle inputStyle;
  final TextStyle hintStyle;
  final ValueChanged<String> onCodeChanged;
  final ValueChanged<String> onChanged;
  static const _phoneCodes = ['+1', '+44', '+61', '+81', '+84'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: const Color(0xFFEBEBEB), width: 1),
        ),
      ),
      child: Row(
        children: [
          // Country code
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: phoneCode,
                style: inputStyle,
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: const Color(0xFF000000),
                  size: 18,
                ),
                items: _phoneCodes.map((code) {
                  return DropdownMenuItem<String>(
                    value: code,
                    child: Text(code, style: inputStyle),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    onCodeChanged(value);
                  }
                },
              ),
            ),
          ),
          Container(width: 1, height: 20, color: const Color(0xFFEBEBEB)),
          const SizedBox(width: 12),
          Expanded(
            child: _BillingTextField(
              value: value,
              onChanged: onChanged,
              style: inputStyle,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Phone *',
                hintStyle: hintStyle,
                contentPadding: const EdgeInsets.only(bottom: 10, top: 6),
                isDense: true,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BillingTextField extends StatelessWidget {
  const _BillingTextField({
    required this.value,
    required this.onChanged,
    required this.style,
    required this.decoration,
    this.keyboardType,
  });

  final String value;
  final ValueChanged<String> onChanged;
  final TextStyle style;
  final InputDecoration decoration;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      onChanged: onChanged,
      keyboardType: keyboardType,
      style: style,
      decoration: decoration,
    );
  }
}
