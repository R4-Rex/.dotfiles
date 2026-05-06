#!/usr/bin/env bash

if [ ! -d ~/.vars ]; then
        echo "Creating ~/.vars with default flake..."

        VARS_DIR="$HOME/.vars"
        VARS_FILE="$VARS_DIR/flake.nix"

        mkdir -p "$VARS_DIR/secrets"

        echo "Setting up your secrets in $VARS_DIR"
        echo "Press Enter to use defaults shown in brackets"

        read -p "Git Name: " git_name
        git_name=${git_name:-""}

        read -p "Git Email: " git_email
        git_email=${git_email:-""}

        read -p "GPG Fingerprint: " gpg_fingerprint
        gpg_fingerprint=${gpg_fingerprint:-""}

        read -p "Timezone: " timezone
        timezone=${timezone:-"America/NewYork"}

        cat > "$VARS_FILE" << 'EOF'
        {
          outputs = { self }: {
                secrets = import ./secrets/secrets.nix;
          };
        }
EOF
        cat > "$VARS_DIR/secrets/secrets.nix" << EOF
        {
          git = {
                name = "$git_name";
                email = "$git_email";
          };
          gpg = {
                fingerprint = "$gpg_fingerprint";
          };
          user = {
                timezone = "$timezone";
          };
        }
EOF
echo "$VARS_FILE created!"
fi
