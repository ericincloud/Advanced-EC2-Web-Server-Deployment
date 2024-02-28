# Advanced EC2 WordPress Server Deployment
#### Description... <br> .........

## Step 1: Create VPC
#### First, create a VPC with 3 Public & 3 Private subnets. If needed, allow internet access by creating an Internet Gateway (IG) and attach it to the VPC. 

![IMAGE]()
![IMAGE]()

## Step 2: Setup & configure WordPress instance
#### Setup & configure WordPress EC2 instance, select the Bitnami WordPress AMI and place it in a private subnet e.g `private1-us-east-1a`. Proceed after 2/2 status checks are passed. 

![IMAGE]()

## Step 3: Create RDS MySQL database 
#### To create a RDS MySQL database, first create an RDS subnet group containing the private subnets of the WordPress VPC. Then create the database itself with the WordPress VPC, newly created subnet group, and WordPress EC2 instance selected. 

![IMAGE]()
![IMAGE]()
![IMAGE]()
![IMAGE]()
![IMAGE]()
![IMAGE]()

## Step 4: Connect EC2 to RDS 
#### Connect the WordPress EC2 intance to the RDS database using security groups.

![IMAGE]()

## Step 5: Setup Application Load Balancer (ALB) 
#### Create a target group containing the WordPress EC2 isntance. Then setup an Application Load Balancer (ALB) in public subnets & connect it to the EC2 instance using target groups. Edit the ALB's security group to allow `HTTP` on `Port 80` from anywhere `0.0.0.0/0`.

![IMAGE]() 
![IMAGE]() 

## Step 6: Create Bastion instance 
#### Create a Bastion EC2 instance in a public subnet to SSH to the WordPress EC2 in the private subnet.

![IMAGE]()

## Step 7: Verify functionality 
#### Verify functionality by accessing the DNS name of the ALB.

#### Congratulations!
![IMAGE]()
