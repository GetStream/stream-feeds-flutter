# Copilot Instructions for Stream Feeds Flutter SDK

This file provides repository-specific guidance for GitHub Copilot when working with the Stream Feeds Flutter/Dart SDK.

## Project Overview

This is the **official Flutter/Dart SDK** for Stream Feeds API v3, a scalable activity feed service. The repository is a **Melos monorepo** containing:

- **Low-level SDK** (`packages/stream_feeds/`): Pure Dart SDK for Stream Feeds API
- **Sample App** (`sample_app/`): Flutter demo application
- **Documentation** (`docs/`): Code snippets and examples

**Languages/Frameworks**: Dart SDK ^3.6.2, Flutter >=3.27.4

## Build and Test Commands

Always run commands from the repository root directory.

### Setup (Required First)

```bash
# Install melos globally (required)
flutter pub global activate melos

# Bootstrap the workspace (ALWAYS run first)
melos bootstrap --verbose
```

### Code Generation (After Model Changes)

```bash
# Generate all files (Dart + Flutter packages)
melos run generate:all

# Generate only Dart packages
melos run generate:dart

# Generate only Flutter packages
melos run generate:flutter
```

**Important**: Always run code generation after modifying `@freezed` models.

### Testing

```bash
# Run all tests
melos run test:all

# Run only Dart tests
melos run test:dart

# Run only Flutter tests
melos run test:flutter
```

### Linting and Formatting

```bash
# Run all linting and formatting
melos run lint:all

# Run static analysis only
melos run analyze

# Format code
melos run format

# Verify formatting (CI check)
melos run format:verify
```

### Building

```bash
# Build sample app APK
cd sample_app && flutter build apk --release
```

## Architecture Guidelines

### Data Models

- Use `@freezed` for all data classes with Freezed 3.0 syntax
- Fields are declared with `@override` annotations below the constructor
- Models representing entities should have an `id` field
- Place `custom` data fields last in constructors

```dart
@freezed
class FeedData with _$FeedData {
  /// Creates a new [FeedData] instance.
  const FeedData({
    required this.id,
    required this.name,
    this.custom,
  });

  @override
  final String id;
  @override
  final String name;
  @override
  final Map<String, Object?>? custom;
}
```

### Error Handling

- Use `Result<T>` pattern for all repository methods - never throw exceptions
- Use early return patterns for validation and errors

```dart
Future<Result<ActivityData>> getActivity(String id) async {
  try {
    final result = await apiClient.getActivity(id: id);
    if (result == null) {
      return Result.failure(NetworkException('No data returned'));
    }
    return Result.success(result.toModel());
  } on ClientException catch (e) {
    return Result.failure(_mapClientException(e));
  }
}
```

### State Management

- Use `StateNotifier` for reactive state management
- State classes must use `@freezed` with const constructors
- High-level state objects (Feed, ActivityList) are the public API

## File Organization

### Naming Conventions

- Models: `*Data` (e.g., `ActivityData`, `FeedData`)
- Queries: `*Query` (e.g., `ActivitiesQuery`)
- Requests: `*Request` (e.g., `FeedAddActivityRequest`)
- State: `*State` (e.g., `FeedState`)
- StateNotifier: `*StateNotifier` (e.g., `FeedStateNotifier`)

### Directory Structure

- **Public API**: `lib/stream_feeds.dart` - export only public APIs here
- **Internal code**: `lib/src/` - all implementation details
- **Generated code**: `*.freezed.dart`, `*.g.dart`, `src/generated/` - NEVER edit manually

## Important Rules

1. **Never edit generated files** (`*.freezed.dart`, `*.g.dart`, `src/generated/`)
2. **Always run `melos bootstrap`** before building or testing
3. **Always run `melos run generate:all`** after modifying `@freezed` models
4. **Use `///` for public API documentation**, `//` for internal comments
5. **Test through public APIs only**, not internal StateNotifier implementations
6. **Keep public API minimal** - most code should be in `lib/src/`

## CI Validation

The CI workflow runs these checks (in order):
1. `melos bootstrap --verbose`
2. `melos run analyze`
3. `melos run format:verify`
4. `melos run test:all`

Ensure all these pass locally before pushing changes.

## Dependencies

- Dependencies are managed in `melos.yaml`
- Never edit `pubspec.yaml` environment or dependency versions directly
- Run `melos bootstrap` after any dependency changes
