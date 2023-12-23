class Stack<E> {
  // implements stack
  Stack() : _storage = <E>[];
  final List<E> _storage;

  @override
  String toString() {
    return '--- Top ---\n'
        '${_storage.reversed.join('\n')}'
        '\n-----------';
  }

  void push(E element) => _storage.add(element);

  E pop() => _storage.removeLast();

  E get peek => _storage.last;

  int get length => _storage.length;

  void clear() => _storage.clear();

  E get first => _storage.last;

  bool get isEmpty => _storage.isEmpty;

  bool get isNotEmpty => !isEmpty;

  Stack.of(Iterable<E> elements) : _storage = List<E>.of(elements);
}

void main() {
  const string = 'Hello((())) world!';
  final splitted =
      string.split(''); // to split the string and turn it into characters
  int right = 0; // counter to count the (
  int left = 0; // counter to count the )
  final charsStack =
      Stack.of(splitted); // to put the splitted string in a stack

  int stackLength = charsStack.length; // to get the length of the stack
  for (int i = 0; i < stackLength; i++) {
    if (charsStack.first == '(')
      right++;
    else if (charsStack.first == ')') left++;

    charsStack.pop();
  }
  if (right == left) //to check if the brackets are balanced
    print("true");
  else
    print("false");
}
