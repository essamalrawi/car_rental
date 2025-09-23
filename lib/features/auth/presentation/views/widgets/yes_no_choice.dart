// lib/widgets/yes_no_choice.dart
import 'package:flutter/material.dart';

typedef OnYesNoChanged = void Function(int value); // 0 or 1

class YesNoChoice extends StatefulWidget {
  final String question;
  final String yesLabel;
  final String noLabel;
  final IconData? yesIcon;
  final IconData? noIcon;
  final int? initialValue;
  final OnYesNoChanged? onChanged;
  final bool enabled;
  final double height;
  final double borderRadius;
  final Duration animationDuration;
  final Color yesColor;
  final Color noColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final Color disabledColor;

  const YesNoChoice({
    Key? key,
    this.question = "Available to create a car?",
    this.yesLabel = "Yes",
    this.noLabel = "No",
    this.yesIcon,
    this.noIcon,
    this.initialValue,
    this.onChanged,
    this.enabled = true,
    this.height = 48,
    this.borderRadius = 12,
    this.animationDuration = const Duration(milliseconds: 220),
    this.yesColor = Colors.green,
    this.noColor = Colors.red,
    this.selectedTextColor = Colors.white,
    this.unselectedTextColor = Colors.black87,
    this.disabledColor = Colors.grey,
  }) : super(key: key);

  @override
  State<YesNoChoice> createState() => _YesNoChoiceState();
}

class _YesNoChoiceState extends State<YesNoChoice> {
  int? selected;
  @override
  void initState() {
    super.initState();
    selected = widget.initialValue;
  }

  void _select(int value) {
    if (!widget.enabled) return;
    setState(() => selected = value);
    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _buildChoice(
                index: 0,
                label: widget.noLabel,
                icon: widget.noIcon,
                activeColor: widget.noColor,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildChoice(
                index: 1,
                label: widget.yesLabel,
                icon: widget.yesIcon,
                activeColor: widget.yesColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildChoice({
    required int index,
    required String label,
    IconData? icon,
    required Color activeColor,
  }) {
    final bool isSelected = selected == index;
    final bool disabled = !widget.enabled;
    final borderRadius = BorderRadius.circular(widget.borderRadius);

    return Semantics(
      button: true,
      selected: isSelected,
      enabled: !disabled,
      label: '${widget.question} - $label',
      child: AnimatedContainer(
        duration: widget.animationDuration,
        height: widget.height,
        decoration: BoxDecoration(
          color: disabled
              ? widget.disabledColor.withOpacity(0.25)
              : (isSelected ? activeColor : Colors.transparent),
          borderRadius: borderRadius,
          border: Border.all(
            color: isSelected
                ? activeColor
                : (disabled
                      ? widget.disabledColor.withOpacity(0.5)
                      : Colors.grey.shade300),
            width: isSelected ? 0 : 1,
          ),
          boxShadow: isSelected && !disabled
              ? [
                  BoxShadow(
                    color: activeColor.withOpacity(0.18),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: borderRadius,
            onTap: disabled ? null : () => _select(index),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(
                      icon,
                      color: isSelected
                          ? widget.selectedTextColor
                          : widget.unselectedTextColor,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                  ],
                  AnimatedDefaultTextStyle(
                    duration: widget.animationDuration,
                    style: TextStyle(
                      color: isSelected
                          ? widget.selectedTextColor
                          : widget.unselectedTextColor,
                      fontWeight: isSelected
                          ? FontWeight.w700
                          : FontWeight.w600,
                    ),
                    child: Text(label),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
