import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid/core/di/injection.dart';

import '../../domain/entities/review.dart';
import '../bloc/review_form_bloc.dart';
import '../bloc/review_form_event.dart';
import '../bloc/review_form_state.dart';
import 'product_colors.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({
    super.key,
    required this.productId,
    required this.productName,
    required this.reviews,
  });

  final String productId;
  final String productName;
  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReviewFormBloc>(
      create: (_) => sl<ReviewFormBloc>(),
      child: BlocConsumer<ReviewFormBloc, ReviewFormState>(
        listener: (BuildContext context, ReviewFormState state) {
          if (state.successMessage != null) {
            FocusScope.of(context).unfocus();
          }
        },
        builder: (BuildContext context, ReviewFormState state) {
          final ReviewFormBloc bloc = context.read<ReviewFormBloc>();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: bloc.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${reviews.length} REVIEWS FOR ${productName.toUpperCase()}',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 22,
                      color: ProductColors.black,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ...reviews.map(
                    (Review review) => _ReviewItem(review: review),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'ADD A REVIEW',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 22,
                      color: ProductColors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _CustomTextField(
                    label: 'Your review *',
                    controller: bloc.reviewController,
                    maxLines: 3,
                    validator: bloc.validateReview,
                  ),
                  const SizedBox(height: 16),
                  _CustomTextField(
                    label: 'Name *',
                    controller: bloc.nameController,
                    validator: bloc.validateName,
                  ),
                  const SizedBox(height: 16),
                  _CustomTextField(
                    label: 'Email *',
                    controller: bloc.emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: bloc.validateEmail,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      Text(
                        'Your Rating *',
                        style: GoogleFonts.poppins(
                          color: ProductColors.mediumGray,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List<Widget>.generate(5, (int index) {
                          final bool isSelected = index < state.rating;

                          return Padding(
                            padding: EdgeInsets.only(right: index == 4 ? 0 : 2),
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                context.read<ReviewFormBloc>().add(
                                  ReviewRatingChanged(index + 1),
                                );
                              },
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: Icon(
                                  isSelected ? Icons.star : Icons.star_border,
                                  color: isSelected
                                      ? const Color(0xFFFFD700)
                                      : ProductColors.extraLightGray,
                                  size: 18,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                  if (state.ratingError != null) ...<Widget>[
                    const SizedBox(height: 6),
                    Text(
                      state.ratingError!,
                      style: GoogleFonts.poppins(
                        color: Colors.red,
                        fontSize: 11,
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: state.saveDetails,
                        activeColor: ProductColors.primary,
                        onChanged: (bool? value) {
                          context.read<ReviewFormBloc>().add(
                            ReviewSaveDetailsChanged(value ?? false),
                          );
                        },
                      ),
                      Expanded(
                        child: Text(
                          'Save my name, email, and website in this browser for the next time I comment.',
                          style: GoogleFonts.poppins(
                            color: ProductColors.mediumGray,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: state.successMessage == null
                        ? const SizedBox.shrink()
                        : Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE9F8EE),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFFBFE8C8),
                              ),
                            ),
                            child: Text(
                              state.successMessage!,
                              style: GoogleFonts.poppins(
                                color: const Color(0xFF1F7A3D),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                  ),
                  if (state.failureMessage != null) ...<Widget>[
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF0F0),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFFFCECE)),
                      ),
                      child: Text(
                        state.failureMessage!,
                        style: GoogleFonts.poppins(
                          color: const Color(0xFFB43B3B),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 24),
                  Center(
                    child: SizedBox(
                      width: 160,
                      height: 45,
                      child: OutlinedButton(
                        onPressed: state.isSubmitting
                            ? null
                            : () {
                                context.read<ReviewFormBloc>().add(
                                  ReviewSubmitted(productId: productId),
                                );
                              },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFFE8E8E8)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ),
                        child: Text(
                          state.isSubmitting ? 'SUBMITTING...' : 'SUBMIT',
                          style: GoogleFonts.bebasNeue(
                            fontSize: 18,
                            color: ProductColors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ReviewItem extends StatelessWidget {
  const _ReviewItem({required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(review.avatarPath),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: List<Widget>.generate(
                    5,
                    (int index) => Icon(
                      index < review.rating ? Icons.star : Icons.star_border,
                      color: const Color(0xFFFFD700),
                      size: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: <Widget>[
                    Text(
                      review.userName,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text('—'),
                    const SizedBox(width: 8),
                    Text(
                      review.date,
                      style: GoogleFonts.poppins(
                        color: ProductColors.mediumGray,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  review.comment,
                  style: GoogleFonts.poppins(
                    color: ProductColors.mediumGray,
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  const _CustomTextField({
    required this.label,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.maxLines = 1,
  });

  final String label;
  final int maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: GoogleFonts.poppins(
            color: ProductColors.mediumGray,
            fontSize: 12,
          ),
        ),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          validator: validator,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 8),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE8E8E8)),
            ),
          ),
        ),
      ],
    );
  }
}
