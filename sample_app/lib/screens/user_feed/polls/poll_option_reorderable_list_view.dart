import 'dart:math' as math;
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../theme/extensions/theme_extensions.dart';
import 'poll_config.dart';
import 'poll_text_field.dart';

class _NullConst {
  const _NullConst();
}

const _nullConst = _NullConst();

/// {@template pollOptionItem}
/// A data class that represents a poll option item
/// {@endtemplate}
class PollOptionItem {
  /// {@macro pollOptionItem}
  PollOptionItem({
    required this.key,
    this.originalId,
    this.text = '',
    this.error,
  });

  /// The unique id of the poll option item.
  final Key key;

  /// The text of the poll option item.
  final String text;

  final String? originalId;

  /// Optional error message based on the validation of the poll option item.
  ///
  /// If the poll option item is valid, this will be `null`.
  final String? error;

  /// A copy of the current [PollOptionItem] with the provided values.
  PollOptionItem copyWith({
    String? text,
    Object? error = _nullConst,
  }) {
    return PollOptionItem(
      key: key,
      text: text ?? this.text,
      originalId: originalId,
      error: error == _nullConst ? this.error : error as String?,
    );
  }
}

/// {@template pollOptionListItem}
/// A widget that represents a poll option list item.
/// {@endtemplate}
class PollOptionListItem extends StatelessWidget {
  /// {@macro pollOptionListItem}
  const PollOptionListItem({
    super.key,
    required this.option,
    this.hintText,
    this.focusNode,
    this.onChanged,
  });

  /// The poll option item.
  final PollOptionItem option;

  /// Hint to be displayed in the poll option list item.
  final String? hintText;

  /// The focus node for the text field.
  final FocusNode? focusNode;

  /// Callback called when the poll option item is changed.
  final ValueSetter<PollOptionItem>? onChanged;

  @override
  Widget build(BuildContext context) {
    final fillColor = context.appColors.inputBg;
    final borderRadius = BorderRadius.circular(12);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: borderRadius,
      ),
      child: Row(
        children: [
          Expanded(
            child: StreamPollTextField(
              initialValue: option.text,
              hintText: hintText,
              borderRadius: borderRadius,
              errorText: option.error,
              focusNode: focusNode,
              onChanged: (text) => onChanged?.call(option.copyWith(text: text)),
            ),
          ),
          const SizedBox(
            width: 48,
            height: 48,
            child: Icon(Icons.drag_handle_rounded),
          ),
        ],
      ),
    );
  }
}

/// {@template pollOptionReorderableListView}
/// A widget that represents a reorderable list view of poll options.
/// {@endtemplate}
class PollOptionReorderableListView extends StatefulWidget {
  /// {@macro pollOptionReorderableListView}
  const PollOptionReorderableListView({
    super.key,
    this.title,
    this.itemHintText,
    this.allowDuplicate = false,
    this.initialOptions = const [],
    this.optionsRange,
    this.onOptionsChanged,
  });

  /// An optional title to be displayed above the list of poll options.
  final String? title;

  /// The hint text to be displayed in the poll option list item.
  final String? itemHintText;

  /// Whether the poll options allow duplicates.
  ///
  /// If `true`, the poll options can be duplicated.
  final bool allowDuplicate;

  /// The initial list of poll options.
  final List<PollOptionItem> initialOptions;

  /// The range of allowed options (min and max).
  ///
  /// If `null`, there are no limits. If only min or max is specified,
  /// the other bound is unlimited.
  final Range<int>? optionsRange;

  /// Callback called when the items are updated or reordered.
  final ValueSetter<List<PollOptionItem>>? onOptionsChanged;

  @override
  State<PollOptionReorderableListView> createState() =>
      _PollOptionReorderableListViewState();
}

class _PollOptionReorderableListViewState
    extends State<PollOptionReorderableListView> {
  late Map<Key, FocusNode> _focusNodes;
  late Map<Key, PollOptionItem> _options;

  @override
  void initState() {
    super.initState();
    _initializeOptions();
  }

  @override
  void dispose() {
    _disposeOptions();
    super.dispose();
  }

  void _initializeOptions() {
    _focusNodes = <Key, FocusNode>{};
    _options = <Key, PollOptionItem>{};

    for (final option in widget.initialOptions) {
      _options[option.key] = option;
      _focusNodes[option.key] = FocusNode();
    }

    // Ensure we have at least the minimum number of options
    _ensureMinimumOptions(notifyParent: true);
  }

  void _ensureMinimumOptions({bool notifyParent = false}) {
    // Ensure we have at least the minimum number of options
    final minOptions = widget.optionsRange?.min ?? 1;

    var optionsAdded = false;
    while (_options.length < minOptions) {
      final option = PollOptionItem(key: UniqueKey());
      _options[option.key] = option;
      _focusNodes[option.key] = FocusNode();
      optionsAdded = true;
    }

    // Notify parent if we added options and it's requested
    if (optionsAdded && notifyParent) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onOptionsChanged?.call([..._options.values]);
      });
    }
  }

  void _disposeOptions() {
    _focusNodes.values.forEach((it) => it.dispose());
    _focusNodes.clear();
    _options.clear();
  }

  @override
  void didUpdateWidget(covariant PollOptionReorderableListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update the options if the updated options are different from the current
    // set of options.
    final currOptions = [..._options.values];
    final newOptions = widget.initialOptions;

    final optionItemEquality = ListEquality<PollOptionItem>(
      EqualityBy((it) => (it.key, it.text)),
    );

    if (optionItemEquality.equals(currOptions, newOptions) case false) {
      _disposeOptions();
      _initializeOptions();
    }
  }

  Widget _proxyDecorator(Widget child, int index, Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        final animValue = Curves.easeInOut.transform(animation.value);
        final elevation = lerpDouble(0, 6, animValue)!;
        return Material(
          borderRadius: BorderRadius.circular(12),
          elevation: elevation,
          child: child,
        );
      },
      child: child,
    );
  }

  String? _validateOption(PollOptionItem option) {
    // Check if the option is empty.
    if (option.text.isEmpty) return 'Option cannot be empty';

    // Check for duplicate options if duplicates are not allowed.
    if (widget.allowDuplicate case false) {
      if (_options.values.any((it) {
        // Skip if it's the same option
        if (it.key == option.key) return false;

        return it.text == option.text;
      })) {
        return 'This is already an option';
      }
    }

    return null;
  }

  void _onOptionChanged(PollOptionItem option) {
    setState(() {
      // Update the changed option.
      _options[option.key] = option.copyWith(
        error: _validateOption(option),
      );

      // Validate every other option to check for duplicates.
      _options.updateAll((key, value) {
        // Skip the changed option as it's already validated.
        if (key == option.key) return value;

        return value.copyWith(error: _validateOption(value));
      });
    });

    // Notify the parent widget about the change
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onOptionsChanged?.call([..._options.values]);
    });
  }

  void _onOptionReorder(int oldIndex, int newIndex) {
    setState(() {
      final options = [..._options.values];

      // Move the dragged option to the new index
      final option = options.removeAt(oldIndex);
      options.insert(newIndex, option);

      // Update the options map
      _options = <Key, PollOptionItem>{
        for (final option in options) option.key: option,
      };
    });

    // Notify the parent widget about the change
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onOptionsChanged?.call([..._options.values]);
    });
  }

  void _onAddOptionPressed() {
    // Check if we've reached the maximum number of options allowed
    if (widget.optionsRange?.max case final maxOptions?) {
      // Don't add more options if we've reached the limit
      if (_options.length >= maxOptions) return;
    }

    // Create a new option item
    final option = PollOptionItem(key: UniqueKey());

    setState(() {
      _options[option.key] = option;
      _focusNodes[option.key] = FocusNode();
    });

    // Notify the parent widget about the change and request focus on the
    // newly added option text field.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onOptionsChanged?.call([..._options.values]);
      _focusNodes[option.key]?.requestFocus();
    });
  }

  bool get _canAddMoreOptions {
    // Don't allow adding if there's already an empty option
    final hasEmptyOption = _options.values.any((it) => it.text.isEmpty);
    if (hasEmptyOption) return false;

    // Check max options limit
    if (widget.optionsRange?.max case final maxOptions?) {
      return _options.length < maxOptions;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(12);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title case final title?) ...[
          Text(title, style: context.appTextStyles.headlineBold),
          const SizedBox(height: 8),
        ],
        Flexible(
          child: SeparatedReorderableListView(
            shrinkWrap: true,
            itemCount: _options.length,
            physics: const NeverScrollableScrollPhysics(),
            proxyDecorator: _proxyDecorator,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            onReorderStart: (_) => FocusScope.of(context).unfocus(),
            onReorder: _onOptionReorder,
            itemBuilder: (context, index) {
              final option = _options.values.elementAt(index);
              return PollOptionListItem(
                key: option.key,
                option: option,
                hintText: widget.itemHintText,
                focusNode: _focusNodes[option.key],
                onChanged: _onOptionChanged,
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: FilledButton.tonal(
            onPressed: _canAddMoreOptions ? _onAddOptionPressed : null,
            style: TextButton.styleFrom(
              alignment: Alignment.centerLeft,
              textStyle: context.appTextStyles.body,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 16,
              ),
              backgroundColor: context.appColors.inputBg,
              foregroundColor: context.appColors.textHighEmphasis,
            ),
            child: const Text('Add an option'),
          ),
        ),
      ],
    );
  }
}

class SeparatedReorderableListView extends ReorderableListView {
  /// {@macro streamSeparatedReorderableListView}
  SeparatedReorderableListView({
    super.key,
    required IndexedWidgetBuilder itemBuilder,
    required IndexedWidgetBuilder separatorBuilder,
    required int itemCount,
    required ReorderCallback onReorder,
    super.onReorderStart,
    super.onReorderEnd,
    super.itemExtent,
    super.prototypeItem,
    super.proxyDecorator,
    super.padding,
    super.header,
    super.scrollDirection,
    super.reverse,
    super.scrollController,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.anchor,
    super.cacheExtent,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.clipBehavior,
  }) : super.builder(
          buildDefaultDragHandles: false,
          itemCount: math.max(0, itemCount * 2 - 1),
          itemBuilder: (BuildContext context, int index) {
            final itemIndex = index ~/ 2;
            if (index.isEven) {
              final listItem = itemBuilder(context, itemIndex);
              return ReorderableDelayedDragStartListener(
                key: listItem.key,
                index: index,
                child: listItem,
              );
            }

            final separator = separatorBuilder(context, itemIndex);
            if (separator.key == null) {
              return KeyedSubtree(
                key: ValueKey('reorderable_separator_$itemIndex'),
                child: IgnorePointer(child: separator),
              );
            }

            return separator;
          },
          onReorder: (int oldIndex, int newIndex) {
            // Adjust the indexes due to an issue in the ReorderableListView
            // which isn't going to be fixed in the near future.
            //
            // issue: https://github.com/flutter/flutter/issues/24786
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }

            // Ideally should never happen as separators are wrapped in the
            // IgnorePointer widget. This is just a safety check.
            if (oldIndex % 2 == 1) return;

            // The item moved behind the top/bottom separator we should not
            // reorder it.
            if ((oldIndex - newIndex).abs() == 1) return;

            // Calculate the updated indexes
            final updatedOldIndex = oldIndex ~/ 2;
            final updatedNewIndex = oldIndex > newIndex && newIndex % 2 == 1
                ? (newIndex + 1) ~/ 2
                : newIndex ~/ 2;

            onReorder(updatedOldIndex, updatedNewIndex);
          },
        );
}
