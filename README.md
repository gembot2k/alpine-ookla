# alpine-ookla
Ooklaserver docker running on alpine linux

Usage:
```
docker run --name ooklaserver -d -p 5060:5060 -p 8080:8080 gembot2k/alpine-ookla
```

Test:
```
curl https://myooklaserver.com:8080
```

**OoklaServer
It Worked!**