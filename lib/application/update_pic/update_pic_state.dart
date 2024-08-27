// ignore: duplicate_ignore

// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';



class UpdatePicState extends Equatable {
   XFile? file;

  UpdatePicState([this.file]);

  UpdatePicState copyWith({XFile? file}) {
    return UpdatePicState(file ?? this.file);
  }

  @override
  List<Object?> get props => [file];
}
class UpdateLoading extends UpdatePicState{}
