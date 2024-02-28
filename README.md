# Advanced EC2 WordPress Server Deployment
#### Description...

## Step 1: Create VPC
#### First, create a VPC with 3 Public & 3 Private subnets.

![IMAGE]()

## Step 2: Create RDS MySQL database in private subnet
#### 

![IMAGE]()

## Step 3: Setup & configure WordPress EC2 instance in another private subnet
#### 

![IMAGE]()

## Step 4: Connect EC2 to the RDS database using security groups
#### 

![IMAGE]()

## Step 5: Setup an Application Load Balancer (ALB) in a public subnet & connect it to the EC2 instance using target groups
#### 

![IMAGE]()

## Step 6: Create a Bastion EC2 instance in the public subnet to SSH to the WordPress EC2 in the private subnet
#### 

![IMAGE]()

## Step 7: Verify functionality 
#### Verify functionality by accessing the DNS name of the ALB.

#### Congratulations!
![IMAGE]()
