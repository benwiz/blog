# Blog

I took the theme [Kiko Plus](https://github.com/AWEEKJ/Kiko-plus) and removed many features and added a couple of my own to end up with a much lighter weight result.

## Prepare `_site` for deploy

```sh
git clone -b gh-pages `git config remote.origin.url` _site
```

## Post Ideas

- Why I chose Jekyll over WordPress or Medium
- How I set up my Jekyll blog using a custom domain with AWS Route 53
- My architecture for music visualizers (the packet queuing method)

## To Do

- Build a filter search bar on landing page

- Only include google analytics if deployed to production
- Set url based on development or production

- Build my own comment system using S3
