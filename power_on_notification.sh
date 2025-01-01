#!/bin/bash

# Define the recipient email and subject
EMAIL="example@example.com"  # Replace with the actual recipient's email
SUBJECT="🔌Power-On Notification 🚀"

# Define the path to the HTML file
HTML_FILE="power_on_notification.html"  # Path to the static HTML file

# Get the current timestamp
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Send the email using msmtp with the HTML content
{
    echo "Subject: $SUBJECT"
    echo "Content-Type: text/html; charset=UTF-8"
    echo ""
    cat "$HTML_FILE"
} | msmtp "$EMAIL"

