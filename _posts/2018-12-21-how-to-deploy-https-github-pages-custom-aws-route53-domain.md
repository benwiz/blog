---
layout: post
title: How to deploy GitHub pages with AWS Route 53 registered custom domain and force HTTPS
date: 2018-12-21
tags: [aws, github]
ads: true
---
In this guide I will explain how to deploy a website to GitHub pages forcing HTTPS over a custom domain that is registered with AWS Route 53. We will set up our domain so that the www subdomain will redirect to the apex domain.

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

## Step 3: Confirm that GitHub pages has been deployed

Visit http://your-github-username.github.io and https://your-github-username.github.io. You should see the contents of your _index.html_ file at both the unsecured and secured addresses.

## Step 4: Configure AWS Route 53 to use your custom vanity domain

1. Log into the AWS console and go to the [Route 53 dashboard](https://console.aws.amazon.com/route53/home).
2. Click _Hosted zones_
3. Click the domain you would like to use
4. Click _Create Record Set_
5. Do not enter anything into the _Name_ field
6. Under the _Type_ dropdown, select _A - IPv4 addresses_
7. The _Alias_ toggle should be set to _No_
8. Enter the following four IP addresses into the _value_ text area

```text
185.199.108.153 
185.199.109.153 
185.199.110.153 
185.199.111.153
```

9. Click _Save Record Set_

![benwiz.io A-record](images/benwiz.io.png)

10. Click _Create Record Set_, again
11. Into the _Name_ field, enter `www`
12. Under the _Type_ dropdown, select _A - IPv4 addresses_, again
13. The _Alias_ toggle should be set to _Yes_, unlike before
14. In the _Alias Target_ field, select the apex domain we previously set up. For me this is _benwiz.io_.
15. Click _Save Record Set_, again

![www.benwiz.io A-record](images/www.benwiz.io.png)

## Step 5: Configure GitHub to serve over your custom domain

1. Return to your GitHub repository's settings tab
2. Scroll down to the GitHub Pages section
3. In the _Custom domain_ field enter your custom domain: `your-custom-domain.com`
4. Click _Save_
5. Check _Enforce HTTPS_

## Step 6: Confirm that your page is accessible at your custom domain

1. Visit https://your-custom-domain.com. You should see the contents of your _index.html_. 
2. Visit https://www.your-custom-domain.com. You should be redirected to https://your-custom-domain.com.
3. Visit http://your-custom-domain.com. You should be redirected to https://your-custom-domain.com.
4. Visit http://www.your-custom-domain.com. You should be redirected to https://your-custom-domain.com.
