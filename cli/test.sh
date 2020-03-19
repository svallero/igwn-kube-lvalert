#!/bin/sh

export LVALERT_SERVER="pippo"
eval "echo \"$(cat add_nodes.template)\"" > add_nodes.py
