import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:m11_ind/core/core.dart';

@injectable
class DateFilterCubit extends AppBaseCubit<DateFilter> {
  DateFilterCubit() : super(DateFilter.init());

  void setActiveDay(DateTime day) {
    final updatedDay = state.copyWith(day: day);
    emitSafeState(updatedDay);
  }

  void setActiveDayByName(String dayname) {
    final selectedDay = getDateTime(dayname);
    final updatedDay = state.copyWith(day: selectedDay);
    emitSafeState(updatedDay);
  }

  DateTime getDateTime(String dayname) {
    final dayNames = state.weekDays.map((e) => DFU.getDayNameFully(e)).toList();
    final index = dayNames.indexOf(dayname);
    final selectedDay = state.weekDays[index];
    return selectedDay;
  }
}

class DateFilter extends Equatable {

  factory DateFilter.init() {
    final now = DFU.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final weekDays = List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
    final activeDayIndex = now.weekday - DateTime.monday;
    return DateFilter(weekDays: weekDays, activeDay: weekDays[activeDayIndex]);
  }

  const DateFilter({required this.weekDays, required this.activeDay});

  final List<DateTime> weekDays;
  final DateTime activeDay;

  DateFilter copyWith({DateTime? day}) {
    return DateFilter(weekDays: weekDays, activeDay: day ?? activeDay);
  }
  
  @override
  List<Object?> get props => [weekDays, activeDay];
}