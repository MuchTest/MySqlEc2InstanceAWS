# MySQL on Ec2 Instance AWS


<i> Brief example of deploying MySQL service and mysql-shell on EC2 AWS (Ubuntu 20.04 OS) with Terraform and Ansible</i>

After cloning repository, and changing the variables accordingly, perform:

```
terraform init
terraform plan
terraform apply
```

Once the instance is ready, login by using the public IP ... 

```
root@ZACK:/home/MySqlEc2InstanceAWS# terraform output
public_ip = "3.142.48.143"

root@ZACK:/home/MySqlEc2InstanceAWS# 
root@ZACK:/home/MySqlEc2InstanceAWS#  ipinstance=`terraform output | awk {'print $3'} | sed 's/"//g'`
root@ZACK:/home/MySqlEc2InstanceAWS#  echo $ipinstance
3.142.48.143
root@ZACK:/home/MySqlEc2InstanceAWS#  ssh ubuntu@$ipinstance
Welcome to Ubuntu 20.04.2 LTS (GNU/Linux 5.4.0-1038-aws x86_64)
[... snip ... ]
ubuntu@ip-172-31-20-34:~$
ubuntu@ip-172-31-20-34:~$ sudo -i
root@ip-172-31-20-34:~#
```


... and check the status of the services:

```
root@ip-172-31-20-34:~# # check mysql status
root@ip-172-31-20-34:~# 
root@ip-172-31-20-34:~# mysql -uroot -pabc123!
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 13
Server version: 8.0.23-0ubuntu0.20.04.1 (Ubuntu)

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> exit;
Bye
```

```
root@ip-172-31-20-34:~# # check mysql-shell status
root@ip-172-31-20-34:~# mysqlsh
MySQL Shell 8.0.23

Copyright (c) 2016, 2021, Oracle and/or its affiliates.
Oracle is a registered trademark of Oracle Corporation and/or its affiliates.
Other names may be trademarks of their respective owners.

Type '\help' or '\?' for help; '\quit' to exit.
 MySQL  JS > \c root@localhost
Creating a session to 'root@localhost'
Please provide the password for 'root@localhost': *******
Save password for 'root@localhost'? [Y]es/[N]o/Ne[v]er (default No):
Fetching schema names for autocompletion... Press ^C to stop.
Your MySQL connection id is 14 (X protocol)
Server version: 8.0.23-0ubuntu0.20.04.1 (Ubuntu)
No default schema selected; type \use <schema> to set one.
MySQL  localhost:33060+ ssl  JS >
MySQL  localhost:33060+ ssl  JS > \q
Bye!
root@ip-172-31-20-34:~#

```

Free resources with 

```
terraform destroy
```
