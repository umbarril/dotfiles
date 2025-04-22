#!/bin/sh

# Executes the script passed as an argument if it is not already running.
# Closes the script if it is running.

# Usage: echo '<command>' | ./toggle-execute.sh 
# Example: echo '/path/to/script.sh arg1 arg2' | ./toggle-execute.sh 

SCRIPT_TO_EXEC=$(cat)

if [ -z "$SCRIPT_TO_EXEC" ]; then
    echo "Usage: echo 'command' | $0"
    exit 1
fi

MATCH_STRING=$(echo "$SCRIPT_TO_EXEC" | tr -d '"' | sed 's/ \+/.* /g')

# echo $SCRIPT_TO_EXEC
# echo $MATCH_STRING
# echo $(pgrep -f "$MATCH_STRING")

if pgrep -f "$MATCH_STRING" > /dev/null; then
    echo "Stopping $SCRIPT_TO_EXEC..."
    pkill -f "$MATCH_STRING"
else
    echo "Starting $SCRIPT_TO_EXEC..."
    eval "$SCRIPT_TO_EXEC" &
fi
