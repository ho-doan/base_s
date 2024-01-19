# CLEAN ARCHITECTURE

![clean architecture](./images/Clean-Architecture-Flutter-Diagram.webp)

## Feature

1. Architecture: Clean Architecture
2. State management: flutter_bloc
3. Navigation: go_router, go_router_builder
4. DI: get_it, injectable
5. REST API: dio, retrofit
6. DATABASE: isar
7. Shared Preferences: shared_preferences, encrypted_shared_preferences
8. Data class: freezed
9. Lint: flutter_lints
10. CI/CD: Github Actions
11. Unit Test: mocktail, bloc_test, ...
12. Paging: pull_to_refresh
13. Utils: rxdart, dartx, dartz, async
14. Assets generator: flutter_gen_runner, flutter_launcher_icons, flutter_native_splash
15. Shimmer loading effect

## Getting Started

### Git flow

#### Branch Rule

```sh
- master    # main branch
- stg       # stg branch
- dev       # dev branch
- feature/* # code feature
- bug/*     # code feature
```

### Requirements

- Dart: 3.2.0
- Flutter: 3.16.0
- DevTools: 2.28.0
- CocoaPods: 1.13.0
- Melos: 2.9.0

### Install

#### Melos

```sh
dart pub global activate melos 2.9.0
```

### Config and run app

- pub get all

```sh
melos pub
```

- build all

```sh
melos build
```

- test all

```sh
melos test
```

### Directory Structure

```yml
|-- common
|   |-- lib
|   |   |-- language
|   |   |-- utils
|   |   |   |-- constant
|   |   |   |-- extensions
|   |   |-- system
|   |   |   |-- themes
|   |   |   |-- widgets
|-- domain
|   |-- lib
|   |   |-- core
|   |   |   |-- env
|   |   |   |   |-- env.dart
|   |   |-- data
|   |   |   |-- models
|   |   |   |   |-- local
|   |   |   |   |   |-- local.dart
|   |   |   |   |-- remote
|   |   |   |   |   |-- remote.dart
|   |   |   |   |-- models.dart
|   |   |   |-- local_data_sources
|   |   |   |   |-- local_data_sources.dart
|   |   |   |-- remote_data_sources
|   |   |   |   |-- remote_data_sources.dart
|   |   |-- models
|   |   |   |-- models.dart
|   |   |-- repositories
|   |   |   |-- repositories.dart
|   |   |-- use_cases
|   |   |   |-- use_cases.dart
|   |   |-- services
|   |   |   |-- dependency_injection
|   |   |   |   |-- service_locator.dart
|   |   |   |-- local_database
|   |   |   |   |-- local_database.dart
|   |   |   |-- network
|   |   |   |   |-- api_client.dart
|-- template
|   |-- lib
|   |   |-- core
|   |   |   |-- router
|   |   |   |   |-- router_path.dart
|   |   |   |   |-- router.dart
|   |   |   |-- services
|   |   |   |   |-- dependency_injection
|   |   |   |   |   |-- service_locator.dart
|   |   |-- feature
|   |   |   |-- feature_a
|   |   |   |   |-- bloc
|   |   |   |   |   |-- a_bloc.dart
|   |   |   |   |   |-- a_event.dart
|   |   |   |   |   |-- a_state.dart
|   |   |   |   |-- widgets
|   |   |   |   |-- feature_a_screen.dart
|-- CHANGELOG.md
|-- release-notes.md
|-- melos.yaml
```

### Test App Directory Structure

```yml
|-- integration_test
|   |-- feature
|   |   |-- feature_a
|   |   |   |-- feature_a_test.dart
|-- test
|   |-- utils
|   |   |-- dummy
|   |   |   |-- model_dummy
|   |   |   |   |-- model_dummy.dart
|   |-- golden
|   |   |-- feature_a
|   |   |   |-- goldens
|   |   |   |-- step
|   |   |   |-- feature_a_test.dart
|   |-- unit
|   |   |-- feature_a
|   |   |   |-- feature_a_test.dart
|   |-- widget
|   |   |-- widget_a
|   |   |   |-- widget_a_test.dart
```

### Test Domain Directory Structure

```yml
|-- data
|   |-- models
|   |   |-- model_a
|   |   |   |-- model_a_test.dart
|   |-- local_data_sources
|   |   |-- data_source_a
|   |   |   |-- data_source_a_test.dart
|   |-- remote_data_sources
|   |   |-- data_source_a
|   |   |   |-- data_source_a_test.dart
|-- models
|   |-- model_a
|   |   |-- model_a_test.dart
|-- repositories
|   |-- repository_a
|   |   |-- repository_a_test.dart
|-- services
|   |-- di
|   |   |-- di_test.dart
|-- use_cases
|   |-- use_case_a
|   |   |-- use_case_a_test.dart
|-- utils
|   |-- dummy
|   |   |-- a_dummy.dart
```
