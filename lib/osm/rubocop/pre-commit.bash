#!/bin/bash
RED="\\e[31m"
NO_COLOR="\\e[0m"
# Pre commit messages don't take STDIN from the terminal by default.
# (See http://stackoverflow.com/a/10015707/1633753)
# The following line overrides that:
exec < /dev/tty

if !(bundle exec rubocop --parallel); then
  echo -e "$RED"
  echo -e "Rubocop offenses were found."
  echo -ne "Do you want to commit anyway? [Y/n] "
  echo -ne "$NO_COLOR"
  read input
  case $input in
    [Yy] ) exit
  esac
  echo -ne "$RED"
  echo -e "Commit was cancelled due to rubocop offenses."
  echo -ne "$NO_COLOR"
  exit 1
fi
