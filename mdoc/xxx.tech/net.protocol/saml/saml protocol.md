# saml协议

## 基本概念

- Identity and Access Management(IAM)
	- user store, LDAP, ...
	- Web SSO
- Identity Provider (IDP)
- Service Provider (SP)
- SAML Request (SP -> IDP)
- SAML Response (IDP -> SP)
- Assertion
- SAML Trust

## IAM
![[Pasted image 20220419111309.png]]
![[Pasted image 20220419111324.png]]

### IDP
![[Pasted image 20220419111753.png]]
![[Pasted image 20220419111939.png]]
![[Pasted image 20220419112229.png]]
![[Pasted image 20220419113158.png]]

#### claim transformation
![[Pasted image 20220419113259.png]]
![[Pasted image 20220419113403.png]]
![[Pasted image 20220419113449.png]]

## 整体流程

![[saml01.png]]

1. IDP和SP之间需要建立信任
2. UA首先访问IDP，获取到saml assertion
3. UA携带saml assertion访问SP
4. SP验证assertion后，允许UA访问资源
5. 一个assertion可以访问多个SP

## 配置信息

![[saml02.png]]

1. IDP和SP的数据库中都保存着用户的信息
2. IDP和SP中都保存着一份saml配置， IDP XML和SP XML
3. 配置中包括如IDP将使用email作为用户id， 发送方的证书信息等等
4. IDP和SP通过交换配置信息来建立信任

## 初始化流程

### IDP-Init

![[saml03-idp-init.png]]

### SP-Init

![[saml04-sp-init.png]]

### reference
youtube saml
https://www.youtube.com/watch?v=SvppXbpv-5k
https://www.youtube.com/watch?v=SvppXbpv-5k
