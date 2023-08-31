abstract class SyncDataStates {}

class InitialSyncDataState extends SyncDataStates {}

class LoadingSyncDataState extends SyncDataStates {}

class SuccessSyncDataState extends SyncDataStates {}

class ErrorSyncDataState extends SyncDataStates {
  final String message;

  ErrorSyncDataState({
    required this.message,
  });
}
