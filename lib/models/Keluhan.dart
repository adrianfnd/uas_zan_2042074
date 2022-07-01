class Keluhan {
  final int id;
  final String Date;
  final String Nama;
  final String Keluh;


  Keluhan({ this.id, this.Date, this.Nama, this.Keluh,});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': Date,
      'nama': Nama,
      'keluh': Keluh,
    };
  }
  @override
  String toString() {
    return 'Keluhan{id: $id, Date: $Date, Keluh: $Keluh}';
  }

}