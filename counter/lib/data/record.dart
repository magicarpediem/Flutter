class Record {
  String _date;
  int _serial;
  int _count;
  String _note;

  Record.fromJson(Map<String, dynamic> jsonElement)
      : _date = jsonElement['date'],
        _serial = jsonElement['serial'],
        _count = jsonElement['count'],
        _note = jsonElement['note'];

  String get date => _date;

  int get serial => _serial;

  int get count => _count;

  String get note => _note;

  @override
  String toString() {
    return 'Record{_dateString: $_date, _serial: $_serial, _count: $_count, _note: $_note}';
  }
}
