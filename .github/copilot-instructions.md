# Copilot Instructions for Stream Feeds Flutter SDK

## Project Overview

This is the **official Flutter/Dart SDK** for Stream Feeds API v3, a scalable activity feed service. The repository is a **Melos monorepo** containing:

- **Main SDK** (`packages/stream_feeds/`): Pure Dart SDK (~19k lines of code, 1684+ Dart files)
- **Test utilities** (`packages/stream_feeds_test/`): Testing helpers
- **Sample app** (`sample_app/`): Flutter demo application
- **Documentation** (`docs/`): Code examples and documentation site

**Technologies**: Dart 3.6.2+, Flutter 3.27.4+, Melos for monorepo management

**Note**: Activity Feeds V3 is in closed alpha—not for production use yet.

## Setup and Bootstrap

**ALWAYS** run `melos bootstrap` first when working with this repository:

```bash
# Bootstrap dependencies (REQUIRED FIRST STEP)
melos bootstrap

# If Flutter/Dart not available, install first:
# - Install Flutter from https://docs.flutter.dev/get-started/install
# - Flutter includes Dart SDK
```

**Critical**: This is a Melos workspace. Dependencies are managed centrally in `melos.yaml`. Never directly edit dependency versions in individual `pubspec.yaml` files—edit `melos.yaml` and run `melos bootstrap` instead.

## Build and Validation

### Code Generation (CRITICAL)

This project uses extensive code generation. **ALWAYS** run generation after modifying models:

```bash
# Generate all code (Freezed models, JSON serialization, Retrofit clients)
melos run generate:all

# Or separately:
melos run generate:dart    # Pure Dart packages only
melos run generate:flutter # Flutter packages only

# Generate OpenAPI client (rarely needed, requires OpenAPI spec)
melos run gen:feeds
```

**Important**: NEVER manually edit generated files (`*.freezed.dart`, `*.g.dart`, `src/generated/`). Changes must be made in source files, then regenerate.

### Testing

```bash
# Run all tests (typical execution time: 2-5 minutes)
melos run test:all

# Or separately:
melos run test:dart     # Dart packages only (faster, ~1-2 min)
melos run test:flutter  # Flutter packages only (~2-3 min)
```

Tests are located in `test/` directories mirroring the `lib/` structure.

### Linting and Formatting

```bash
# Format code (ALWAYS run before committing)
melos run format

# Verify formatting (used in CI)
melos run format:verify

# Static analysis (ALWAYS run before committing)
melos run analyze

# Run all checks (format + analyze)
melos run lint:all
```

**Important**: CI will fail if code is not formatted correctly. Always run `melos run format` before committing.

### Building Sample App

```bash
cd sample_app
flutter build apk --release  # Android
flutter build ios --release  # iOS (requires macOS)
```

## Project Layout

### Main SDK Structure (`packages/stream_feeds/`)

```
lib/
├── stream_feeds.dart          # PUBLIC API - only import this
└── src/                       # INTERNAL - do not import directly
    ├── client/                # Client factory and implementation
    ├── cdn/                   # CDN API client (file uploads)
    ├── generated/             # OpenAPI-generated code (DO NOT EDIT)
    ├── models/                # Domain models (all @freezed classes)
    ├── repository/            # Data access layer (Result pattern)
    ├── state/                 # StateNotifier implementations
    ├── utils/                 # Utilities (filter, sort, batcher, uploader)
    └── ws/                    # WebSocket event handling
```

### Configuration Files (Root)

- `melos.yaml`: Monorepo config, dependencies, scripts (CENTRAL DEPENDENCY SOURCE)
- `analysis_options.yaml`: Dart analyzer rules
- `all_lint_rules.yaml`: Comprehensive lint rules
- `AGENTS.md`: Detailed AI agent documentation (read for deeper context)

## Architecture and Coding Patterns

### Core Principles

1. **Pure Dart SDK**: No Flutter dependencies in `packages/stream_feeds/`—can be used outside Flutter
2. **Immutable Data**: All models use `@freezed` with const constructors (Freezed 3.0 syntax with `@override`)
3. **Result Pattern**: Repository methods return `Result<T>`, NOT exceptions
4. **Public API Separation**: Only files in `lib/` root are public; everything in `lib/src/` is internal
5. **StateNotifier**: Reactive state management for high-level state objects

### Naming Conventions

- Models: `*Data` (e.g., `ActivityData`, `FeedData`)
- Queries: `*Query` (e.g., `ActivitiesQuery`)
- Requests: `*Request` (e.g., `FeedAddActivityRequest`)
- State: `*State` (e.g., `FeedState`)
- StateNotifier: `*StateNotifier` (e.g., `FeedStateNotifier`)

### Code Generation Workflow

When editing `@freezed` models:

1. Edit the `.dart` source file
2. Run `melos run generate:all`
3. Commit BOTH source and generated files

### Documentation Style

- Use `///` for public API documentation (follows Effective Dart)
- Use `//` for internal/private code comments
- Include examples for complex APIs

## CI/CD and Validation

### GitHub Actions Workflow

The main workflow (`.github/workflows/stream_feeds_flutter_workflow.yml`) runs on PRs and main branch:

1. **Analyze job** (~15 min):
   - `melos bootstrap`
   - `melos run analyze` (static analysis)
   - `melos run format:verify` (formatting check)
   - `melos run test:all` (all tests with coverage)
   - Uploads coverage to Codecov

2. **Build job** (~30 min):
   - `melos bootstrap`
   - `flutter build apk --release` (sample app)

**Critical**: PRs must pass both jobs. Common failures:
- Formatting: run `melos run format`
- Analysis errors: run `melos run analyze`
- Test failures: run `melos run test:all`

### Replicating CI Locally

```bash
# Full CI validation sequence
melos bootstrap
melos run analyze
melos run format:verify
melos run test:all

# Build sample app
cd sample_app && flutter build apk --release
```

## Common Pitfalls and Best Practices

### DO

- ✅ Run `melos bootstrap` after cloning or pulling changes
- ✅ Run `melos run generate:all` after modifying `@freezed` models
- ✅ Run `melos run format` before committing
- ✅ Use `Result<T>` pattern for error handling in repositories
- ✅ Test through public APIs, not internal StateNotifier implementations
- ✅ Keep `lib/stream_feeds.dart` as the single public entry point

### DON'T

- ❌ Edit generated files (`*.freezed.dart`, `*.g.dart`, `src/generated/`)
- ❌ Edit dependency versions in individual `pubspec.yaml` files (use `melos.yaml`)
- ❌ Import from `lib/src/` in external code (internal only)
- ❌ Throw exceptions in repository methods (use `Result.failure()`)
- ❌ Skip code generation after model changes

### Common Errors

**"Command not found: flutter/dart"**
- Install Flutter first: https://docs.flutter.dev/get-started/install
- Flutter includes Dart SDK

**"Version solving failed"**
- Run `melos bootstrap` to sync dependencies from `melos.yaml`

**"Missing generated files" / Build errors**
- Run `melos run generate:all`

**"Test failures in generated code"**
- Regenerate: `melos run generate:all`
- Generated code should not be manually edited

**CI formatting failures**
- Run `melos run format` before committing

## Quick Reference

```bash
# Initial setup
melos bootstrap

# Development cycle
melos run generate:all  # After model changes
melos run format        # Before committing
melos run analyze       # Check for issues
melos run test:all      # Run tests

# Full validation (matches CI)
melos bootstrap && melos run analyze && melos run format:verify && melos run test:all
```

## Additional Resources

- **AGENTS.md**: Comprehensive AI agent documentation with detailed patterns
- **README.md**: User-facing documentation and getting started guide
- **API Docs**: https://getstream.io/activity-feeds/docs/flutter/
- **Melos Docs**: https://melos.invertase.dev/
