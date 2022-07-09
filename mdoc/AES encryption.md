# 术语
- 分组加密: 将待加密的信息分成128bit, 192bit, 256bit
- 秘钥长度，秘钥长度对应128bit, 192bit, 256bit

- InitRound: 分组矩阵和初始密码矩阵异或
- SubBytes: 通过查表法替换分组矩阵中的字节
- ShiftRows: 行移位， 分组矩阵每行循环左移0， 1 ， 2 ，...次
- MixColumn: 列混合， 分组中每列左乘一个矩阵
- AddRoundKey： 分组的待加密信息 异或 RoundKey
- RoundKey: 由原始密码通过列扩展算法得到

# 流程
1. init round
2. n rounds: sub bytes, shift rows, mix column, add round key
3. final round: sub bytes, shift rows, add round key

# 工作模式
- ECB(Electronic codebook) : 对每个分组独立加密，最后拼接起来。 速度快，可以并行
	- 对于视频播放，可以随机跳转
- CBC: 分组明文异或上一个分组的密文后，再进行加密。第一个分组明文需要异或一个随机的初始向量 IV。 速度慢，串行
	- 比较少用
	- 
	- https://zh.wikipedia.org/wiki/%E5%88%86%E7%BB%84%E5%AF%86%E7%A0%81%E5%B7%A5%E4%BD%9C%E6%A8%A1%E5%BC%8F

# refenence
- https://www.bilibili.com/video/BV1i341187fK?from=search&seid=6157394691666191104&spm_id_from=333.337.0.0
- 