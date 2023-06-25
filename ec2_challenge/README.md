# Challenge 2

The task in this challenge aims to test knowledge on EC2 using terraform. The tasks are listed below to be done using terraform only:

- Create 2 EC2 instances, one for webserver and another for database.
- Output the private IP of the database and the public IP of the webserver.
- Create a security group to allow web traffic
- Run a script on the webserver machine to install Apache.

In the `main.tf` file, the configuration for each of the requirements are seen. The two EC2 instances are created individually (as opposed to my original thought of adding the `count` argument to increase the number from 1 to 2), the elastic IP is also created as well and referenced to tie to the webserver machine.

The security groups were created to allow web traffic (HTTP & HTTPS) using dynamic blocks. Lastly, the script was set up to run on the webserver machine using the `user_data` function.

After successfully running and building the infrastructure, going to the IP of the webserver via a web browser leads to a success message to show that the configuration ran successfully. See screenshots below:

*Apache successfully installed*
![Successful Webpage](webpage.png)

*Elastic IP deployed*
![Elastic IP Deployed](EIP.png)

*Database and Web Servers*
![DB & Web Servers](dbweb.png)
