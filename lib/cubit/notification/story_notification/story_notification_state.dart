part of 'story_notification_cubit.dart';

sealed class StoryNotificationState {}

final class StoryNotificationInitial extends StoryNotificationState {}

final class SendStoryNotificationSuccess extends StoryNotificationState {}

final class ShowStoryNotificationSuccess extends StoryNotificationState {}

final class StoryNotificationFailure extends StoryNotificationState {
  final String errorMessage;

  StoryNotificationFailure({required this.errorMessage});
}

