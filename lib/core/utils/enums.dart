enum LoadState { loading, idle, success, error, loadmore, done }

enum LoginLoadState { loading, idle, success, error, unverified }

enum CurrentState { loggedIn, onboarded, initial }

enum OverLayType { loader, message, none }

enum MessageType { error, success }

enum OtpType { email, phone }

enum HomeIndex { home, order, history, profile }

enum Gender { MALE, FEMALE }

extension LoadExtension on LoadState {
  bool get isLoading => this == LoadState.loading;
  bool get isLoaded => this == LoadState.success;
  bool get isError => this == LoadState.error;
  bool get isInitial => this == LoadState.idle;
  bool get isLoadMore => this == LoadState.loadmore;
  bool get isCompleted => this == LoadState.done;
}

enum BillType {
  airtime(name: 'airtime'),
  data(name: 'data'),
  electricity(name: 'electricity'),
  cable(name: 'cable-tv');

  const BillType({
    required this.name,
  });
  final String name;
}

enum ActivityStatus { inApp, loggedOut }
