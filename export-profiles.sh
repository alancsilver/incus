#!/bin/bash
PROFILE_DIR="incus-profiles"
mkdir -p "$PROFILE_DIR"

incus profile list --format csv | cut -d, -f1 | while read -r profile; do
    echo "Exporting profile: $profile"
    incus profile show "$profile" > "$PROFILE_DIR/${profile}.yaml"
done

echo "Profiles exported to $PROFILE_DIR/"
