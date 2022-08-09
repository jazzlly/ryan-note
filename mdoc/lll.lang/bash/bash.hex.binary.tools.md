### od && xxd
```sh

% echo -n "${IFS} \t\n\0"|od -t acx1u1
0000000   sp  ht  nl nul  sp  ht  nl nul
              \t  \n  \0      \t  \n  \0
          20  09  0a  00  20  09  0a  00
          32   9  10   0  32   9  10   0
0000010

% echo -n "${IFS} \t\n\0"|xxd -e
00000000: 000a0920 000a0920

```