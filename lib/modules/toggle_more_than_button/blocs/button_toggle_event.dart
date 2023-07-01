enum ButtonIndex {
  button1("button 1"),
  button2("button 2"),
  button3("button 3"),
  button4("button 4");

  const ButtonIndex(this.description);

  final String description;
}

class ButtonToggleEvent {
  final ButtonIndex index;

  ButtonToggleEvent(this.index);
}
