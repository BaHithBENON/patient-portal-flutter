enum AppointmentStatus {
  all('all', 'Tous'),
  upcoming('upcoming', 'A venir'),
  past('past', 'Passé'),
  canceled('canceled', 'Annulé');

  final String value;
  final String label;
  const AppointmentStatus(this.value, this.label);

  bool get isAll => AppointmentStatus.all == this;
  bool get isUpcoming => AppointmentStatus.upcoming == this;
  bool get isPast => AppointmentStatus.past == this;
  bool get isCanceled => AppointmentStatus.canceled == this;

  static AppointmentStatus? fromString(String? status) {
    if (status == null) return null;

    for (var s in AppointmentStatus.values) {
      if (s.value == status) return s;
    }

    if (status == AppointmentStatus.all.name) return AppointmentStatus.all;
    if (status == AppointmentStatus.upcoming.name) return AppointmentStatus.upcoming;
    if (status == AppointmentStatus.past.name) return AppointmentStatus.past;
    if (status == AppointmentStatus.canceled.name) return AppointmentStatus.canceled;
    
    return null;
  }  
}