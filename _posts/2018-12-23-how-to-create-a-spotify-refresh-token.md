---
layout: post
title: How to create a Spotify refresh token the easy way
date: 2018-12-23
tags: [spotify, api]
ads: true
permalink: /create-spotify-refresh-token/
---
In this guide I will explain how to manually generate a Spotify refresh token then use that to programmatically create an access token when needed.

My use case was for my [wwoz_to_spotify](https://github.com/benwiz/wwoz_to_spotify) project in which I have a long running cronjob that needs to update a Spotify playlist. Since the job runs in the background I needed a way to avoid the Spotify login pop-up during the authorization flow. The solution is to manually generate a Spotify refresh token then use that to create an access token when needed.

## Step 1: Get your Spotify `client_id` and `client_secret`

Visit your [Spotify developers dashboard](https://developer.spotify.com/dashboard/applications) then select or create your app. Note down your _Client ID_, _Client Secret_, and _Redirect URI_ in a convenient location to use in Step 2.

## Step 2: Get your access code

Visit the following URL after replacing `$CLIENT_ID`, `$SCOPE`, and `$REDIRECT_URI` with the information you noted in Step 1. Make sure the `$REDIRECT_URI` is URL encoded.

```text
https://accounts.spotify.com/authorize?response_type=code&client_id=$CLIENT_ID&scope=$SCOPE&redirect_uri=$REDIRECT_URI
```

My url looked like this

```text
https://accounts.spotify.com/authorize?response_type=code&client_id=$CLIENT_ID&scope=playlist-modify-private&redirect_uri=https%3A%2F%2Fbenwiz.io
```

## Step 3: Get `code` from the redirect URL

I was redirected to the following URL because my redirect URI was set to _https://benwiz.io_. In place of `$CODE` there was a very long string of characters. Copy that string and note it down for use in Step 4.

```text
https://benwiz.io/?code=$CODE
```

## Step 4: Get the refresh token

Running the following CURL command will result in a JSON string that contains the refresh token, in addition to other useful data. Again, either replace or export the following variables in your shell `$CILENT_ID`, `$CLIENT_SECRET`, `$CODE`, and `$REDIRECT_URI`.

```sh
curl -d client_id=$CLIENT_ID -d client_secret=$CLIENT_SECRET -d grant_type=authorization_code -d code=$CODE -d redirect_uri=$REDIRECT_URI https://accounts.spotify.com/api/token
```

The result will be a JSON string similar to the following. Take the `refresh_token` and save that in a safe, private place. This token will last for a very long time and can be used to generate a fresh `access_token` whenever it is needed.

```json
{
    "access_token": "$ACCESS_TOKEN",
    "token_type": "Bearer",
    "expires_in": 3600,
    "refresh_token": "$REFRESH_TOKEN",
    "scope": "playlist-modify-private"
}
```
