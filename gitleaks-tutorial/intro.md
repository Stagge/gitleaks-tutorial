Hello and welcome!

Today you will be learning all about [Gitleaks](https://github.com/gitleaks/gitleaks). 

```
┌─○───┐
│ │╲  │
│ │ ○ │
│ ○ ░ │
└─░───┘
```

Gitleaks is an open-source tool for detecting secrets and sensitive information in Git repositories. Exposed credentials like API keys, tokens, or passwords can lead to serious security breaches, and Gitleaks helps prevent that by scanning your codebase for potential leaks before they become a problem.

![API Key meme](./assets/meme.jpg)

It’s easy to forget that even if you remove a secret from your code, it still exists in your Git commit history. Once a commit containing secrets has been pushed to a remote repository, it can be accessed by anyone with read access or even by automated scrapers that search for exposed credentials.

With this in mind, the name of the game is your commits. You want to catch sensitive information before it ever gets pushed. That’s where Gitleaks comes in.

In DevOps speed and automation are everything, but that also means mistakes can spread fast. A single leaked API key in one repo can give attackers access to entire pipelines, deployment servers, or cloud environments. Since DevOps workflows often involve shared credentials, automation tokens, and infrastructure-as-code, protecting secrets is a security and reliability issue.

Tools like Gitleaks help integrate security directly into the DevOps process, ensuring that secrets are caught early in the CI/CD pipeline rather than after they’ve been pushed, relieving developers of that pressure.


Today, you will learn how to:
 - set up Gitleaks locally,
 - scan your repo for leaks,
 - add automatically scan commits using pre-commit hooks,
 - configure Gitleaks to your liking, and
 - integrate Gitleaks in to you CI/CD pipeline with Github Actions.

Lets get started! 🙌