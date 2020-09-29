

How to run a push service
===========================

## How to install gotify 

```bash
wget https://github.com/gotify/server/releases/download/v2.0.6/gotify-linux-arm-7.zip

unzip gotify-linux-arm-7.zip

sudo chmod +x gotify-linux-arm-7

sudo ./gotify-linux-arm-7

firefox http://[IP-Addr]
(http://192.168.10.122:8080/)
* user: admin
* passowrd: admin
```


## How to change port (80)
By default, the GOtify server runs on port 80. We need to reconfigure(port 8080) Gotify as follows. 
```bash
wget -O config.yml https://raw.githubusercontent.com/gotify/server/master/config.example.yml
vi ./config.yml
->80 to 8080
```

## How to send a push message with cuRL

```bash
curl -X POST "https://IPADDRESS:PORT/message?token=TOKEN" -F "title=This is a title" -F"message=Message goes here"

curl -X POST "http://192.168.10.122:8080/message?token=ATeXvd.HklkyYPo" -F "title=독거노인 영통 42번지 점검" -F"message=4월 21일 하루종일 활동이 없어서 방문이 필요합니다."
```

## How to  send a push message with gotify CLI

```bash
wget -O gotify https://github.com/gotify/cli/releases/download/v1.2.0/gotify-cli-linux-amd64

chmod 755 ./gotify
gotiify version
mv gotify /usr/bin/gotify

gotify init
$ gotify push my message
$ gotify push "my message"
$ echo my message | gotify push
$ gotify push < somefile
$ gotify push -t "my title" -p 10 "my message"
$ gotify watch "curl http://example.com/api | jq '.data'"
```

## How to send a push message with php


```bash


01 <?php
02     $data = [
03     "title"=> $argv[1],
04     "message"=> $argv[2],
05         "extras" => [
06         "client::display" => [
07             "contentType" => "text/markdown"
08         ]
09     ]
10 ];
11
12 $data_string = json_encode($data);
13
14 $url = "http://127.0.0.1:8080/message?token=AQiPyW7ATHGWgZg";
15
16 $headers = [
17     "Content-Type: application/json; charset=utf-8"
18 ];
19
20 $ch = curl_init();
21 curl_setopt($ch, CURLOPT_URL, $url);
22 curl_setopt($ch, CURLOPT_POST, 1);
23 curl_setopt($ch, CURLOPT_HTTPHEADER, $headers );
24 curl_setopt($ch, CURLOPT_RETURNTRANSFER, true );
25 curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
26
27 $result = curl_exec($ch);
28 $code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
29
30 curl_close ($ch);
31
32 switch ($code) {
33 case "200":
34         echo "Message submitted";
35         break;
36     case "400":
37         echo "Bad request";
38         break;
39     case "401":
40         echo "Unauthorized error: invalid token";
41         break;
42     case "403":
43         echo "Forbidden";
44         break;
45     case "404":
46         echo "API URL not found";
47         break;
48     default:
49         echo "Something went wrong or HTTP status code is missing";
50 }
51 ?>

$
$
$
$ php gotify.php "Markdown!" "**Yes**, Markdown formatting _is_ supported."

```


## How to create API Key (=token) in gotify
Use TOKEN with the token of the app you created on the Gotify server).
* https://git.io/JesYD


## References
* Gotify: https://gotify.net/
* Gotify server: https://github.com/gotify/server/
* Gotify CLI tool: https://github.com/gotify/cli
* wttr.in: https://github.com/chubin/wttr.in
* Gotify for Firefox: https://addons.mozilla.org/firefox/addon/gotify-for-firefox/


End of line. 

