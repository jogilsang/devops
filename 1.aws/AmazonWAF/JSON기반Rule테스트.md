

```sh
  devops  master ⦾ export waflab_url=http://mydvw-appli-1089ebu3540np-644829539.ap-northeast-2.elb.amazonaws.com/

⬢  devops  master ⦾
⬢  devops  master ⦾
⬢  devops  master ⦾
⬢  devops  master ⦾ curl -i -H "x-value: bot" $waflab_url
HTTP/1.1 403 Forbidden
Server: awselb/2.0
Date: Mon, 30 May 2022 08:35:18 GMT
Content-Type: text/html
Content-Length: 118
Connection: keep-alive

<html>
<head><title>403 Forbidden</title></head>
<body>
<center><h1>403 Forbidden</h1></center>
</body>
</html>
⬢  devops  master ⦾ curl -i -X POST -d "Amazon":"30","is":"12374934237","known":"Target 3","as":null,"one":"Configuration Deneme 3","of":null,"the":"Configuration Deneme 3","most":0,"customer-centric":3,"companies":true $waflab_url
HTTP/1.1 403 Forbidden
Server: awselb/2.0
Date: Mon, 30 May 2022 08:35:26 GMT
Content-Type: text/html
Content-Length: 118
Connection: keep-alive

<html>
<head><title>403 Forbidden</title></head>
<body>
<center><h1>403 Forbidden</h1></center>
</body>
</html>
⬢  devops  master ⦾ curl -i -H "x-value: notbot" -X POST -d "valid":"size" $waflab_url
HTTP/1.1 302 Found
Date: Mon, 30 May 2022 08:35:56 GMT
Content-Type: text/html; charset=UTF-8
Content-Length: 0
Connection: keep-alive
Set-Cookie: AWSALB=oAzLcl+EVUC9hKnHbAVu+xCYPs1R6nwAlqyvDDymAef+1k8hFBSJ9aQx2DIut4isxCOAe16uKg63+mbiNiSPI3WeTjWusoY7pua2/ZiU2trtfG6b1y7myRTqewB7; Expires=Mon, 06 Jun 2022 08:35:56 GMT; Path=/
Set-Cookie: AWSALBCORS=oAzLcl+EVUC9hKnHbAVu+xCYPs1R6nwAlqyvDDymAef+1k8hFBSJ9aQx2DIut4isxCOAe16uKg63+mbiNiSPI3WeTjWusoY7pua2/ZiU2trtfG6b1y7myRTqewB7; Expires=Mon, 06 Jun 2022 08:35:56 GMT; Path=/; SameSite=None
Server: Apache/2.4.29 (Ubuntu)
Set-Cookie: PHPSESSID=ab6pepdmmhfvni713pe037defv; path=/
Expires: Thu, 19 Nov 1981 08:52:00 GMT
Cache-Control: no-store, no-cache, must-revalidate
Pragma: no-cache
Set-Cookie: PHPSESSID=ab6pepdmmhfvni713pe037defv; path=/; HttpOnly
Set-Cookie: security=impossible; HttpOnly
Location: login.php
```
