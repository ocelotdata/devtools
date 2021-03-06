# Data Engineering DevTools
This project's focus is automation of Data Engineering tool Installation and Configuration. 

With a few commands and thorough guides, you should be able to deploy a modern data engineering tech stack with single digit monthly AWS bills.

Instead of spending frustrating hours on tool installation and configuration, you can clone this repos and run the attached Ansible playbook and Docker containers in a free tier EC2 server.

## Tools
* Operating System: Ubuntu 20.04 
* Languages
    * Python 3
    * PostgreSQL 13
    * bash
* Open Source Software
    * Airflow
    * Great Expectations
    * Spark (Work in Progress)
    * Presto (Work in Progress)
    * dbt (Work in Progress)
* Cloud
    * AWS CLI and Boto packages

All tools are open source or free tiers. Reference: https://free-for.dev/#/

#### Code Format Standards
Following Ansible Syntax best practices with built in linter
```bash
ansible-lint main.yml
```

## Development Environment Deployment
### Create an AWS EC2 Ubuntu virtual machine or instance
1. Login to AWS and Launch and instance in the EC2 section
2. Configure your VM in the following steps
    * Step 1: Select **Ubuntu Server 20.04 LTS (HVM), SSD Volume Type (64-bit x86)**
      An AMI is a template that contains the software configuration (operating system, application server,
      and applications) required to launch your instance. You can select an AMI provided by AWS, our user community,
      or the AWS Marketplace; or you can select one of your own AMIs.
    * Step 2: Next
    * Step 3: Next
    * Step 4: Next
    * Step 5: Next
    * Step 6: In the source column select the traffic that can reach your instance.
      (Rules with source of 0.0.0.0/0 allow all IP addresses to access your instance. We recommend setting security group rules to allow access from known IP addresses only)
    * Step 7: Launch
3. On this pop-up click the first drop down menu and select **Create a new key pair** and name your pair.
   (You have to download the private key file (.pem file) before you can continue. Store it in a secure and accessible location. You will not be able to download the file again after it's created.)
4. On the next window select **View Instances** or you can go to the EC2 menu and click on the **Instances** option. There you can see the VM created.
5. Create the name "EC2_Docker" for your instance by hovering over the empty area under the **Nam**e column and pressing on the symbol that appears.

#### Connect to your Linux instance depending on your OS:
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AccessingInstances.html

### Devtools Downloads
Once you are connected or have SSH'd into your cloud Virtual Machine, ensure you are using an Ubuntu 20.04 Operating System with the following command if needed.
```bash
cat /etc/os-release
```

Run the following commands to install necesseary OS level dependencies for the ansible playbook:
```bash
sudo apt-get update
sudo apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common \
  git \
  ansible 
  
sudo apt-add-repository --yes --update ppa:ansible/ansible
```

### Devtools Installation
Downloading the playbook to install Data Engineering tools on your server.
```bash
git clone https://github.com/ocelotdata/devtools ~/devtools
# see ./Makefile for make 
cd ~/devtools/iac && make local
```
<img src="https://github.com/angelddaz/de-devtools/blob/master/images/20200406screenshot.png" width="70%" height="70%">

### Docker containers for postgres and airflow
Install Docker + Docker Compose in an AWS EC2 Instance
Make sure you have run the apt dependencies:
```
sudo apt install docker.io
sudo apt install docker-compose
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - #
apt-cache madison docker-ce
```
