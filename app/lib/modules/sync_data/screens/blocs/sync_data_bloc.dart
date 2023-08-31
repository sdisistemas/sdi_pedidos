// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sdi_pedidos/interfaces/services/storage_interface.dart';
import 'package:sdi_pedidos/modules/sync_data/screens/blocs/sync_data_events.dart';
import 'package:sdi_pedidos/modules/sync_data/screens/blocs/sync_data_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdi_pedidos/modules/sync_data/domain/sync_params.dart';
import 'package:sdi_pedidos/modules/sync_data/repositories/sync_repository.dart';

class SyncDataBloc extends Bloc<SyncDataEvents, SyncDataStates> {
  final IStorage storage;
  final ISyncRepository syncRepository;

  SyncDataBloc({
    required this.storage,
    required this.syncRepository,
  }) : super(InitialSyncDataState()) {
    on<SyncDataEvent>(_syncData);
  }

  Future _syncData(SyncDataEvent event, emit) async {
    emit(LoadingSyncDataState());

    final params = SyncAllClientsParams(codEmpresa: 1);

    final result = await syncRepository.syncAllClients(params);

    result.fold(
      (success) => emit(SuccessSyncDataState()),
      (failure) => emit(ErrorSyncDataState(message: failure.message)),
    );
  }
}
