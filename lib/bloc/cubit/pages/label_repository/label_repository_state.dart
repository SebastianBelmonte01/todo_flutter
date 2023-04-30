part of 'label_repository_cubit.dart';

class LabelRepositoryState extends Equatable {
  final PageStatus status;
  final List<Label> labels;
  final int selectedLabelIndex;

  const LabelRepositoryState({
    this.status = PageStatus.initial,
    this.labels =  const [],
    this.selectedLabelIndex = 0,
  });

  LabelRepositoryState copyWith({
    PageStatus? status,
    List<Label>? labels,
    int? selectedLabelIndex,
  }) {
    return LabelRepositoryState(
      status: status ?? this.status,
      labels: labels ?? this.labels,
      selectedLabelIndex: selectedLabelIndex ?? this.selectedLabelIndex,
    );
  }

  @override
  List<Object> get props => [
    status,
    labels,
    selectedLabelIndex
  ];
}

