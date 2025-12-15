#!/usr/bin/env bash
systemctl start tailscaled
tailscale up --accept-dns=true
