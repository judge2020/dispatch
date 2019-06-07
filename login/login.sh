#!/bin/sh
mkdir -p $HOME/.dispatch
cat << EOF > $HOME/.dispatch/credentials.json
{
  "OAuth2Credentials": {
    "user_id": "$DISCORD_USER_ID",
    "access_token": "$DISCORD_ACCESS_TOKEN",
    "refresh_token": "$DISCORD_REFRESH_TOKEN"
  }
}
EOF
