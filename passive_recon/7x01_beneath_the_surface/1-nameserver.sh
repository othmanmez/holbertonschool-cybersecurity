#!/bin/bash
dig +short SOA astralis-cloud.example | awk 'NR==1 {print $1}' | sed 's/\.$//'
