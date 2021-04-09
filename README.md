# code




## 4. Configure nginx
<p>In this example as per question, i assume http://0.0.0.0:8081,http://0.0.0.0:8082,http://0.0.0.0:8083,http://0.0.0.0:8084,http://0.0.0.0:8085 are working services. http://0.0.0.0:8080/health will post the health check.</p>

  #### For SSL below lines are used in nginx configuration.
  ```
          listen  443 ssl;
        ssl_certificate     /etc/ssl/certs/test/server.crt;
        ssl_certificate_key /etc/ssl/certs/test/server.key;
  ```
  ### For upstream below code is used in nginx configuration.
  ```
    upstream backend {
        server  0.0.0.0:8081;
        server  0.0.0.0:8082;
        server  0.0.0.0:8083;
        server  0.0.0.0:8084;
        server  0.0.0.0:8085;

 
    }

    upstream health_backend {
        server  0.0.0.0:8080;
    }
 location /health {
            proxy_pass http://health_backend;

        }


      location / {
        proxy_pass http://backend;
        }
  ```



## 5. Build RPM for printing Awe$ome in command line.
