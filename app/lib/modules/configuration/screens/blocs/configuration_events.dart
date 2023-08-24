abstract class ConfigurationEvents {}

class LoadConfigurationEvent extends ConfigurationEvents {}

class SaveConfigurationEvent extends ConfigurationEvents {
  final String internalIP;
  final String externalIP;
  final String port;
  final String selectedIP; // 'internal' ou 'external'

  SaveConfigurationEvent(
      {required this.internalIP,
      required this.externalIP,
      required this.port,
      required this.selectedIP});
}
