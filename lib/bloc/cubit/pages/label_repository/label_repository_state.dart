part of 'label_repository_cubit.dart';

class LabelRepositoryState extends Equatable {
  final PageStatus status;
  final List<Label> labels;

  const LabelRepositoryState({
    this.status = PageStatus.initial,
    this.labels =  const [],
  });

  LabelRepositoryState copyWith({
    PageStatus? status,
    List<Label>? labels,
  }) {
    return LabelRepositoryState(
      status: status ?? this.status,
      labels: labels ?? this.labels,
    );
  }

  @override
  List<Object> get props => [
    status,
    labels
  ];
}

