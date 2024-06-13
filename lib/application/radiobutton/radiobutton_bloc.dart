import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'radiobutton_event.dart';
part 'radiobutton_state.dart';

class RadiobuttonBloc extends Bloc<RadiobuttonEvent, RadiobuttonState> {
  RadiobuttonBloc() : super(RadiobuttonInitial()) {
    on<RadiobuttonEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
