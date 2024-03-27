# core

Generated properties figma file

## Install

```sh
dart pub global activate figma_gen_hd
```

## Uninstall

```sh
dart pub global deactivate figma_gen_hd
```

## Getting Started

```yaml
  dir_local_model: domain/lib/data/models/local
  dir_remote_model: domain/lib/data/models/remote
  dir_local_data_source: domain/lib/data/local_data_sources
  dir_remote_data_source: domain/lib/data/remote_data_sources
  dir_repository: domain/lib/repositories
  dir_use_case: domain/lib/use_cases
  dir_model: domain/lib/models
  web_locator: domain/lib/services/dependency_injection/service_locator.dart
  local_schema: domain/lib/services/local_database/_local_database.dart
  replace: false
```

## Use

```sh
# read me
core_gen -h
#sample
core_gen --all product
```
