void main() {
  List<int> list = [1, 2, 3, 4, 5]; 
  
  printReversed(list);//calling function
}

void printReversed(List<int> list) {
  int length = list.length;// the size of the list
  for (int i = length - 1; i >= 0; i--) {
    print(list[i]); // print the list in reversing order
  }
}
