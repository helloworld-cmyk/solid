import 'package:flutter/material.dart';

import '../../change_profile_style.dart';

class ProfileDetailRow extends StatelessWidget {
  const ProfileDetailRow({
    super.key,
    required this.label,
    this.value,
    this.onChanged,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.trailing,
    this.hintText,
    this.readOnly = false,
    this.onTap,
  });

  final String label;
  final String? value;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final Widget? trailing;
  final String? hintText;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(label, style: ChangeProfileTypography.rowLabel),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 4,
                child:
                    trailing ??
                    _ProfileInlineTextField(
                      value: value ?? '',
                      onChanged: onChanged,
                      readOnly: readOnly,
                      onTap: onTap,
                      keyboardType: keyboardType,
                      textInputAction: textInputAction,
                      hintText: hintText,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(
            height: 1,
            thickness: 1,
            color: ChangeProfileColors.divider,
          ),
        ],
      ),
    );
  }
}

class _ProfileInlineTextField extends StatefulWidget {
  const _ProfileInlineTextField({
    required this.value,
    this.onChanged,
    this.keyboardType,
    required this.textInputAction,
    this.hintText,
    required this.readOnly,
    this.onTap,
  });

  final String value;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final String? hintText;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  State<_ProfileInlineTextField> createState() => _ProfileInlineTextFieldState();
}

class _ProfileInlineTextFieldState extends State<_ProfileInlineTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(covariant _ProfileInlineTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value == _controller.text) {
      return;
    }

    _controller.value = _controller.value.copyWith(
      text: widget.value,
      selection: TextSelection.collapsed(offset: widget.value.length),
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
    return TextField(
      controller: _controller,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      textAlign: TextAlign.right,
      style: ChangeProfileTypography.rowValue,
      decoration: InputDecoration(
        isDense: true,
        border: InputBorder.none,
        hintText: widget.hintText,
        hintStyle: ChangeProfileTypography.rowLabel,
      ),
    );
  }
}
