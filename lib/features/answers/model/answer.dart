class Answer {
  final int id;
  final Status status;

  Answer(this.id, this.status);
}

enum Status { known, unknown, notAnswered }