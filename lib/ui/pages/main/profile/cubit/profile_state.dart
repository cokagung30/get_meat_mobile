part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.asyncLogout = const AsyncState.uninitialized(),
  });

  final AsyncState<bool> asyncLogout;

  ProfileState copyWith({
    AsyncState<bool>? asyncLogout,
  }) {
    return ProfileState(
      asyncLogout: asyncLogout ?? this.asyncLogout,
    );
  }

  @override
  List<Object> get props => [];
}
