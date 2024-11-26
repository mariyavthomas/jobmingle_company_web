import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_mingle_web/domain/candidate_model.dart';
import 'package:job_mingle_web/infrastructure/chatrepo.dart';



part 'chat_room_event.dart';
part 'chat_room_state.dart';

class ChatRoomBloc extends Bloc<ChatRoomEvent, ChatRoomState> {
  MessageRepo _messageRepo = MessageRepo();
  ChatRoomBloc(this._messageRepo) : super(ChatRoomState()) {
    on<getChatListEvent>(_getChatlist);
  }

  FutureOr<void> _getChatlist(
      getChatListEvent event, Emitter<ChatRoomState> emit) async {
    try {
      emit(ChatLaodingState());
      List< CandidateModel> list = await _messageRepo.getChatUsers(event.search);
      Future.delayed(Duration(seconds: 4));
      emit(ChatLoadedState(ChatList: list));
    } catch (e) {
      throw Exception(e);
    }
  }
}
