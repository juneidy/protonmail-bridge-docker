#!/bin/sh

gpg --batch --passphrase '' \
	--quick-gen-key 'ProtonMail Bridge' default default never

pass init "ProtonMail Bridge"
