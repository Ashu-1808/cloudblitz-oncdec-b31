**Date: 21 Nov 2025**

# $${\color{lightblue}{\textbf{🐳 Docker}}}$$
<img width="1262" height="657" alt="image" src="https://github.com/user-attachments/assets/7fb03208-1d32-4a77-b84c-b50fb166245e" />
---

## $${\color{orange}{\textbf{📌 Understanding the Software Development Teams}}}$$

### $${\color{Green}{\textbf{1️⃣ Development Team (Dev)}}}$$

Responsible for writing code.

### $${\color{Orange}{\textbf{2️⃣ Testing Team (QA)}}}$$

Responsible for validating the code.

### $${\color{Red}{\textbf{3️⃣ Operations Team (Ops)}}}$$

Responsible for servers, infrastructure, and deployment.

---

## $${\color{lightblue}{\textbf{📌 Traditional Software Workflow}}}$$

* All code is integrated in **GitHub**
* Code **cannot** be delivered directly to client
* Code must be tested in **multiple environments**
* Every environment needs installation of:

  * React 19 (Frontend)
  * Java 17 (Backend)
  * Tomcat 9.109
  * MariaDB 8.4

This entire setup = **Environment**

---

# $${\color{cyan}{\textbf{📌 Environments in a Project}}}$$

### $${\color{Green}{\textbf{1️⃣ Development (DEV)}}}$$

* Setup VM
* Install:

  * MariaDB 8.4
  * Java 17
  * Tomcat 9.109
  * React 19

### $${\color{Orange}{\textbf{2️⃣ Testing (TEST)}}}$$

* Setup VM
* Install:

  * MariaDB 8.4
  * Java 11
  * Tomcat 9.109
  * React 19

### $${\color{Yellow}{\textbf{3️⃣ UAT – User Acceptance Testing}}}$$

* Setup VM
* Install:

  * MariaDB 8.4
  * Java 17
  * Tomcat 9.109
  * React 19

### $${\color{Red}{\textbf{4️⃣ Production (PROD)}}}$$

* Setup VM
* Install:

  * MariaDB 8.4
  * Java 17
  * Tomcat 9.109
  * React 19

---

# $${\color{red}{\textbf{⚠️ Problems With Traditional Setup}}}$$

❌ ${\color{red}{\textbf{Environment issues}}}$
❌ ${\color{red}{\textbf{Version mismatch}}}$
❌ ${\color{red}{\textbf{Dependencies not installed}}}$
❌ ${\color{red}{\textbf{"Works on my machine" problem}}}$
❌ ${\color{red}{\textbf{Time-consuming setup}}}$

---

# $${\color{lightblue}{\textbf{✅ Solution → Docker}}}$$

## $${\color{cyan}{\textbf{📌 What is Docker?}}}$$

${\color{lightblue}{\textbf{Docker}}}$ is an **open-source containerization platform** used for:

* Packaging applications
* Packaging dependencies
* Running the same setup across all environments

### $${\color{Green}{\textbf{✨ Benefits of Docker}}}$$

* ✔ ${\color{Green}{Portability}}$
* ✔ ${\color{Green}{Consistency}}$
* ✔ ${\color{Green}{Scalability}}$
* ✔ ${\color{Green}{Faster deployments}}$
* ✔ ${\color{Green}{Resource efficiency}}$

---

# $${\color{lightblue}{\textbf{📌 Application Example}}}$$

### $${\color{purple}{\textbf{Our Tech Stack}}}$$

* **Frontend:** React 19
* **Backend:** Java 17 + Tomcat 9.109
* **Database:** MariaDB 8.4

Docker allows each to run inside separate **containers**.

---

# $${\color{cyan}{\textbf{📌 Docker Workflow}}}$$

```
Dockerfile → Docker Image → DockerHub → Container
```

---

## $${\color{lightgreen}{\textbf{1️⃣ Dockerfile}}}$$

A text file containing build instructions.

```dockerfile
FROM amazonlinux
RUN yum install httpd -y
COPY index.html /var/www/html/
CMD ["httpd", "-D", "FOREGROUND"]
```

---

## $${\color{lightgreen}{\textbf{2️⃣ Docker Image}}}$$

A **template** that includes:

* Code
* Dependencies
* Runtime
* Configurations

---

## $${\color{lightgreen}{\textbf{3️⃣ DockerHub}}}$$

A cloud **registry** to store and share images.

---

## $${\color{lightgreen}{\textbf{4️⃣ Container}}}$$

A **running instance** of a Docker image.

---

# $${\color{cyan}{\textbf{📌 Docker Across All Environments}}}$$

Before Docker:
Environment → Install software manually (slow & error-prone)

With Docker:
Environment → Install Docker → Run container → Done 🎯

```
DEV:   Instance → Docker → Image → Container
TEST:  Instance → Docker → Image → Container
UAT:   Instance → Docker → Image → Container
PROD:  Instance → Docker → Image → Container
```

Same image → Same result → No mismatch ✔

**Date: 22 Nov 2025
# Diff Monolithic vs Microservises Architecture
<img width="1281" height="601" alt="image" src="https://github.com/user-attachments/assets/b6704028-f9e4-4331-a65c-aff79077393a" />
<img width="1175" height="678" alt="image" src="https://github.com/user-attachments/assets/537434ed-6c7b-4d71-a247-bb61cfff4279" />
<img width="1285" height="575" alt="image" src="https://github.com/user-attachments/assets/6f20b98e-64a5-4ec5-a680-0740ee1b395e" />
<img width="1365" height="547" alt="image" src="https://github.com/user-attachments/assets/52c25be2-c2e0-4806-a3cb-b54636237476" />
<img width="1542" height="593" alt="image" src="https://github.com/user-attachments/assets/02800600-5a46-4ca0-9b17-8b6e76bbb625" />

##  ${\color{lightblue} \textbf{Installation-Steps  \ (Amazon-Linux)}}$ 


````
sudo yum update -y
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user
newgrp docker
sudo chmod 777 /var/run/docker.sock
````
````
docker --version
````

##  ${\color{lightblue} \textbf{Installation-Steps  \ (Ubuntu)}}$ 


````
sudo apt update -y
sudo apt install  docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ubuntu
newgrp docker
sudo chmod 777 /var/run/docker.sock
````
````
docker --version
````



