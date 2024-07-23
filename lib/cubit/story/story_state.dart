final class StoryState {}

final class AddStoryInitial extends StoryState {}

final class AddStoryLoading extends StoryState {}

final class AddStorySuccess extends StoryState {}

final class AddStoryFailure extends StoryState {
  final String errorMessage;

  AddStoryFailure({required this.errorMessage});
}

final class UploadStoryImageSuccess extends StoryState {}

final class UploadStoryImageFailure extends StoryState {
  final String errorMessage;

  UploadStoryImageFailure({required this.errorMessage});
}

final class UploadStoryVideoSuccess extends StoryState {}

final class UploadStoryVideoFailure extends StoryState {
  final String errorMessage;

  UploadStoryVideoFailure({required this.errorMessage});
}

final class GetStoryLoading extends StoryState {}

final class GetStorySuccess extends StoryState {}

final class GetStoryFailure extends StoryState {
  final String errorMessage;

  GetStoryFailure({required this.errorMessage});
}
