# big endian vs little endian
```sh

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