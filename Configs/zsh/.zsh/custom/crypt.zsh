keyid="69F2FBC3565E99C0C949654850310CF2B629B73C"

function dotencrypt() {
  gpg -q -r ${keyid} --armor --no-tty -o "${2}" -e "${1}"
}

function dotdecrypt() {
  gpg -q --for-your-eyes-only --no-tty -d "${1}" > "${2}"
}
