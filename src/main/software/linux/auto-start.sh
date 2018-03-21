#!/usr/bin/env bash

sudo update-rc.d ${service_name} defaults
sudo update-rc.d ${service_name} enable
