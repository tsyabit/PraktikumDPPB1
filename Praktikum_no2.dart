import 'dart:io';

int go(int n) {
  int s = 0;
  int f = 1;
  for (int i = 2; i <= n; i++) {
    if (n % i == 0) {
      if (i - f > s) {
      s = i - f;
    }
  f = i;
  }
}
return s;
}

void main(){
  int n = 30;
  print('($n) = ${go(n)}');

  
}