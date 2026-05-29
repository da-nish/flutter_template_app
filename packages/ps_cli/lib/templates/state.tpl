class {{FeatureName}}State {
    final bool loading;

    {{FeatureName}}State({required this.loading});

    factory {{FeatureName}}State.initial(){
        return {{FeatureName}}State(loading: false);
    }

    {{FeatureName}}State copyWith({
    bool? loading
  }) {
    return {{FeatureName}}State(
      loading: loading ?? this.loading,
    );
  }

}