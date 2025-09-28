import 'dart:io';

void main() {
  // Baca input
  String? line1 = stdin.readLineSync();
  if (line1 == null) return;
  int B = int.parse(line1.trim());

  String? line2 = stdin.readLineSync();
  if (line2 == null) return;
  String S = line2.trim();

  int N = S.length;
  const int MOD = 1000000007;

  // dp[i] = banyaknya cara untuk membagi suffix S[i..N)
  List<int> dp = List<int>.filled(N + 1, 0);
  dp[N] = 1; // basis: string kosong hanya punya 1 cara

  // Hitung dari belakang
  for (int i = N - 1; i >= 0; i--) {
    int maxL = (N - i < 6 ? N - i : 6); // panjang potongan maksimum = 6
    for (int L = 1; L <= maxL; L++) {
      String sub = S.substring(i, i + L);

      // Tidak boleh leading zero jika panjang > 1
      if (L > 1 && sub[0] == '0') continue;

      int d;
      try {
        d = int.parse(sub);
      } catch (e) {
        continue; // jika gagal parse, skip
      }

      if (d < B) {
        dp[i] = (dp[i] + dp[i + L]) % MOD;
      }
    }
  }

  // Hitung jawaban dari awal string
  int ans = 0;
  int maxL = (N < 6 ? N : 6);
  for (int L = 1; L <= maxL; L++) {
    String sub = S.substring(0, L);

    if (L > 1 && sub[0] == '0') continue;

    int d;
    try {
      d = int.parse(sub);
    } catch (e) {
      continue;
    }

    if (d < B && (d >= 1 || L == N)) {
      ans = (ans + dp[L]) % MOD;
    }
  }

print(dp[0]);

}
