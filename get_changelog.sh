#!/usr/bin/env bash

repo forall -c git log --pretty=oneline --since="24 hours ago"
