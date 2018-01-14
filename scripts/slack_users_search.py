import sys
import os
from slackclient import SlackClient


SLACK_TOKEN = os.environ['SLACK_TOKEN']

def search_user(sc, user):
    options = []

    for user_name in sc.server.users.itervalues():
        if user == user_name.name.lower():
            return [(user_name.real_name, user_name.name)]
        if user in user_name.name.lower():
            options.append((user_name.real_name, user_name.name))
            continue
        if user in user_name.real_name.lower():
            options.append((user_name.real_name, user_name.name))

    return options


def pprint_user_results(result):
    print "Search results:"
    for user in result:
        print "Real name:[%s]   Slack user:[%s]" % user


def run_search(user):

    sc = SlackClient(token=SLACK_TOKEN)
    sc.rtm_connect()

    result = search_user(sc, user)

    if result:
        pprint_user_results(result)
    else:
        print "No results for user '%s'" % user



if __name__ == '__main__':
    args = sys.argv
    if len(args) < 2:
        print "No search name entered"
    else:
        search = ' '.join(args[1:]).lower()
        run_search(search)

