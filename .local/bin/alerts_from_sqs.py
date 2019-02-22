#!/usr/bin/env python3

"""
Start on login with
    $ launchctl load .local/bin/alerts_from_sqs.plist
"""

import subprocess
import time

import boto3


def alert(text):
    script = f'display notification "{text}" with title "Job monitor"'
    script += ' sound name "Frog"'
    cmd = ['osascript', '-e', script]
    subprocess.call(cmd)


sqs = boto3.resource('sqs')
queue = sqs.get_queue_by_name(QueueName='alerts.fifo')
while True:
    try:
        for message in queue.receive_messages(WaitTimeSeconds=1):
            alert(message.body)
            message.delete()
    except Exception as e:
        print(e)
        time.sleep(1)
