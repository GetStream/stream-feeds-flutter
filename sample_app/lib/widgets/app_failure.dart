import 'package:flutter/material.dart';

import '../theme/theme.dart';

/// App failure screen widget.
///
/// Displays detailed error information with stack trace in a beautiful,
/// developer-friendly format while maintaining clean design principles.
class AppFailure extends StatefulWidget {
  const AppFailure({
    super.key,
    required this.error,
    this.stackTrace,
  });

  /// The error object that caused the failure.
  final Object error;

  /// Optional stack trace for debugging.
  final StackTrace? stackTrace;

  @override
  State<AppFailure> createState() => _AppFailureState();
}

class _AppFailureState extends State<AppFailure> {
  var _showDetails = false;

  String get _errorMessage {
    return widget.error.toString().replaceFirst('Exception: ', '');
  }

  String get _errorType {
    return widget.error.runtimeType.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.appBg,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),

                  // Error icon with enhanced styling
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color:
                          context.appColors.accentError.withValues(alpha: 0.08),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: context.appColors.accentError
                              .withValues(alpha: 0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.warning_rounded,
                      size: 50,
                      color: context.appColors.accentError,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Error title with better typography
                  Text(
                    'Application Error',
                    textAlign: TextAlign.center,
                    style: context.appTextStyles.title.copyWith(
                      color: context.appColors.textHighEmphasis,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Subtitle for context
                  Text(
                    'The app failed to initialize properly',
                    textAlign: TextAlign.center,
                    style: context.appTextStyles.body.copyWith(
                      color: context.appColors.textLowEmphasis,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Error type chip with improved styling
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color:
                          context.appColors.accentError.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: context.appColors.accentError
                            .withValues(alpha: 0.2),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.code,
                          size: 16,
                          color: context.appColors.accentError,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _errorType,
                          style: context.appTextStyles.footnote.copyWith(
                            color: context.appColors.accentError,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Error message with enhanced card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: context.appColors.barsBg,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: context.appColors.borders,
                      ),
                      boxShadow: [
                        context.appEffects.shadowIconButton,
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 18,
                              color: context.appColors.textLowEmphasis,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Error Details',
                              style: context.appTextStyles.bodyBold.copyWith(
                                color: context.appColors.textLowEmphasis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _errorMessage,
                          style: context.appTextStyles.body.copyWith(
                            color: context.appColors.textHighEmphasis,
                            fontSize: 15,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Enhanced toggle details button
                  if (widget.stackTrace != null)
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () =>
                            setState(() => _showDetails = !_showDetails),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: context.appColors.accentPrimary,
                          side: BorderSide(
                            color: context.appColors.accentPrimary
                                .withValues(alpha: 0.3),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        icon: Icon(
                          _showDetails ? Icons.expand_less : Icons.expand_more,
                          size: 20,
                        ),
                        label: Text(
                          _showDetails
                              ? 'Hide Technical Details'
                              : 'Show Technical Details',
                          style: context.appTextStyles.bodyBold.copyWith(
                            color: context.appColors.accentPrimary,
                          ),
                        ),
                      ),
                    ),

                  // Enhanced stack trace with better formatting
                  if (_showDetails && widget.stackTrace != null) ...[
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: context.appColors.inputBg,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: context.appColors.borders,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: context.appColors.borders
                                  .withValues(alpha: 0.3),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.terminal,
                                  size: 18,
                                  color: context.appColors.textLowEmphasis,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Stack Trace',
                                  style:
                                      context.appTextStyles.bodyBold.copyWith(
                                    color: context.appColors.textLowEmphasis,
                                  ),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.code,
                                  size: 16,
                                  color: context.appColors.textLowEmphasis,
                                ),
                              ],
                            ),
                          ),
                          // Content
                          Container(
                            width: double.infinity,
                            constraints: const BoxConstraints(maxHeight: 250),
                            padding: const EdgeInsets.all(16),
                            child: SingleChildScrollView(
                              child: SelectableText(
                                widget.stackTrace.toString(),
                                style: context.appTextStyles.footnote.copyWith(
                                  color: context.appColors.textHighEmphasis,
                                  fontFamily: 'monospace',
                                  fontSize: 11,
                                  height: 1.3,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
