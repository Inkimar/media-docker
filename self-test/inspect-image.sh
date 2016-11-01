#!/bin/bash
firefox `grep mediaURL output.json | awk '/mediaURL/{print $3}' | cut -c 2-107`
