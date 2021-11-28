part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.asyncLogout = const AsyncState.uninitialized(),
    this.asyncUser = const AsyncState.uninitialized(),
  });

  final AsyncState<bool> asyncLogout;
  final AsyncState<ApiReturnValue<User>> asyncUser;

  ProfileState copyWith({
    AsyncState<bool>? asyncLogout,
    AsyncState<ApiReturnValue<User>>? asyncUser,
  }) {
    return ProfileState(
      asyncLogout: asyncLogout ?? this.asyncLogout,
      asyncUser: asyncUser ?? this.asyncUser,
    );
  }

  @override
  List<Object> get props => [asyncUser, asyncLogout];
}
