## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![ELK Network Diagram](https://github.com/buenasolas/ucsd-cybersec/blob/master/Images/ELK-diagram.png?raw=true)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Ansible/playbooks/config-dvwa.yml|config-elk.yml|filebeat-playbook.yml may be used to install only certain pieces of it, such as Filebeat.

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting direct access to the network.
- Load balancers secure access to the backend webservers by only allowing explicitly listed connections(HTTP in this case) to the webservers. Outside of the load balancer the webserver VMs are not directly exposed to the public internet. They also allow you to horizontally scale, and perform maintenance without affecting availability. 
- The advantage of using a jumpbox is that you have a single entrypoint into your virtual network for administrative access. In fact, this VM can be explicitly turned off when administrative access is not needed.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the filesystem and system configuration & logs.
- Filebeat will watch files on disk, usually for monitoring logfiles that are being actively written to.
- _TODO: What does Metricbeat record?_

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.1   | Linux            |
| TODO     |          |            |                  |
| TODO     |          |            |                  |
| TODO     |          |            |                  |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 68.8.252.233
(Genuinely a little confused here, since the LB allows traffic from the internet, I realize it's not a VM though. But both the jumpbox & the ELK VM are accessible from the internet, albeit locked down via separate NSG's. One allowing SSH/TCP/22 & the other HTTP/TCP/5601)

Machines within the network can only be accessed by the jumpbox, 10.0.0.4.

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | 10.0.0.1 10.0.0.2 20.   |
|          |                     |                      |
|          |                     |                      |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it is repeatable and scaleable. Since ansible is designed with idempotency in mind, you can also run playbooks or ansible tasks against properly configured servers, and it will not modify their configuration. As an example, if we wanted to add a 4th webserver to our web-as availability set, and backend LB pool, it could be quickly and easily configured identically to the first 3 VMs.

The playbook implements the following tasks:
- install docker, pip3, & docker python module
- tweak sysctl settings
- enable docker service
- download, configure, & start ELK container


The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.
![ELK docker ps output](https://github.com/buenasolas/ucsd-cybersec/blob/master/Images/elk-docker-ps.png?raw=true)


### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.5
- 10.0.0.6
- 10.0.0.7

We have installed the following Beats on these machines:
- filebeats

These Beats allow us to collect the following information from each machine:
- filebeats allows us to monitor logs for things like sudo, user logon events, and any other system logs we would like to monitor.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _____ file to _____.
- Update the hosts file to include the IP & username of the 
- Run the playbook, and navigate to ELK-VM-Public-IP:5601/app/kibana to check that the installation worked as expected.

- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
ansible-playbook -l web playbooks/filebeat-playbook.yml
or
ansible-playbook -l web1 playbooks/filebeat-playbook.yml

- _Which URL do you navigate to in order to check that the ELK server is running?

