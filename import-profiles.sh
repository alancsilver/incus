#!/bin/bash
PROFILE_DIR="incus-profiles"

for profile_file in "$PROFILE_DIR"/*.yaml; do
    profile_name=$(basename "$profile_file" .yaml)
    echo "Importing profile: $profile_name"
    
    if incus profile show "$profile_name" &>/dev/null; then
        # Profile exists, update it
        incus profile edit "$profile_name" < "$profile_file"
    else
        # Profile doesn't exist, create it
        cat "$profile_file" | incus profile create "$profile_name"
    fi
done
