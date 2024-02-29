# Advanced EC2 WordPress Server Deployment
#### Description... <br> .........

## Step 1: Create VPC
#### First, create a VPC with 3 Public & 3 Private subnets. If needed, allow internet access by creating an Internet Gateway (IG) and attach it to the VPC. 

![IMAGE](https://github.com/ericincloud/Advanced-EC2-WordPress-Server-Deployment/blob/main/CreateWPVPC.JPG)

## Step 2: Setup & configure WordPress instance
#### Setup & configure WordPress EC2 instance, select the Bitnami WordPress AMI and place it in a private subnet e.g `private1-us-east-1a`. Proceed after 2/2 status checks are passed. 

![IMAGE](https://github.com/ericincloud/Advanced-EC2-WordPress-Server-Deployment/blob/main/LaunchEC2WP.JPG)
![IMAGE](https://github.com/ericincloud/Advanced-EC2-WordPress-Server-Deployment/blob/main/LauchEC2WP2.JPG) 
![IMAGE](https://github.com/ericincloud/Advanced-EC2-WordPress-Server-Deployment/blob/main/LaunchEC2WP3.JPG)

## Step 3: Create RDS MySQL database 
#### To create a RDS MySQL database, first create an RDS subnet group containing the private subnets of the WordPress VPC. Then create the database itself with the WordPress VPC, newly created subnet group, and WordPress EC2 instance selected. 

![IMAGE](https://github.com/ericincloud/Advanced-EC2-WordPress-Server-Deployment/blob/main/WPRDSSubnetGroup.JPG)
![IMAGE](https://github.com/ericincloud/Advanced-EC2-WordPress-Server-Deployment/blob/main/WPCreateRDSDB.JPG)
![IMAGE](https://github.com/ericincloud/Advanced-EC2-WordPress-Server-Deployment/blob/main/WPCreateRDSDB2.JPG)
![IMAGE](https://github.com/ericincloud/Advanced-EC2-WordPress-Server-Deployment/blob/main/WPCreateRDSDB3.JPG)
![IMAGE](https://github.com/ericincloud/Advanced-EC2-WordPress-Server-Deployment/blob/main/WPCreateRDSDB4.JPG)
![IMAGE](https://github.com/ericincloud/Advanced-EC2-WordPress-Server-Deployment/blob/main/WPCreateRDSDB5.JPG)

## Step 4: Connect EC2 to RDS 
#### Connect the WordPress EC2 intance to the RDS database using security groups.

![IMAGE]()

## Step 5: Setup Application Load Balancer (ALB) 
#### Create a target group containing the WordPress EC2 isntance. Then setup an Application Load Balancer (ALB) in public subnets & connect it to the EC2 instance using target groups. Edit the ALB's security group to allow `HTTP` on `Port 80` from anywhere `0.0.0.0/0`. If done correct, you should be able to access the ALB's DNS name and see a default WordPress webpage!

![IMAGE](https://github.com/ericincloud/Advanced-EC2-WordPress-Server-Deployment/blob/main/WPTargetGroup.JPG) 
![IMAGE](https://github.com/ericincloud/Advanced-EC2-WordPress-Server-Deployment/blob/main/WPALB.JPG) 
![IMAGE](https://github.com/ericincloud/Advanced-EC2-WordPress-Server-Deployment/blob/main/WPALBSecGroup.JPG) 
![IMAGE](https://github.com/ericincloud/Advanced-EC2-WordPress-Server-Deployment/blob/main/WPALBwebpage.JPG)

## Step 6: Create Bastion instance & SSH/SSH forwarding
#### Install the Pageant application. Add the private key to the Pageant key list. 
![IMAGE](https://github.com/ericincloud/Advanced-EC2-WordPress-Server-Deployment/blob/main/Pageant.JPG)

#### Create a Bastion EC2 instance in a public subnet to SSH to the WordPress EC2 in the private subnet. Verify functionality by using SSH/SSH forwarding from the public bastion isntance then into the private WorrdPress EC2 instance. This can be done using PuTTY. Copy and Paste the bastion's public IP into the `hostname` within Putty > Head to `Auth` on the left tab > select `Credentials` > Browse for the bastion's private key and select it > On the left tab select `Auth` > Under `Other authentication related options` select `Allow agent forwarding` > Then connect by clicking `Open`. 
![IMAGE](https://github.com/ericincloud/Advanced-EC2-WordPress-Server-Deployment/blob/main/WPSSH1.JPG)
![IMAGE](https://github.com/ericincloud/Advanced-EC2-WordPress-Server-Deployment/blob/main/WPSSH2.JPG)
![IMAGE](https://github.com/ericincloud/Advanced-EC2-WordPress-Server-Deployment/blob/main/WPSSH3.JPG)
#### Accept the popup > login as `ec2-user` -- You should now be successfully connected to the bastion instance! 
![IMAGE](https://github.com/ericincloud/Advanced-EC2-WordPress-Server-Deployment/blob/main/WPBastionSSH.JPG)

#### To SSH into the private WordPress instance, take note of the private IP address of the private WordPress isntance then use command: `ssh bitnami@Private IP DNS name`. 
#### Congratulations! You should now be able to have access to the Bitnami WordPress private EC2 instance through the bastion!
![IMAGE](https://github.com/ericincloud/Advanced-EC2-WordPress-Server-Deployment/blob/main/SSHBitnami.JPG)

## Notes
####

## Reference 
####
