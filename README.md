# Blog

I took the theme [Kiko Plus](https://github.com/AWEEKJ/Kiko-plus) and removed many features and added a couple of my own to end up with a much lighter weight result.

## Prepare `_site` for deploy

```sh
git clone -b gh-pages `git config remote.origin.url` _site
```

## To Do

- Only include google analytics if deployed to production
- Set url based on development or production
