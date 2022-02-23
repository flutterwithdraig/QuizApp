String convertDurationAsTimeString(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String mins = twoDigits(duration.inMinutes.remainder(60));
  String secs = twoDigits(duration.inSeconds.remainder(60));
  return "${twoDigits(duration.inHours)}:$mins:$secs";
}
