enum JustButtonIndex {
  justButton1("Button 1"),
  justButton2("Button 2");

  const JustButtonIndex(this.description);

  final String description;
}

class JustToggleEvent {
  final JustButtonIndex index;

  JustToggleEvent(this.index);
}
