const configDefaultYamlContent = '''
name: UNKNOWN

core_generator:
  # Required
  dir_local_model: domain/lib/data/models/local
  # Required
  dir_remote_model: domain/lib/data/models/remote
  # Required
  dir_local_data_source: domain/lib/data/local_data_sources
  # Required
  dir_remote_data_source: domain/lib/data/remote_data_sources
  # Required
  dir_repository: domain/lib/repositories
  # Required
  dir_use_case: domain/lib/use_cases
  # Required
  dir_model: domain/lib/models
  # Optional
  web_locator: domain/lib/services/dependency_injection/service_locator.dart
  # Optional
  local_schema: domain/lib/services/local_database/_local_database.dart
  # Optional
  replace: false

flutter:
''';
