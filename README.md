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
# create crontab for root user
sudo nano crontab -e
# update ip-blacklist.txt everyday at 0430
30 4  * * *   /opt/utils/ipblacklist.sh
# updates underlying raspbianpi os on 5th of everymonth at 0310
10 3   5 * *    /opt/utils/update.sh
```
