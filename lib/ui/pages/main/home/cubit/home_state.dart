part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.user = const AsyncState.uninitialized(),
  });

  final AsyncState<User> user;

  HomeState copyWith({
    AsyncState<User>? user,
  }) {
    return HomeState(
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [user];
}
