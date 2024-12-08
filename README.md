# Docker for [Proton Mail Bridge](https://github.com/ProtonMail/proton-bridge)

I created this repo so that I can run Proton Mail SMTP in my server.

My previous attempt at making it work with
[hydroxide](https://github.com/emersion/hydroxide) is in the `hydroxide`
directory.

## Usage

You can follow the instructions
[here](https://pychao.com/2020/06/10/update-on-using-protonmail-bridge-on-headless-wordpress-linux-servers/)
to setup your proton mail account.

In order for the login data to survive the container re-creation, you need to
mount these directories:

* /home/proton/.gnupg
* /home/proton/.password-store
* /home/proton/.config
* /home/proton/.local
* /home/proton/.cache

Make sure these directories permission are `700`.
