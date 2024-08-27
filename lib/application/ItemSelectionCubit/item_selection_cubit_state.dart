import 'package:equatable/equatable.dart';

class ItemSelectionState extends Equatable {
  final String selectedItem;

  const ItemSelectionState({required this.selectedItem});

  @override
  List<Object> get props => [selectedItem];
}
