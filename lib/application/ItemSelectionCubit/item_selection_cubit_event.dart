import 'package:equatable/equatable.dart';

abstract class ItemSelectionEvent extends Equatable {
  const ItemSelectionEvent();

  @override
  List<Object> get props => [];
}

class SelectItemEvent extends ItemSelectionEvent {
  final String selectedItem;

  const SelectItemEvent(this.selectedItem);

  @override
  List<Object> get props => [selectedItem];
}
