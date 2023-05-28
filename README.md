# Jenkinseksintegration

Usually, cluster API is only accessible to the cluster creator, i.e., only eksadmin will be able to access the cluster API. so no other will have the access, we can give access to others as well but need define another role which has the poweruser access and EKS API permissions. So, for now using the switch role only which normally used by most of the projects.
When we tried to access the kubernetes pods with another user which has admin access, we got unauthorized access.
But, when tried by switching to the eksadmin role and tried accessing the eks cluster. Then we are able to access the cluster pods.

Inorder to implemenent this solution, preprequisties are:

1. Create the infrastructure using Cloudfromations_Templates/EKS_Cluster.JSON using the switchrole.
2. Create the node group using the default self managed node CFN (this can be created by any user/role) using Cloudfromations_Templates/amazon-eks-nodegroup (1).yaml
3. Create an instance with jenkins installed.
4. Install kubectl, helm, awscliv2, unzip.
5. AWS EC2 plugin has to be installed to store the aws credentials. 
6. Post that use the code of intergration.




