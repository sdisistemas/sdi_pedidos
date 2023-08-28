import 'package:sdi_pedidos/core_module/services/api.dart';
import 'package:sdi_pedidos/interfaces/services/storage_interface.dart';
import 'package:sdi_pedidos/modules/auth/services/auth_service_interface.dart';
import 'package:sdi_pedidos/modules/configuration/screens/blocs/configuration_events.dart';
import 'package:sdi_pedidos/modules/configuration/screens/blocs/configuration_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvents, ConfigurationStates> {
  final IStorage storage;
  final IAuthService service;
  final Api api;

  ConfigurationBloc({
    required this.storage,
    required this.service,
    required this.api,
  }) : super(InitialConfigurationState()) {
    on<LoadConfigurationEvent>(_loadConfiguration);
    on<SaveConfigurationEvent>(_saveConfiguration);
  }

  Future<void> _loadConfiguration(
      LoadConfigurationEvent event, Emitter<ConfigurationStates> emit) async {
    try {
      final internalIP = await storage.read('internal_ip') ?? "";
      final externalIP = await storage.read('external_ip') ?? "";
      final port = await storage.read('port') ?? "";
      final selectedIP = await storage.read('selected_ip') ??
          "internal"; // default to internal
      emit(LoadedConfigurationState(
          internalIP: internalIP,
          externalIP: externalIP,
          port: port,
          selectedIP: selectedIP));
    } catch (error) {
      emit(ErrorConfigurationState(message: error.toString()));
    }
  }

  Future<void> _saveConfiguration(
      SaveConfigurationEvent event, Emitter<ConfigurationStates> emit) async {
    try {
      await storage.save('internal_ip', event.internalIP);
      await storage.save('external_ip', event.externalIP);
      await storage.save('port', event.port);
      await storage.save('selected_ip', event.selectedIP); // Save the IP choice
      api.setupDio();
      emit(SuccessSaveConfigurationState());
    } catch (error) {
      emit(ErrorConfigurationState(message: error.toString()));
    }
  }
}
