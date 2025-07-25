// Code generated by GetStream internal OpenAPI code generator. DO NOT EDIT.

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: use_string_in_part_of_directives
// ignore_for_file: unnecessary_raw_strings
// ignore_for_file: unnecessary_null_in_if_null_operators
// ignore_for_file: public_member_api_docs
// ignore_for_file: prefer_single_quotes
// ignore_for_file: require_trailing_commas

part of openapi.api;

enum BlockListOptionsBehaviorEnum {
  block('block'),
  flag('flag'),
  shadowBlock('shadow_block'),
  unknown('_unknown');

  const BlockListOptionsBehaviorEnum(this.value);
  final String value;

  static BlockListOptionsBehaviorEnum? fromValue(String? json) {
    switch (json) {
      case null:
        return null;
      case 'block':
        return BlockListOptionsBehaviorEnum.block;
      case 'flag':
        return BlockListOptionsBehaviorEnum.flag;
      case 'shadow_block':
        return BlockListOptionsBehaviorEnum.shadowBlock;
      default:
        return BlockListOptionsBehaviorEnum.unknown;
    }
  }
}

@immutable
class BlockListOptions {
  const BlockListOptions({
    required this.behavior,
    required this.blocklist,
  });

  final BlockListOptionsBehaviorEnum behavior;

  final String blocklist;

  Map<String, dynamic> toJson() {
    return {
      'behavior': behavior,
      'blocklist': blocklist,
    };
  }

  static BlockListOptions? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      return BlockListOptions(
        behavior: BlockListOptionsBehaviorEnum.fromValue(json['behavior'])!,
        blocklist: mapValueOfType<String>(json, r'blocklist')!,
      );
    }
    return null;
  }

  static List<BlockListOptions> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <BlockListOptions>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BlockListOptions.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  @override
  String toString() {
    return 'BlockListOptions('
        'behavior: $behavior, '
        'blocklist: $blocklist, '
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BlockListOptions &&
        other.behavior == behavior &&
        other.blocklist == blocklist;
  }

  @override
  int get hashCode {
    return Object.hashAll([
      behavior,
      blocklist,
    ]);
  }
}
