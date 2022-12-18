class DateFilter {
  int? day;
  int? hour;
  int? minute;
  int? seconds;
  String text;

  DateFilter({
    this.day,
    this.hour,
    this.minute,
    this.seconds,
    required this.text,
  });
}
