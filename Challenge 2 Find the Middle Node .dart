import 'dart:ffi';

class Node<T> {
  Node({required this.value, this.next});
  T value;
  Node<T>? next;
}

class LinkedList<E> extends Iterable<E> {
  @override
  Iterator<E> get iterator => _LinkedListIterator(this);
  Node<E>? head;
  Node<E>? tail;

  @override
  bool get isEmpty => head == null;

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }

  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  void append(E value) {
    // 1
    if (isEmpty) {
      push(value);
      return;
    }

    // 2
    tail!.next = Node(value: value);

    // 3
    tail = tail!.next;
  }

  Node<E>? nodeAt(int index) {
    // 1
    var currentNode = head;
    var currentIndex = 0;

    // 2
    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex += 1;
    }
    return currentNode;
  }

  Node<E> insertAfter(Node<E> node, E value) {
    // 1
    if (tail == node) {
      append(value);
      return tail!;
    }

    // 2
    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  E? pop() {
    final value = head?.value;
    head = head?.next;
    if (isEmpty) {
      tail = null;
    }
    return value;
  }

  E? removeLast() {
    // 1
    if (head?.next == null) return pop();

    // 2
    var current = head;
    while (current!.next != tail) {
      current = current.next;
    }

    // 3
    final value = tail?.value;
    tail = current;
    tail?.next = null;
    return value;
  }

  E? removeAfter(Node<E> node) {
    final value = node.next?.value;
    if (node.next == tail) {
      tail = node;
    }
    node.next = node.next?.next;
    return value;
  }
}

class _LinkedListIterator<E> implements Iterator<E> {
  _LinkedListIterator(LinkedList<E> list) : _list = list;
  final LinkedList<E> _list;

  Node<E>? _currentNode;

  @override
  E get current => _currentNode!.value;

  bool _firstPass = true;

  @override
  bool moveNext() {
    // 1
    if (_list.isEmpty) return false;

    // 2
    if (_firstPass) {
      _currentNode = _list.head;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?.next;
    }

    // 3
    return _currentNode != null;
  }
}

int findTheMiddleElement(LinkedList<int> list) {
  int eCounter = 0; //counter to count the number of elements
  for (final element in list) {
    eCounter++;
  }
  double mid = eCounter / 2; // find the middle index element
  int returnedElement = -1;
  int middleIndex = mid.floor(); //to get the int middle element
  int middleElementCounter = 0;
  for (final element in list) {
    if (middleElementCounter == middleIndex) {
      returnedElement =
          element; // to save the middle element value in a variable
    }
    middleElementCounter++;
  }
  return returnedElement;
}

void main() {
  var list = LinkedList<int>();
  list.push(5);
  list.push(4);
  list.push(3);
  list.push(2);
  list.push(1);

  print(findTheMiddleElement(list));
}
