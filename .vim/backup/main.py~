#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Sample Python3 OAuthRequest
"""
import feedparser
import requests as req
import requests
import json
import time
import datetime
from requests_oauthlib import OAuth1
from xml.etree.ElementTree import *
from static import NAME, KEY, SECRET, TEXTRA_URL, WEB_HOOK_URL, RSS
# import pprint

consumer = OAuth1(KEY, SECRET)

d = feedparser.parse(RSS)
text_block = list()
print(f"Size: {len(d.entries)}")
for i, entry in enumerate(d.entries):
    print(str(i))
    if i % 100 == 0:
        requests.post(WEB_HOOK_URL, data=json.dumps({
            "attachments": text_block,
            "icon_emoji": ":piggy:",
            "username": "arxiv_pic",
        }))
        text_block = list()

    title = entry.title
    link = entry.link
    summary = entry.summary.replace("\n", "")[3:-4]

    params = {
        'key': KEY,
        'name': NAME,
        'text': title + "\n\n" + summary,
    }

    try:
        res = req.post(TEXTRA_URL, data=params, auth=consumer)
        res.encoding = 'utf-8'
        text_t = json.loads(res.text)['resultset']['result']['information']['text-t']
        title_t, summary_t = text_t.splitlines()
        output = f"【{str(i)}】{title_t}\n\n{link}\n\n{summary_t}"
        text_block.append({'text': output})

    except Exception as e:
        print('=== Error ===')
        print('type:' + str(type(e)))
        print('args:' + str(e.args))
        print('e:' + str(e))

requests.post(WEB_HOOK_URL, data=json.dumps({
    "attachments": text_block,
    "icon_emoji": ":piggy:",
    "username": "arxiv_piggy",
}))

dt_now = datetime.datetime.now() + datetime.timedelta(hours=9)
dt_strtime = dt_now.strftime("%Y-%m-%d_%H")
with open(f'{dt_strtime}.txt', 'w') as f:
    f.write(text_block)
