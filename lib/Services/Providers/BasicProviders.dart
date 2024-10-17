import 'package:flutter_riverpod/flutter_riverpod.dart';
// all are for now

// this is for the workspace image and index passing
class WorkspaceData {
  final String imagePath;
  final int index;

  WorkspaceData({required this.imagePath, required this.index});
}

class WorkspaceNotifier extends StateNotifier<WorkspaceData?> {
  WorkspaceNotifier() : super(null);

  void selectWorkspace(String imagePath, int index) {
    state = WorkspaceData(imagePath: imagePath, index: index);
  }
}

final workspaceProvider =
    StateNotifierProvider<WorkspaceNotifier, WorkspaceData?>((ref) {
  return WorkspaceNotifier();
});

// this is for the empty img to stay
class GoalsStateNotifier extends StateNotifier<bool> {
  GoalsStateNotifier() : super(false);
  void toggle() {
    state = !state;
  }

  void set(bool value) {
    state = value;
  }
}

final goalsStateProvider =
    StateNotifierProvider<GoalsStateNotifier, bool>((ref) {
  return GoalsStateNotifier();
});

class ActionStateNotifier extends StateNotifier<bool> {
  ActionStateNotifier() : super(false);
  void toggle() {
    state = !state;
  }

  void set(bool value) {
    state = value;
  }
}

final actionStateProvider =
    StateNotifierProvider<ActionStateNotifier, bool>((ref) {
  return ActionStateNotifier();
});
