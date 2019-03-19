#!/bin/bash
dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
cp -f ${dir}/conkyrc $HOME/.conkyrc
