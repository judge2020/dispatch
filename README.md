# Dispatch for docker

This allows you to use the Dispatch tool, made by [Discord](https://discordapp.com), in either your own docker scripts or in GitHub actions.

#### Why ubuntu?

To get going quickly. Feel free to PR if you're able to get dispatch running on `alpine`.

### Actions: Logging in

```
action "Dispatch-login" {
  uses = "judge2020/dispatch/login@master"
  secrets = ["DISCORD_USER_ID", "DISCORD_ACCESS_TOKEN", "DISCORD_REFRESH_TOKEN"]
}
```

To get the three secrets you need:

1. [log in to dispatch on your local computer](https://discordapp.com/developers/docs/dispatch/branches-and-builds#getting-set-up).
2. open `$HOME/.dispatch/credentials.json` in a text editor (windows: open a run box with Win+R and enter `notepad %userprofile%\.dispatch\credentials.json`)

Now go to your repository settings -> secrets and add these as secret environment variables from the text file you have open:

* `DISCORD_USER_ID`: the `user_id` from the file
* `DISCORD_ACCESS_TOKEN`: the `access_token` from the file
* `DISCORD_REFRESH_TOKEN`: the `refresh_token` from the file

Afterwards:

![](https://i.judge.sh/Sombra/M4cWMjrw.png)

### Actions: usage

Remember, you must first log-in as explained above.

[Any command you can use on your local computer](https://discordapp.com/developers/docs/dispatch/list-of-commands) can also be used in actions as long as it is non-interactive.

```
action "Dispatch-drm" {
  uses = "judge2020/dispatch@master"
  args = "build drm-wrap 321321321321 windows_program.exe"
}
```

### Manually: Logging in

This is for when you don't use GitHub Actions.

The tool will look for your credentials in `/root/.dispatch/credentials.json`. That file must look like:

```json
{
  "OAuth2Credentials": {
    "user_id": "123123123123123",
    "access_token": "oauth_access_token_but_longer",
    "refresh_token": "oauth_refresh_token_but_longer"
  }
}
```

You can directly use your local computer's `(home)/.dispatch/credentials.json` for this file.

you can use a volume or file mount like to achieve this, eg `-v $PWD/credentials.json:/root/.dispatch/credentials.json`.


### Manually: Usage

Pass arguments to the docker image like you would pass arguments to the dispatch command. List of commands: https://discordapp.com/developers/docs/dispatch/list-of-commands
