USAGE:
  BUILD:  ```docker build -t myca .```
  RUN: ```mkdir out; docker run -v out:/ca/out -it myca bash ./createcert.sh "servername"```
  RUN For Windows on gitbash:
    ```winpty docker run -v //c/users/username/git/docker-ca/ca:/ca/out -it myca bash ./createcert.sh "servername"```

TODO:
  Should make entry point so will automatically call createcert.sh when doing docker run
  Should possibly add other functions (e.g. revoke cert, pkcs12-ize it)
  
