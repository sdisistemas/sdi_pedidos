abstract class ConfigurationStates {}

class InitialConfigurationState extends ConfigurationStates {}

class LoadingConfigurationState extends ConfigurationStates {}

class SuccessCheckConfigurationState extends ConfigurationStates {}

class ErrorConfigurationState extends ConfigurationStates {
  final String message;

  ErrorConfigurationState({
    required this.message,
  });
}
