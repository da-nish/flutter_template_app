class WhatnextState {
    final bool loading;

    WhatnextState({required this.loading});

    factory WhatnextState.initial(){
        return WhatnextState(loading: false);
    }

    WhatnextState copyWith({
    bool? loading
  }) {
    return WhatnextState(
      loading: loading ?? this.loading,
    );
  }

}