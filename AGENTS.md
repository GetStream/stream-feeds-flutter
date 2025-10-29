# AGENTS.md

This file provides essential context for AI agents and developers working on the Stream Feeds Flutter/Dart SDK.

## Project Overview

This is the **official Flutter/Dart SDK** for Stream Feeds API v3, a scalable activity feed service. The repository contains:

- **Low-level SDK** (`packages/stream_feeds/`): Pure Dart SDK for Stream Feeds API v3
- **Sample App** (`sample_app/`): Flutter demo application showcasing SDK usage
- **Documentation** (`docs/`): Code snippets and examples

## Repository Structure

```
stream-feeds-flutter/
├── packages/
│   └── stream_feeds/          # Main SDK package
│       ├── lib/
│       │   ├── stream_feeds.dart    # Public API entry point
│       │   └── src/
│       │       ├── client/          # Client implementation
│       │       ├── cdn/             # CDN API client
│       │       ├── generated/       # OpenAPI-generated API code
│       │       ├── models/           # Domain models (@freezed)
│       │       ├── repository/      # Data access layer
│       │       ├── resolvers/       # Feature resolvers
│       │       ├── state/           # State objects and handlers
│       │       ├── utils/           # Utility classes (filter, sort, batcher, uploader)
│       │       └── ws/              # WebSocket event handling
│       └── test/                     # Test suite
├── sample_app/                  # Flutter demo app
├── docs/                        # Documentation and examples
└── scripts/                     # Build and generation scripts
```

## Architecture Principles

### Core Design Patterns

1. **Pure Dart**: The low-level SDK (stream_feeds) is pure Dart and has no platform-specific dependencies. It can be used outside of Flutter.
2. **Layered Architecture**: Clear separation between client, core, data, presentation, and state layers
3. **Immutable Data**: All models use `@freezed` with const constructors
4. **Reactive State**: StateNotifier-based state management with automatic change notifications
5. **Result Pattern**: Explicit error handling using Result types (not exceptions)
6. **Public API Focus**: Clean separation between public API (`lib/`) and internal implementation (`lib/src/`)

### Layer Responsibilities

- **Client Layer** (`src/client/`): Client factory and implementation
- **Models** (`src/models/`): Domain models, queries, and business logic (all `@freezed` data classes)
- **Repository Layer** (`src/repository/`): Data access layer with Result pattern
- **State Management** (`src/state/`): StateNotifier implementations and high-level state objects (Feed, ActivityList, etc.)
- **Utilities** (`src/utils/`): Helper classes for filtering, sorting, batching, and file uploads
- **WebSocket** (`src/ws/`): Real-time event handling and WebSocket connections
- **CDN** (`src/cdn/`): CDN API client for file uploads
- **Generated** (`src/generated/`): OpenAPI-generated API client code

## Code Generation

The project uses extensive code generation:

### Generated Code

1. **OpenAPI Client** (`src/generated/api/`): Auto-generated from OpenAPI spec
   - Generated via `scripts/generate.sh`
   - Includes API models, endpoints, and serialization

2. **Freezed Models** (`*.freezed.dart`): Immutable data classes
   - Run: `melos run generate:all`
   - Uses `freezed` and `json_serializable`

3. **Retrofit** (`*.g.dart`): HTTP client generation
   - Uses `retrofit_generator` for API client methods

### Running Code Generation

```bash
# Generate all (Dart + Flutter packages)
melos run generate:all

# Generate only Dart packages
melos run generate:dart

# Generate only Flutter packages
melos run generate:flutter

# Generate OpenAPI client (requires OpenAPI spec)
melos run gen:feeds
```

**Important**: Never manually edit generated files. All changes must be made in source files or OpenAPI specs.

## Coding Standards

### Data Models

- Use `@freezed` for all data classes
- Follow Freezed 3.0 mixed mode syntax with `@override` annotations
- All models should have an `id` field when representing entities
- Place custom data fields last in constructors and class definitions

Example:
```dart
@freezed
class ActivityData with _$ActivityData {
  const ActivityData({
    required this.id,
    required this.user,
    this.custom,
  });

  @override
  final String id;
  @override
  final UserData user;
  @override
  final Map<String, Object>? custom;
}
```

### State Management

- Use StateNotifier for reactive state management
- State classes must use `@freezed` with const constructors
- High-level state objects (Feed, ActivityList) are the public API
- StateNotifier implementations are internal details

### Repository Pattern

- All repository methods return `Result<T>` types
- Use early return patterns for validation and errors
- Use extension functions for API-to-domain model mapping
- Never throw exceptions - always return Result types

Example:
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

### Documentation

- Use `///` for public API documentation
- Use `//` for internal/private code
- Follow Effective Dart documentation guidelines
- Include examples for complex APIs

## Testing Strategy

### Test Structure

- Tests mirror the `lib/` structure in `test/`
- Focus on testing through public APIs only
- Use HTTP interceptors instead of mocking repositories
- Test StateNotifier behavior through high-level state objects

### Running Tests

```bash
# Run all tests
melos run test:all

# Run Dart tests only
melos run test:dart

# Run Flutter tests only
melos run test:flutter
```

## Dependencies & Monorepo

### Melos Workspace

This is a **Melos monorepo** for managing multiple packages:

- All dependencies are defined in `melos.yaml`
- **Never** edit `pubspec.yaml` environment or dependency versions directly
- Use `melos bootstrap` to sync dependencies after changes

### Adding Dependencies

1. Add dependency to `packages/stream_feeds/pubspec.yaml`
2. Add it to `melos.yaml` dependencies list
3. Run `melos bootstrap` to sync

### Key Dependencies

- **state_notifier**: Reactive state management
- **freezed**: Immutable data classes
- **dio**: HTTP client
- **retrofit**: Type-safe HTTP client
- **stream_core**: Core HTTP/WSS infrastructure

See `melos.yaml` for complete dependency list.

## Development Workflow

### Code Quality

```bash
# Format code
melos run format

# Verify formatting
melos run format:verify

# Run static analysis
melos run analyze

# Run linting + formatting
melos run lint:all
```

### Common Tasks

1. **Making Changes to Models**:
   - Edit the `.dart` model file
   - Run `melos run generate:all`
   - Commit both source and generated files

2. **Updating OpenAPI Client**:
   - Update OpenAPI spec (if you have access)
   - Run `melos run gen:feeds`
   - Review generated changes in `src/generated/`

3. **Adding New Features**:
   - Create models in `src/models/`
   - Add repositories in `src/repository/`
   - Create state objects in `src/state/`
   - Export in `lib/stream_feeds.dart` if public API

## File Organization Rules

### Public vs Internal

- **Public API**: Files in `lib/` root
- **Internal**: Everything in `lib/src/`

### Naming Conventions

- Models: `*Data` (e.g., `ActivityData`, `FeedData`)
- Queries: `*Query` (e.g., `ActivitiesQuery`, `FeedsQuery`)
- Requests: `*Request` (e.g., `FeedAddActivityRequest`)
- State: `*State` (e.g., `FeedState`, `ActivityListState`)
- StateNotifier: `*StateNotifier` (e.g., `FeedStateNotifier`)

## Important Files

- `.cursorrules`: Primary development rules for AI assistants
- `.cursor/rules/`: Supplementary documentation for specific patterns
- `analysis_options.yaml`: Dart analyzer configuration
- `melos.yaml`: Monorepo configuration and dependencies
- `scripts/generate.sh`: OpenAPI client generation script

## WebSocket & Real-time

- Real-time updates via WebSocket connections
- Event handlers in `src/ws/events/`
- Events use `@freezed` for type-safe event handling
- State objects automatically update from WebSocket events

## Versioning

- SDK uses semantic versioning
- Version managed in `packages/stream_feeds/pubspec.yaml`
- Versioning mode: independent (per-package)

## Getting Help

- **Documentation**: Check `docs/` for code examples
- **API Docs**: https://getstream.io/activity-feeds/docs/flutter/
- **Cursor Rules**: See `.cursorrules` and `.cursor/rules/` for detailed patterns

## Quick Reference

```bash
# Setup
melos bootstrap

# Generate code
melos run generate:all

# Test
melos run test:all

# Format & lint
melos run lint:all

# Clean
melos run clean:flutter
```

## Important Notes for AI Agents

1. **Always run code generation** after modifying `@freezed` models or OpenAPI specs
2. **Never edit generated files** (`*.freezed.dart`, `*.g.dart`, `src/generated/`)
3. **Use Result pattern** for error handling, not exceptions
4. **Test through public APIs** only, not internal StateNotifier implementations
5. **Follow Freezed 3.0 syntax** with `@override` annotations for fields
6. **Keep public API minimal** - most code should be in `lib/src/`
7. **Use early returns** for validation and error cases
8. **Document public APIs** with `///` following Effective Dart guidelines
9. **Sync dependencies** via `melos bootstrap` after changes
10. **Check `.cursorrules`** for detailed implementation patterns

