class Habitacion{
  late int? count_adults;
  late List<int>? ages_minors=[];

  Habitacion({
    this.count_adults,
    this.ages_minors,
  });

  Map toJson() => {"count_adults":this.count_adults, "ages_minors":this.ages_minors};
}