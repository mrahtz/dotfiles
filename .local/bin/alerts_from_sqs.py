#!/usr/bin/env python3

"""
Poll an AWS Simple Queue Services queue for messages,
and when one is received, use AppleScript to pop up an alert
with the contents of the message.
"""

import subprocess
import time

import boto3

QUEUE_URL = 'https://sqs.us-west-2.amazonaws.com/469197347721/alerts.fifo'


def alert(text):
    script = f'display notification "{text}" with title "Alert"'
    script += ' sound name "Frog"'
    cmd = ['osascript', '-e', script]
    subprocess.call(cmd)


session = boto3.Session(profile_name='sqs_alerts')
sqs = session.client('sqs')
while True:
    print(time.time())
    try:
        response = sqs.receive_message(QueueUrl=QUEUE_URL, WaitTimeSeconds=1)
        if not 'Messages' in response:
            continue
        for message in response['Messages']:
            alert(message['Body'])
            sqs.delete_message(QueueUrl=QUEUE_URL, ReceiptHandle=message['ReceiptHandle'])
    except Exception as e:
        print('Exception:', e)
        time.sleep(1)
