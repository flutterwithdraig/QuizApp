class AppUser {
  final String uid;
  final String displayName;
  final bool isGuest;
  AppUser({
    required this.uid,
    required this.displayName,
    required this.isGuest,
  });

  factory AppUser.empty() => AppUser(
        uid: '',
        displayName: '',
        isGuest: true,
      );
}
