#!/bin/bash
dig +short SOA astralis-cloud.example | awk '{print $1}' | head -n 1
