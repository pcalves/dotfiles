# weechat

My [weechat](https://weechat.org/) configuration.
This configuration relies on weechat's [secure data](https://www.weechat.org/files/doc/stable/weechat_user.en.html#secured_data) feature.  To use this configuration and set-up secure data, follow these steps:

1. Install weechat.
1. Start weechat.
1. Set passphrase: `/secure passphrase YOUR_PASSPHRASE`
1. Set passwords for all servers: `/secure set freenode_password YOUR_PASSWORD`
1. Set Slack token: `/secure set slack_token TOKEN` & `/set plugins.var.python.slack.slack_api_token ${sec.data.slack_token}`
1. Update the path to the CA file:

    ```
    /set weechat.network.gnutls_ca_file "/usr/local/etc/openssl/cert.pem"
    ```
