# Blog

I took the theme [Kiko Plus](https://github.com/AWEEKJ/Kiko-plus) and removed many features and added a couple of my own to end up with a much lighter weight result.

## How to run locally

Install jekyll and bundler

```sh
gem install jekyll bundler
bundle install
```

Run the server

```sh
bundle exec jekyll serve
```

## How to create a new post

I have not yet completed the feature in `Rakefile`. For now, manually create a new file in `_posts/`.

## How to deploy

```sh
./deploy.sh
```

## Post Ideas

- How to create an indefinitely usable Spotify refresh token
- Why I chose Jekyll over WordPress or Medium
- My architecture for music visualizers (the packet queuing method)

## To Do

- Cusomize and use the Rakefile
- Add a flag to `post` for `publish: true | false`
- Build a filter search bar on landing page
- Only include google analytics if deployed to production

- Later (or never)
  - Build my own comment system using S3
