# Feature Switches

Feature switches are used when trying to deploy infrastructure on different environments. that is, you want to deploy to `test` and not to `prod` or vice versa.

The information in the `main.tf` file details how this is done. However the star of the show is the `count` function. The meaning of the command there is that if the environment to be deployed to is `prod`, create one ec2 instance, else do not create.
