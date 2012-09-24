#!/bin/sh
set -u
set -e
# Example init script, this can be used with nginx, too,
# since nginx and unicorn accept the same signals

# Feel free to change any of the following variables for your app:
USER=www-data
RVM="/usr/local/rvm/bin/rvm"
GEM_SET=1.9.3-p194@
GEM_HOME="/usr/local/rvm/gems/ruby-$GEM_SET"
APP_ROOT="/var/www/mahjong/current"
SET_PATH="cd $APP_ROOT && $RVM use $GEM_SET; export GEM_HOME=$GEM_HOME"

PID="/tmp/unicorn_app.pid"
ENV=staging
CMD="$SET_PATH; $RVM $GEM_SET exec bundle exec unicorn -D -E $ENV -c $APP_ROOT/config/unicorn.rb"

old_pid="$PID.oldbin"

#cd $APP_ROOT || exit 1
$SET_PATH || exit 1

sig () {
    test -s "$PID" && kill -$1 `cat $PID`
}

oldsig () {
    test -s $old_pid && kill -$1 `cat $old_pid`
}

workersig () {
  workerpid="/var/run/unicorn/unicorn.$2.pid"
  
  test -s "$workerpid" && kill -$1 `cat $workerpid`
}

case $1 in
start)
    sig 0 && echo >&2 "Already running" && exit 0
    su - $USER -c "$CMD"
    ;;
stop)
    sig QUIT && exit 0
    echo >&2 "Not running"
    ;;
force-stop)
    sig TERM && exit 0
    echo >&2 "Not running"
    ;;
restart|reload)
    sig HUP && echo reloaded OK && exit 0
    echo >&2 "Couldn't reload, starting '$CMD' instead"
    su - $USER -c "$CMD"
    ;;
upgrade)
    sig USR2 && exit 0
    echo >&2 "Couldn't upgrade, starting '$CMD' instead"
    su - $USER -c "$CMD"
    ;;
kill_worker)
    workersig QUIT $2 && exit 0
    echo >&2 "Worker not running"
    ;;
rotate)
        sig USR1 && echo rotated logs OK && exit 0
        echo >&2 "Couldn't rotate logs" && exit 1
        ;;
*)
    echo >&2 "Usage: $0 <start|stop|restart|upgrade|rotate|force-stop>"
    exit 1
    ;;
esac