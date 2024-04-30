part of 'group_get_media_files_cubit.dart';

@immutable
sealed class GroupGetMediaFilesState {}

final class GroupGetMediaFilesInitial extends GroupGetMediaFilesState {}

final class GroupGetMediaFilesLoading extends GroupGetMediaFilesState {}

final class GroupGetMediaSuccess extends GroupGetMediaFilesState {}

final class GroupGetFilesSuccess extends GroupGetMediaFilesState {}

final class GroupGetLinksSuccess extends GroupGetMediaFilesState {}

final class GroupGetVoiceSuccess extends GroupGetMediaFilesState {}

final class GroupGetMediaFilesFailure extends GroupGetMediaFilesState {
  final String errorMessage;

  GroupGetMediaFilesFailure({required this.errorMessage});
}
