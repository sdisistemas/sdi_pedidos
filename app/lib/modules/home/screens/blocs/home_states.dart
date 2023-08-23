abstract class HomeStates {}

class InitialHomeState extends HomeStates {}

class LoadingHomeState extends HomeStates {}

class SuccessLogoutState extends HomeStates {}

class ErrorHomeState extends HomeStates {
  final String message;

  ErrorHomeState({
    required this.message,
  });
}
