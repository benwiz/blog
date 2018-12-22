---
layout: post
title: How to deploy GitHub pages with AWS Route 53 registered custom domain and force HTTPS
date: 2018-12-21
tags: [aws, github]
ads: true
---
In this guide I will explain how to deploy a website to GitHub pages forcing HTTPS over a custom domain that is registered with AWS Route 53.

# Summary

- Set up the GitHub repo
- Commit and push an index.html or use Jekyll
- Configure AWS Route 53

## Step 1: Create GitHub repo and turn on GitHub Pages

1. If it does not exist yet, create a repository using the naming pattern `your-github-username.github.io`. Since my username is _benwiz_ my repository is called [`benwiz.github.io`](https://github.com/benwiz/benwiz.github.io)
2. Click the _Settings_ tab and scroll down the _GitHub Pages_ section
3. From the _Source_ dropdown select _master branch_
4. Click _Save_

## Step 2: Push source code to GitHub

1. Clone the repo to your local machine

```sh
git clone git@github.com:your-github-username/your-github-username.github.io.git && cd your-github-username.github.io
```

2. Create an _index.html_ file with some content

```sh
echo "Hello GitHub Pages!" > index.html
```

3. Looking forward, we will need to have a file named _CNAME_ that contains a single row: your custom domain. My _CNAME_ file has the following contents.

```text
benwiz.io
```

4. Push the files to GitHub

```sh
git add . && git commit -m 'Create content and CNAME record' && git push
```

## Step 3: 
