
🔹 What is a Dockerfile?

A Dockerfile is a simple text file that contains step-by-step instructions to build a Docker image.
It automates:

Installing software

Copying application files

Setting environment variables

Running commands

Creating a ready-to-run container image



---

🔹 Why do we need a Dockerfile?

Because it helps you:

Package your application easily

Ensure consistent builds

Automate deployments

Avoid installing dependencies manually

Share your application anywhere


---

🧩 Dockerfile Instructions Explained

1️⃣ FROM

Sets the base image.

FROM ubuntu:20.04

2️⃣ LABEL / MAINTAINER

Stores image metadata.

LABEL maintainer="abhipraydh96@gmail.com"

3️⃣ RUN

Executes commands while building the image.

RUN apt-get update && apt-get install -y nginx

4️⃣ COPY / ADD

Copies files from host → container.

COPY index.html /usr/share/nginx/html/

5️⃣ WORKDIR

Sets working directory inside container.

WORKDIR /app

6️⃣ EXPOSE

Tells Docker which port the container will use.

EXPOSE 80

7️⃣ CMD

Runs the default command when the container starts.

CMD ["nginx", "-g", "daemon off;"]




---

📝 Create index.html

Create an index.html file with this content:

<h1>Hello Docker</h1>


---

🚀 Example
# Use Amazon Linux as base image
FROM amazonlinux

# Install httpd package
RUN yum update -y 
RUN yum install -y httpd

# Copy custom index.html
COPY index.html /var/www/html/index.html

# Expose port 80
EXPOSE 80

# Run httpd in foreground
CMD ["httpd", "-D", "FOREGROUND"]


---

▶️ How to Build & Run

🔹 1. Build Image

docker build -t my-webserver .

🔹 2. Run Container

docker run -d -p 80:80 my-webserver

🔹 3. Verify

Open your browser →
👉 http://localhost

You should see Hello Docker.



