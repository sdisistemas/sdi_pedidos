abstract class SplashStates {}

class InitialSplashState extends SplashStates {}

class LoadingSplashState extends SplashStates {}

class SuccessCheckSplashState extends SplashStates {}

class ErrorSplashState extends SplashStates {
  final String message;

  ErrorSplashState({
    required this.message,
  });
}
