#!/bin/bash

source /root/.bashrc && nginx -g "daemon off;" | npm start -- -p 256
