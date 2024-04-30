part of 'forward_selected_group_cubit.dart';

@immutable
sealed class ForwardSelectedGroupState {}

final class ForwardSelectedGroupInitial extends ForwardSelectedGroupState {}


final class ForwardSelectedGroupLoading extends ForwardSelectedGroupState {}

final class ForwardSelectedGroupSuccess extends ForwardSelectedGroupState {}

final class GetForwardSelectedGroupSuccess extends ForwardSelectedGroupState {}

final class DeleteForwardSelectedGroupSuccess extends ForwardSelectedGroupState {}

final class DeleteAllSelectedGroupSuccess extends ForwardSelectedGroupState {}