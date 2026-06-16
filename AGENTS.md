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

### Core Principle: Test Through Public APIs Only

**All tests must be written from the perspective of a consuming app.** This means:

- **Test the SDK's public surface** — `FeedsClient`, `Feed`, and the state objects they expose
- **Never test internal implementation details** — no mapper methods (`.toModel()`), no repository classes, no `StateNotifier` implementations directly
- **If a consuming app cannot call it directly, do not test it directly**

Tests that directly call internal methods like `response.toModel()`, or that instantiate `*Repository` / `*StateNotifier` classes, are testing implementation details. These tests break on refactors without providing real coverage guarantees for app developers.

### Test Helpers

Tests use the `package:stream_feeds_test/stream_feeds_test.dart` package which provides:

- `feedsClientTest(...)` — for testing `FeedsClient` methods
- `feedTest(...)` — for testing `Feed` methods and state

These helpers:
1. Set up a fully wired client with a mocked HTTP API
2. Provide `tester.mockApi(...)` to stub specific HTTP responses
3. Provide `tester.verifyApi(...)` to assert that specific API calls were made
4. Provide `tester.emitEvent(...)` to simulate WebSocket events
5. Expose `tester.feed`, `tester.feedState`, and `tester.client` for assertions

### Mocking API Calls — Use Specific Request Objects, Not `any()`

**Always pass the exact expected request object to `mockApi` and `verifyApi`.** The mock only returns the stubbed response when the call matches exactly, so this simultaneously stubs the response _and_ validates what the SDK sent.

```dart
// ✅ CORRECT — specific request; mock only fires when the SDK sends this exact value
const request = CreateDeviceRequest(
  id: 'firebase-token-123',
  pushProvider: CreateDeviceRequestPushProvider.firebase,
  pushProviderName: 'MyApp Firebase',
);
tester.mockApi(
  (api) => api.createDevice(createDeviceRequest: request),
  result: createDefaultCreateDeviceResponse(),
);
final result = await tester.client.createDevice(
  id: 'firebase-token-123',
  pushProvider: PushNotificationsProvider.firebase,
  pushProviderName: 'MyApp Firebase',
);
tester.verifyApi((api) => api.createDevice(createDeviceRequest: request));
```

```dart
// ❌ WRONG — any() matches anything; the mock returns the response even if the SDK
//           sends the wrong request, hiding bugs
tester.mockApi(
  (api) => api.createDevice(createDeviceRequest: any(named: 'createDeviceRequest')),
  result: createDefaultCreateDeviceResponse(),
);
```

When you use specific request objects, you also **do not need `registerFallbackValue` or `setUpAll`** — those are only required by mocktail when `any()` matchers are used for custom types.

For nullable or primitive parameters (e.g., `hardDelete`, `folderId`) pass the exact value you expect the SDK to use:

```dart
// ✅ pass the actual expected value
tester.mockApi(
  (api) => api.deleteActivity(id: 'activity-1', hardDelete: false),
  result: const DeleteActivityResponse(duration: '0ms'),
);
```

### Correct Pattern — `feedsClientTest` example

```dart
import 'package:stream_feeds/stream_feeds.dart';          // ✅ public API only
import 'package:stream_feeds_test/stream_feeds_test.dart';

feedsClientTest(
  'should upsert activities successfully',
  body: (tester) async {
    final activities = [
      const ActivityRequest(feeds: ['user:123'], id: '1', text: 'Hello', type: 'post'),
    ];
    const request = UpsertActivitiesRequest(activities: activities);

    tester.mockApi(
      (api) => api.upsertActivities(upsertActivitiesRequest: request),
      result: createDefaultUpsertActivitiesResponse(count: 1),
    );

    final result = await tester.client.upsertActivities(activities: activities);

    expect(result.isSuccess, isTrue);
    tester.verifyApi(
      (api) => api.upsertActivities(upsertActivitiesRequest: request),
    );
  },
);
```

### Correct Pattern — `feedTest` example

```dart
feedTest(
  'deleteActivity() - should delete activity',
  build: (client) => client.feedFromId(feedId),
  setUp: (tester) => tester.getOrCreate(),
  body: (tester) async {
    tester.mockApi(
      (api) => api.deleteActivity(id: 'activity-1', hardDelete: false),
      result: const DeleteActivityResponse(duration: '0ms'),
    );

    final result = await tester.feed.deleteActivity(id: 'activity-1');

    expect(result.isSuccess, isTrue);
  },
  verify: (tester) => tester.verifyApi(
    (api) => api.deleteActivity(id: 'activity-1', hardDelete: false),
  ),
);
```

### Wrong Patterns — Never Do This

```dart
// ❌ Using any() — mock matches regardless of what the SDK sends
tester.mockApi(
  (api) => api.addActivity(addActivityRequest: any(named: 'addActivityRequest')),
  result: ...,
);

// ❌ Testing internal mapper directly
final response = createDefaultActivityResponse(id: 'act-1');
final model = response.toModel();   // tests implementation detail, not public API
expect(model.id, 'act-1');

// ❌ Instantiating a repository directly
final repo = ActivitiesRepository(apiClient);
final result = await repo.addActivity(request);

// ❌ Instantiating a StateNotifier directly
final notifier = FeedStateNotifier(feedId, repo);
notifier.state;
```

### What to Put in Each Test

- **State mutations**: assert the state via `tester.feedState` after calling a method
- **API calls**: verify with `tester.verifyApi(...)` that the correct HTTP call was made
- **Events**: use `tester.emitEvent(...)` to push a WebSocket event, then assert state changed
- **Emitted domain events**: use `expectLater(tester.client.stateUpdateEvents, emits(...))` to assert `StateUpdateEvent`s

### Test File Location

| What you're testing | Test file location |
|---|---|
| `FeedsClient` methods | `test/client/feeds_client_test.dart` |
| `Feed` methods and state | `test/state/feed_test.dart` |
| `ActivityList`, `CommentList`, etc. | `test/state/*_test.dart` |
| `FeedId` or pure model helpers | `test/models/*_test.dart` (pure Dart logic only, no mappers) |

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
4. **Test through public APIs only** — use `feedTest`/`feedsClientTest` helpers; never test mappers (`.toModel()`), repositories, or StateNotifiers directly; see the Testing Strategy section for correct patterns and anti-patterns
5. **Follow Freezed 3.0 syntax** with `@override` annotations for fields
6. **Keep public API minimal** - most code should be in `lib/src/`
7. **Use early returns** for validation and error cases
8. **Document public APIs** with `///` following Effective Dart guidelines
9. **Sync dependencies** via `melos bootstrap` after changes
10. **Check `.cursorrules`** for detailed implementation patterns

