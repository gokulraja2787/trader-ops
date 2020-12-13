#!/bin/sh
docker build -t jenkins-ci .
docker tag jenkins-ci gokul2787/learning-repo:jenkins-ci
