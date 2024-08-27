import 'package:bloc/bloc.dart';

import 'package:job_mingle_web/application/ItemSelectionCubit/item_selection_cubit_state.dart';

part 'item_selection_state.dart';

class ItemSelectionCubit extends Cubit<ItemSelectionState> {
  ItemSelectionCubit() : super(ItemSelectionState(selectedItem: 'Dashboard'));

  void selectItem(String item) {
    emit(ItemSelectionState(selectedItem: item));
  }
}
