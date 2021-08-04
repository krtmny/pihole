# pihole, dnscrypt-proxy
- pihole:https://pi-hole.net/
- dnscrypt proxy: https://github.com/DNSCrypt/dnscrypt-proxy
- update pihole(blocklist, regexlist, whitelist) - https://github.com/jacklul/pihole-updatelists
> If somehow pihole does not stop ads after lists update try this tip: https://github.com/jacklul/pihole-updatelists/issues/23#issuecomment-646211738

Contains 
- Configuration for dnscrypt-proxy - dnscrypt-proxy.toml
- Cloaking rules for cloaking-rules.txt in dnscrypt-proxy - cloaking-rules.txt
- Blacklist urls for pihole: blocklisturls

Scripts for update for iplist (dnscrypt-proxy) and update underlying raspbian os:
 - ipblacklist.sh - Updates iplist for dnscrypt-proxy
 - updatepi.sh - Updates the underlying raspbian os. can be used to update any debian based os.

Crontab sample to use for scripts:
```sh
# create or update crontab for root user
sudo crontab -u root -e

# updates underlying OS  on 5th of everymonth at 0310
10 3  5 * *    /opt/utils/update.sh

# update blacklist in /opt/dnscrypt-proxy everyday at 0645
45 6  * * *   /opt/utils/blacklist.sh

# update ip-blacklist in /opt/dnscrypt-proxy everyday at 0715
15 7  * * *   /opt/utils/ipblacklist.sh
```

helpful regex list:
> https://raw.githubusercontent.com/mmotti/pihole-regex/master/regex.list 
> https://raw.githubusercontent.com/mmotti/pihole-regex/master/miscellaneous/amp.list 
> https://raw.githubusercontent.com/mmotti/pihole-regex/master/miscellaneous/internationalized%20domains.list 
> https://raw.githubusercontent.com/mmotti/pihole-regex/master/user%20suggested/first-party%20trackers.list 
> https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/regex.list 
> https://raw.githubusercontent.com/llacb47/mischosts/master/social/tiktok-regex.list

helpful adblocking sites
> OISD:  https://abp.oisd.nl/
> hblock: https://hblock.molinero.dev/hosts_adblock.txt
> goodbyeads: https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Formats/GoodbyeAds-AdBlock-Filter.txt
> 1hosts: https://badmojr.github.io/1Hosts/Lite/adblock.txt
> Torrent Websites: https://raw.githubusercontent.com/im-sm/Pi-hole-Torrent-Blocklist/main/all-torrent-websites.txt
> Torrent Trackers: https://raw.githubusercontent.com/im-sm/Pi-hole-Torrent-Blocklist/main/all-torrent-trackres.txt
