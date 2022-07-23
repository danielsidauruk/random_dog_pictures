class RandomDogResult {
  RandomDogResult({
    required this.message,
    required this.status,
  });

  String message;
  String status;

  factory RandomDogResult.fromJson(Map<String, dynamic> json) => RandomDogResult(
    message: json["message"],
    status: json["status"],
  );
}
