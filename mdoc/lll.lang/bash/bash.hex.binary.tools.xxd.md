
# big endian vs little endian
```sh

大小端字节序一般是对xx位的cpu来说的
如32 bit cpu, 4 bytes
16 bit cpu, 2 bytes

# xxd默认使用big endian
echo 1234567|xxd
00000000: 3132 3334 3536 370a                      1234567.

echo 1234567|xxd -b
00000000: 00110001 00110010 00110011 00110100 00110101 00110110  123456
00000006: 00110111 00001010                                      7.

# 32bit little endian, 4 bytes group
echo 1234567|xxd -e
00000000: 34333231 0a373635                    1234567.

# 16bit little endian, 2 bytes group
echo 1234567|xxd -e -g2
00000000: 3231 3433 3635 0a37                      1234567.
```


### xxd
```sh

echo 123|xxd
00000000: 3132 330a                                123.

 echo 123|xxd -b
00000000: 00110001 00110010 00110011 00001010                    123.


# plain hexdump style
echo 1234|xxd -p
313233340a

# revert hexdump string
echo 313233340a|xxd -r -p
1234

echo 1234|xxd -i
0x31, 0x32, 0x33, 0x34, 0x0a

# hexdump first 4th bytes
echo 12345678|xxd -l 4
0000000: 3132 3334                                1234

# -s seek
xxd -s 0x36 -l 13 -c 13 xxd.1
0000036: 3231 7374 204d 6179 2031 3939 36  21st May 1996

-c len: 显示列宽度

```


### xxd advance
```sh
# Patch the date in the file xxd.1
% echo "0000037: 3574 68" | xxd -r - xxd.1
% xxd -s 0x36 -l 13 -c 13 xxd.1
0000036: 3235 7468 204d 6179 2031 3939 36  25th May 1996

# Create  a  65537  byte file with all bytes 0x00, except for the last one
which is 'A' (hex 0x41).
% echo "010000: 41" | xxd -r > file

# Hexdump this file with autoskip.
% xxd -a -c 12 file
0000000: 0000 0000 0000 0000 0000 0000  ............
*
000fffc: 0000 0000 40                   ....A


```
### od && xxd

```sh

% echo -n "${IFS} \t\n\0"|od -t acx1u1
0000000   sp  ht  nl nul  sp  ht  nl nul
              \t  \n  \0      \t  \n  \0
          20  09  0a  00  20  09  0a  00
          32   9  10   0  32   9  10   0
0000010


echo -n $IFS|od -ac -t x1
0000000   sp  ht  nl nul
              \t  \n  \0
           20  09  0a  00
0000004


```


### crc32
```sh
echo -n "测试CRC-32" | gzip -c | tail -c8|hexdump

echo -n "LongString" | gzip -c | tail -c8 | hexdump -n4 -e '"%u"'
echo -n "LongString" | gzip -c | tail -c8 | hexdump -n4 -e '"%u"'

`| od -t x4 -N 4 -A n` for hex `... | od -t d4 -N 4 -A n` for decimal.

echo -n "LongString" | gzip -c | tail -c8 |xxd  -l 4 -p

```