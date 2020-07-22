# Blog

## What

My blog. But more of a place for documentation.

## How

I took the theme [Kiko Plus](https://github.com/AWEEKJ/Kiko-plus) and removed many features and added a couple of my own to end up with a much lighter weight result.

## How to run locally

Install jekyll and bundler with gem

```sh
gem install jekyll bundler
bundle install
```

Run the server

```sh
bundle exec jekyll serve --drafts
```

Do stuff with `rake --tasks` or look at Rakefile

```sh
rake post title="A Title" [date="2012-02-09"] [tags=[tag1,tag2]]
rake draft title="A Title" [date="2012-02-09"] [tags=[tag1,tag2]]
```

## How to create a new post

Create a file in `_posts/` using the format `YYYY-MM-DD-title.org|md`

## How to deploy

```sh
./deploy.sh
```

## To Do

- Living post with links to emacs, stumpwm, and bash configs
- not sure why Rakefile separate draft and post, the code is prob not identical, so look into
- Only include google analytics if deployed to production
