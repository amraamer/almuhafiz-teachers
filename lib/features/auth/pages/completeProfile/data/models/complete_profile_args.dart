class CompleteProfileArgs {
  final String userId;
  final String email;
  final String? name;

  CompleteProfileArgs({
    required this.userId,
    required this.email,
    this.name,
  });
}
