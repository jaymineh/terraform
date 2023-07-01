# Creating AWS resources with dependency locks

Generally, Terraform doesn't really care what order resources are spun up. What matters to it is either they spin up completely or fail.

What happens in a scenario where you want to spin up a web server and db server, but the web server needs the db server to come up first, else it crashes? This is where dependency comes in.

Dependency makes the creation of a resource depend on a particular action or another resource. It ensures the dependencies are set up first, before the dependent is done.

Details are seen in the `main.tf` file.
