abstract class ConfigurationStates {}

class InitialConfigurationState extends ConfigurationStates {}

class LoadingConfigurationState extends ConfigurationStates {}

class LoadedConfigurationState extends ConfigurationStates {
  final String internalIP;
  final String externalIP;
  final String port;
  final String selectedIP;

  LoadedConfigurationState({
    required this.internalIP,
    required this.externalIP,
    required this.port,
    required this.selectedIP,
  });
}

class SuccessSaveConfigurationState extends ConfigurationStates {}

class ErrorConfigurationState extends ConfigurationStates {
  final String message;

  ErrorConfigurationState({
    required this.message,
  });
}
