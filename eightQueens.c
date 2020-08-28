  #include <stdio.h>
  #include <stdlib.h>
  #include <limits.h>


  typedef unsigned long ulong;


  static const ulong ulong_bit = sizeof(ulong) * CHAR_BIT;


  static inline ulong search(ulong lb, ulong cb, ulong rb, ulong cnt) {
    if (~0ul == cb)
      cnt += 1;
    else
      for (ulong bs = lb | cb | rb; ~0ul != bs;) {
        ulong b = ~bs & (bs+1);
        bs |= b;
        cnt = search((lb | b) << 1, cb | b, (rb | b) >> 1, cnt);
      }
    return cnt;
  }


  static inline ulong nQs(ulong m) { return search(0, ~0ul >> m, 0, 0); }


  int main(int argc, char* argv[]) {
    ulong a = argc < 2 ? ulong_bit : atol(argv[1]);
    ulong n = a < ulong_bit ? a : ulong_bit;
    for (ulong i=1; i<=n; ++i)
      printf("%li: %li total solutions\n", i, nQs(i));
    return 0;
  }
