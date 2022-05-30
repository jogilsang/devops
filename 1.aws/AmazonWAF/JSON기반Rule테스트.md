

```sh
  devops  master ⦾ export waflab_url=http://.......com/

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
```
