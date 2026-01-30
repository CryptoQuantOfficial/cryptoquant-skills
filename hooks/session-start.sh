#!/bin/bash
# CryptoQuant SessionStart Hook
# Plain text output is added as context

CREDENTIALS_FILE="$HOME/.cryptoquant/credentials"

# Check API key status
if [ -f "$CREDENTIALS_FILE" ]; then
    API_STATUS="configured"
else
    API_STATUS="not configured"
fi

# Plain text output (automatically added as context)
cat << EOF
[CryptoQuant Plugin]
API Key: ${API_STATUS}
Commands: /crypto, /crypto-market, /crypto-signal, /crypto-whale
EOF

exit 0
