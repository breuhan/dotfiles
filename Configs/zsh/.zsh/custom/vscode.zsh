# Loading `.env` on VS Code embeded terminal
if [[ "$TERM_PROGRAM" == "vscode" && -f ".env" ]]; then
  source .env && \
  echo "✅ loaded .env"
fi
