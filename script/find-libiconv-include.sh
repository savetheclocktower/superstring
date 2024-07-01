#!/bin/bash


# We have several different ways of resolving `libiconv` on macOS.
if [[ ! -z "${SUPERSTRING_LIBICONV_PATH}" ]]; then
  # First is to allow the user to specify a certain `library_dirs` entry as an
  # override. This should propagate even if the user ran `yarn install` from
  # a project that has `superstring` as a dependency.
  echo "${SUPERSTRING_LIBICONV_PATH}"
elif command -v brew &> /dev/null; then
  # If that variable isn't set, then we check if this machine has Homebrew
  # installed. If so, we'll opt into Homebrew's version of `libiconv`.
  #
  # TODO: This script doesn't try to verify that `libiconv` is installed,
  # though it could if we thought that was warranted.
  echo "$(brew --prefix)/opt/libiconv/include"
else
  # If neither of these things is true, we won't try to add an entry to
  # `library_dirs`.
  # echoerr("Path three!")
  echo ""
fi
