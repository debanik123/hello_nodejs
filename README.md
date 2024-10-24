# hello_nodejs
hello world with nodejs 

# basic idea
```
    sudo usermod -aG docker jenkins
    sudo systemctl restart jenkins
    sudo systemctl restart docker
    docker ps

    http://222.99.248.55:8080/github-webhook/

    1. Set Up GitHub Webhook (Recommended)
        This method triggers the Jenkins job automatically when a change is pushed to the repository, without needing to poll constantly.

        Steps to Configure GitHub Webhook:
        Generate GitHub Webhook URL from Jenkins:

        Go to your Jenkins job.
        Click Configure.
        Scroll down to Build Triggers.
        Select the GitHub hook trigger for GITScm polling option.
        Configure GitHub Webhook:

        Go to your GitHub repository: https://github.com/debanik123/hello_nodejs.
        Navigate to Settings > Webhooks.
        Click Add Webhook.
        In the Payload URL field, enter your Jenkins URL followed by /github-webhook/:
        perl
        Copy code
        http://<your-jenkins-server>/github-webhook/
        Set Content type to application/json.
        Select the option Just the push event.
        Click Add webhook.
        Test the Webhook:

        Once you've added the webhook, make a commit and push it to your repository.
        Go to Jenkins and verify if the job is triggered automatically.
    2. Configure Jenkins for Poll SCM (Alternative Method)
        If webhooks are not feasible (due to firewall, network, etc.), you can use Jenkins's Poll SCM feature. This will periodically check for changes in the repository and trigger a build if changes are found.

        Steps to Configure Poll SCM:
        Go to Jenkins Job Configuration:

        Open your Jenkins job.
        Click Configure.
        Set Up Poll SCM:

        Scroll down to Build Triggers.
        Check the box for Poll SCM.
        In the schedule field, enter how often you want Jenkins to check for changes. For example, to check every 5 minutes:
        Copy code
        H/5 * * * *
        This will trigger a build if there are any changes in the repository during the last 5 minutes.
        Save and Apply:
        
        Click Save.
    3. Ensure Jenkins Has Proper GitHub Credentials
        Make sure Jenkins has the correct GitHub credentials set up under Source Code Management in the job configuration, or it won't be able to access your repository.

        In Configure > Source Code Management, ensure you have selected the right repository URL (https://github.com/debanik123/hello_nodejs.git) and the right branch.
        Ensure Jenkins has credentials if the repository is private.

    4. Test the Configuration
        After setting up either GitHub Webhook or Poll SCM, test the setup:

        Make a commit and push changes to the GitHub repository.
        Jenkins should automatically detect the change and trigger a build.

```

