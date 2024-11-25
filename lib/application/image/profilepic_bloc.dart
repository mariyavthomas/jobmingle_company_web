import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profilepic_event.dart';
part 'profilepic_state.dart';

class ProfilepicBloc extends Bloc<ProfilepicEvent, ProfilepicState> {
  ProfilepicBloc() : super(ProfilepicInitial()) {
    on<ProfilepicEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
