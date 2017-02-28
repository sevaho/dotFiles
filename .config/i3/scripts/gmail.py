#!/usr/bin/env python3

#https://pypi.python.org/pypi/gmailcount/0.1.1

import argparse
import getpass
import keyring
import logging
import requests
import xml.etree.ElementTree

SERVICE_NAME = 'gmailcount'


logger = logging.getLogger('gmailcount')


class GetPasswordError(RuntimeError):
    pass


def set_password(email_address):
    """
    Store the password associated with email_address in the system keyring.
    """
    password = getpass.getpass()
    keyring.set_password(SERVICE_NAME, email_address, password)


def delete_password(email_address):
    """
    Delete the password associated with email_address from the system keyring.
    """
    keyring.delete_password(SERVICE_NAME, email_address)


def get_password(email_address, prompt=False):
    """
    Get password for email_address from the system keyring, or from the
    terminal if prompt is True.
    """
    if prompt:
        password = getpass.getpass()
    else:
        password = keyring.get_password(SERVICE_NAME, email_address)
    if password is None:
        raise GetPasswordError("No password set for '{}'".format(args.email_address))
    return password


def get_url(email_address):
    """
    Get the appropriate url for the gmail atom feed for email_address.
    """
    domain = email_address.rpartition('@')[-1]
    if domain == 'gmail.com':
        return 'https://mail.google.com/mail/feed/atom/'
    else:
        return 'https://mail.google.com/a/%s/feed/atom/' % domain


def get_mail_count(email_address, password, timeout=None):
    """
    Get the count of emails in the inbox for email_address.
    """
    url = get_url(email_address)
    auth = requests.auth.HTTPBasicAuth(email_address, password)

    response = requests.get(url, auth=auth, timeout=timeout)
    response.raise_for_status()

    tree = xml.etree.ElementTree.fromstring(response.content)
    node = tree.find('{http://purl.org/atom/ns#}fullcount')
    return node.text


def log_error(e, debug):
    """
    Log error with a human readable message.
    """
    if isinstance(e, keyring.errors.PasswordSetError):
        message = "Set password failed: {}".format(e)
    elif isinstance(e, keyring.errors.PasswordDeleteError):
        message = "Delete password failed: {}".format(e)
    elif isinstance(e, requests.RequestException):
        message = "Request failed"
    elif isinstance(e, GetPasswordError):
        message = "Get password failed: {}".format(e)
    else:
        message = "Unexpected Error"
    logger.error(message, exc_info=debug)


def parse_args():
    """
    Parse command line arguments and return the args object.
    """
    parser = argparse.ArgumentParser(description='Check gmail message count.')
    group = parser.add_mutually_exclusive_group()
    group.add_argument(
        '-s',
        '--set-password',
        action='store_true',
        default=False,
        help='set the password for email_address',
    )
    group.add_argument(
        '-d',
        '--delete-password',
        action='store_true',
        default=False,
        help='delete the password for email_address',
    )
    group.add_argument(
        '-p',
        '--prompt',
        action='store_true',
        default=False,
        help='have gmail-count prompt you for your password',
    )
    parser.add_argument(
        '-t',
        '--timeout',
        type=float,
        help='request timeout',
    )
    parser.add_argument(
        '--debug',
        dest='debug',
        action='store_true',
        default=False,
        help='print tracebacks for errors',
    )
    parser.add_argument('email_address', help='email address to check')
    return parser.parse_args()


if __name__ == '__main__':
    args = parse_args()
    try:
        if args.set_password:
            set_password(args.email_address)
        elif args.delete_password:
            delete_password(args.email_address)
        else:
            password = get_password(args.email_address, args.prompt)
            print(get_mail_count(args.email_address, password, args.timeout))
    except Exception as e:
        log_error(e, debug=args.debug)
        exit(1)

