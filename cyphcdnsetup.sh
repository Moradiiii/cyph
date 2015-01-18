#!/bin/bash

# CDN node setup script for Ubuntu 14.04

cert='LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tDQpNSUlGV1RDQ0JFR2dBd0lCQWdJUUJrSTZTUHpieWZqOE00RmdCQU5VMkRBTkJna3Foa2lHOXcwQkFRc0ZBREJODQpNUXN3Q1FZRFZRUUdFd0pWVXpFVk1CTUdBMVVFQ2hNTVJHbG5hVU5sY25RZ1NXNWpNU2N3SlFZRFZRUURFeDVFDQphV2RwUTJWeWRDQlRTRUV5SUZObFkzVnlaU0JUWlhKMlpYSWdRMEV3SGhjTk1UVXdNVEUyTURBd01EQXdXaGNODQpNVFl3TVRJd01USXdNREF3V2pCZk1Rc3dDUVlEVlFRR0V3SlZVekVSTUE4R0ExVUVDQk1JUkdWc1lYZGhjbVV4DQpEakFNQmdOVkJBY1RCVVJ2ZG1WeU1STXdFUVlEVlFRS0V3cERlWEJvTENCSmJtTXVNUmd3RmdZRFZRUURFdzl1DQpZUzVqWkc0dVkzbHdhQzVqYjIwd2dnRWlNQTBHQ1NxR1NJYjNEUUVCQVFVQUE0SUJEd0F3Z2dFS0FvSUJBUUM5DQp1Q2JvK2wwNVlFK1QyMXViWFU4dnhXWTFOOFY3OXRoK1JVWDdFRlQzdXF0RzAyVVJqTlZwZFVLK3VmZ2pUaHh6DQpTSlFZam9XS0svcXZ6dXYzRlNTaVRDTWtCcFY5dkNIcklLTmtJQXpFcTVZU2JrQkMvL3hGeWQ2L0h5N1FoWWR5DQo2Uk1ITGV4SDV4RmFYVmNmZFRTbW5rdVczc3RrMG1HRDBZM3FZQVdFTHJkNjFCT3ZFalZsTHlONVJLdGNuTFgrDQoyeThTZUpic3lJYkpQU3B0bDNMMnU5QWJaL3NzYXZVbjUrV0RZR2ZqdnFsVWsvS0lkWlBuQThCK3FaeGdYK2ZPDQp1Sy8wRVl5WXdUV3NFUEtGZnkrOEFkVGEySVlEaFpnU0w5eHhuQmlteXVTQWNUcDNTQjExTmV1NklhdjV2K1RmDQptV3hQYU9CWHV6TFlWb3REWFpMaEFnTUJBQUdqZ2dJaE1JSUNIVEFmQmdOVkhTTUVHREFXZ0JRUGdHRWNnakZoDQoxUzhvNTQxR09MUXM0Y2JaNGpBZEJnTlZIUTRFRmdRVUJhM1M1a2E5YkhSYUtmY1JTMmcrbDdodUk2a3did1lEDQpWUjBSQkdnd1pvSVBibUV1WTJSdUxtTjVjR2d1WTI5dGdnOWhaaTVqWkc0dVkzbHdhQzVqYjIyQ0QyRnpMbU5rDQpiaTVqZVhCb0xtTnZiWUlQWlhVdVkyUnVMbU41Y0dndVkyOXRnZzl2WXk1alpHNHVZM2x3YUM1amIyMkNEM05oDQpMbU5rYmk1amVYQm9MbU52YlRBT0JnTlZIUThCQWY4RUJBTUNCYUF3SFFZRFZSMGxCQll3RkFZSUt3WUJCUVVIDQpBd0VHQ0NzR0FRVUZCd01DTUdzR0ExVWRId1JrTUdJd0w2QXRvQ3VHS1doMGRIQTZMeTlqY213ekxtUnBaMmxqDQpaWEowTG1OdmJTOXpjMk5oTFhOb1lUSXRaek11WTNKc01DK2dMYUFyaGlsb2RIUndPaTh2WTNKc05DNWthV2RwDQpZMlZ5ZEM1amIyMHZjM05qWVMxemFHRXlMV2N6TG1OeWJEQkNCZ05WSFNBRU96QTVNRGNHQ1dDR1NBR0cvV3dCDQpBVEFxTUNnR0NDc0dBUVVGQndJQkZoeG9kSFJ3Y3pvdkwzZDNkeTVrYVdkcFkyVnlkQzVqYjIwdlExQlRNSHdHDQpDQ3NHQVFVRkJ3RUJCSEF3YmpBa0JnZ3JCZ0VGQlFjd0FZWVlhSFIwY0RvdkwyOWpjM0F1WkdsbmFXTmxjblF1DQpZMjl0TUVZR0NDc0dBUVVGQnpBQ2hqcG9kSFJ3T2k4dlkyRmpaWEowY3k1a2FXZHBZMlZ5ZEM1amIyMHZSR2xuDQphVU5sY25SVFNFRXlVMlZqZFhKbFUyVnlkbVZ5UTBFdVkzSjBNQXdHQTFVZEV3RUIvd1FDTUFBd0RRWUpLb1pJDQpodmNOQVFFTEJRQURnZ0VCQUptOG9Pa09JT0F5Z1BiNTV1WFN3NWlySitBRzNuaW82SUlVd2xiVjJ0RXJPK2xqDQpCSmZvYmVIMlpKSE9VY0VrcEtFQjk5aUZJU0ZjNFBzb0VKVnJMWHdPczJZZ2xMOEVIakxxbzA5OUlSTzJNdTc4DQpFdXZVeTJ6SXZlS2JrcXZ1OXQ0d0dQM2ZvMWFzZVhoY3NxYkNlMUFDMnk4OXk0dFRaSGp6T0FBeTBFa2l1QUpGDQo5SU5ZMkk1NE1ueWRWU01HeUFFZkhuMFJ2dGE3RDVXTVpFQ0VyOGhXRS9lUHhRc2x5RmN2aHhxc1d3NU9qcVc3DQpqNEJUTmJadUtpeVJHcHZXNHlXODJTdmJRZEg5dkd6RjViU1dEU1hJUkZFOWdwWHc2MVNHNGNlK0ZUVXNLSEpiDQpFUkI1Zi9xVG5HdVRJb3dmOGw0TU81cThneEdFbzNRSnJKaXN1MTA9DQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tDQotLS0tLUJFR0lOIENFUlRJRklDQVRFLS0tLS0NCk1JSUVsRENDQTN5Z0F3SUJBZ0lRQWYyajYyN0tkY2lJUTR0eVM4KzhrVEFOQmdrcWhraUc5dzBCQVFzRkFEQmgNCk1Rc3dDUVlEVlFRR0V3SlZVekVWTUJNR0ExVUVDaE1NUkdsbmFVTmxjblFnU1c1ak1Sa3dGd1lEVlFRTEV4QjMNCmQzY3VaR2xuYVdObGNuUXVZMjl0TVNBd0hnWURWUVFERXhkRWFXZHBRMlZ5ZENCSGJHOWlZV3dnVW05dmRDQkQNClFUQWVGdzB4TXpBek1EZ3hNakF3TURCYUZ3MHlNekF6TURneE1qQXdNREJhTUUweEN6QUpCZ05WQkFZVEFsVlQNCk1SVXdFd1lEVlFRS0V3eEVhV2RwUTJWeWRDQkpibU14SnpBbEJnTlZCQU1USGtScFoybERaWEowSUZOSVFUSWcNClUyVmpkWEpsSUZObGNuWmxjaUJEUVRDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUINCkFOeXVXSkJOd2NRd0ZaQTFXMjQ4Z2hYMUxGeTk0OXYvY1VQNlpDV0ExTzRZb2szd1p0QUtjMjRSbURZWFpLODMNCm5mMzZRWVN2eDYrTS9ocHpUYzh6bDVDaWxvZFRneXU1cG5WSUxSMVdOM3ZhTVRJYTE2eXJCdlNxWFV1M1IwYmQNCktwUERrQzU1Z0lEdkV3UnFGRHUxbTVLK3dnZGxUdnphL1A5NnJ0eGNmbFV4RE9nNUI2VFh2aS9UQzJyU3NkOWYNCi9sZDBVenMxZ04ydWprU1lzNThPMDlyZzEvUnJLYXRFcDB0WWhHMlNTNEhEMm5PTEVwZElrQVJGZFJyZE56R1gNCmt1ak5WQTA3NU1FL09WNHV1UE5jZmhDT2hrRUFqVVZtUjdDaFpjNmdxaWtKVHZPWDYrZ3Vxdzl5cHpBTytzZjANCi9SUjN3NlJiS0ZmQ3MvbUMvYmRGV0pzQ0F3RUFBYU9DQVZvd2dnRldNQklHQTFVZEV3RUIvd1FJTUFZQkFmOEMNCkFRQXdEZ1lEVlIwUEFRSC9CQVFEQWdHR01EUUdDQ3NHQVFVRkJ3RUJCQ2d3SmpBa0JnZ3JCZ0VGQlFjd0FZWVkNCmFIUjBjRG92TDI5amMzQXVaR2xuYVdObGNuUXVZMjl0TUhzR0ExVWRId1IwTUhJd042QTFvRE9HTVdoMGRIQTYNCkx5OWpjbXd6TG1ScFoybGpaWEowTG1OdmJTOUVhV2RwUTJWeWRFZHNiMkpoYkZKdmIzUkRRUzVqY213d042QTENCm9ET0dNV2gwZEhBNkx5OWpjbXcwTG1ScFoybGpaWEowTG1OdmJTOUVhV2RwUTJWeWRFZHNiMkpoYkZKdmIzUkQNClFTNWpjbXd3UFFZRFZSMGdCRFl3TkRBeUJnUlZIU0FBTUNvd0tBWUlLd1lCQlFVSEFnRVdIR2gwZEhCek9pOHYNCmQzZDNMbVJwWjJsalpYSjBMbU52YlM5RFVGTXdIUVlEVlIwT0JCWUVGQStBWVJ5Q01XSFZMeWpualVZNHRDemgNCnh0bmlNQjhHQTFVZEl3UVlNQmFBRkFQZVVEVlcwVXk3WnZDajRoc2J3NWV5UGRGVk1BMEdDU3FHU0liM0RRRUINCkN3VUFBNElCQVFBalB0OUwwakZDcGJaK1Fsd2FSTXhwMFdpMFhVdmdCQ0ZzUytKdHpMSGdsNCttVXduTnFpcGwNCjVUbFBIb09sYmx5WW9pUW01dnVoN1pQSExnTEdUVXEvc0VMZmVOcXpxUGx0L3lHRlV6WmdUSGJPN0RqYzFsR0ENCjhNWFc1ZFJOSjJTcm04YytjZnRJbDdnemJja1RCKzZXb2hzWUZmWmNURUR0czhMcy8zSEI0MGYvMUxrQXREZEMNCjJpREo2bTZLN2hRR3JuMmlXWmlJcUJ0dkxmVHl5UlJmSnM4c2pYN3ROOENwMVRtNWdyOFpET28wcndBaGFQaXQNCmMrTEpNdG80SlF0VjA1b2Q4R2lHN1M1Qk5POThwVkFkdnpyNTA4RUlET2J0SG9wWUplUzRkNjB0YnZWUzNiUjANCmo2dEpMcDA3a3pRb0gzak9sT3JIdmRQSmJSemVYREx6DQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tDQo='
key='ASK RYAN FOR THIS'
conf='dXNlciB3d3ctZGF0YTsKd29ya2VyX3Byb2Nlc3NlcyBhdXRvOwpwaWQgL3J1bi9uZ2lueC5waWQ7CgpldmVudHMgewoJd29ya2VyX2Nvbm5lY3Rpb25zIDc2ODsKCW11bHRpX2FjY2VwdCBvZmY7Cn0KCmh0dHAgewoKCSMjCgkjIEJhc2ljIFNldHRpbmdzCgkjIwoKCXNlbmRmaWxlIG9uOwoJdGNwX25vcHVzaCBvbjsKCXRjcF9ub2RlbGF5IG9uOwoJa2VlcGFsaXZlX3RpbWVvdXQgNjU7Cgl0eXBlc19oYXNoX21heF9zaXplIDIwNDg7CglzZXJ2ZXJfdG9rZW5zIG9mZjsKCXNlcnZlcl9uYW1lc19oYXNoX2J1Y2tldF9zaXplIDY0OwoJaW5jbHVkZSAvZXRjL25naW54L21pbWUudHlwZXM7CglkZWZhdWx0X3R5cGUgYXBwbGljYXRpb24vb2N0ZXQtc3RyZWFtOwoKCSMjCgkjIExvZ2dpbmcgU2V0dGluZ3MKCSMjCgoJYWNjZXNzX2xvZyBvZmY7CgllcnJvcl9sb2cgL2Rldi9udWxsIGNyaXQ7CgoJIyMKCSMgR3ppcCBTZXR0aW5ncwoJIyMKCglnemlwIG9uOwoJZ3ppcF9odHRwX3ZlcnNpb24gMS4wOwoJZ3ppcF9zdGF0aWMgYWx3YXlzOwoKCSMgaHR0cHM6Ly9hcmFsYmFsa2FuLmNvbS9zY3JpYmJsZXMvc2V0dGluZy11cC1zc2wtd2l0aC1uZ2lueC11c2luZy1hLW5hbWVjaGVhcC1lc3NlbnRpYWxzc2wtd2lsZGNhcmQtY2VydGlmaWNhdGUtb24tZGlnaXRhbG9jZWFuLwoJc2VydmVyIHsKCQlsaXN0ZW4gNDQzIHNzbDsKCQlsaXN0ZW4gWzo6XTo0NDMgaXB2Nm9ubHk9b247CgoJCXNzbF9jZXJ0aWZpY2F0ZSBzc2wvY2VydC5wZW07CgkJc3NsX2NlcnRpZmljYXRlX2tleSBzc2wva2V5LnBlbTsKCgkJcm9vdCAvY3lwaGNkbjsKCQlpbmRleCBpbmRleC5odG1sOwoKCQlzc2xfcHJlZmVyX3NlcnZlcl9jaXBoZXJzIG9uOwoJCWFkZF9oZWFkZXIgU3RyaWN0LVRyYW5zcG9ydC1TZWN1cml0eSAnbWF4LWFnZT0zMTUzNjAwMDsgaW5jbHVkZVN1YmRvbWFpbnMnOwoJCXNzbF9wcm90b2NvbHMgVExTdjEgVExTdjEuMSBUTFN2MS4yOwoJCXNzbF9jaXBoZXJzICdFQ0RIRS1SU0EtQUVTMTI4LUdDTS1TSEEyNTY6RUNESEUtRUNEU0EtQUVTMTI4LUdDTS1TSEEyNTY6RUNESEUtUlNBLUFFUzI1Ni1HQ00tU0hBMzg0OkVDREhFLUVDRFNBLUFFUzI1Ni1HQ00tU0hBMzg0OkRIRS1SU0EtQUVTMTI4LUdDTS1TSEEyNTY6REhFLURTUy1BRVMxMjgtR0NNLVNIQTI1NjprRURIK0FFU0dDTTpFQ0RIRS1SU0EtQUVTMTI4LVNIQTI1NjpFQ0RIRS1FQ0RTQS1BRVMxMjgtU0hBMjU2OkVDREhFLVJTQS1BRVMxMjgtU0hBOkVDREhFLUVDRFNBLUFFUzEyOC1TSEE6RUNESEUtUlNBLUFFUzI1Ni1TSEEzODQ6RUNESEUtRUNEU0EtQUVTMjU2LVNIQTM4NDpFQ0RIRS1SU0EtQUVTMjU2LVNIQTpFQ0RIRS1FQ0RTQS1BRVMyNTYtU0hBOkRIRS1SU0EtQUVTMTI4LVNIQTI1NjpESEUtUlNBLUFFUzEyOC1TSEE6REhFLURTUy1BRVMxMjgtU0hBMjU2OkRIRS1SU0EtQUVTMjU2LVNIQTI1NjpESEUtRFNTLUFFUzI1Ni1TSEE6REhFLVJTQS1BRVMyNTYtU0hBOkFFUzEyOC1HQ00tU0hBMjU2OkFFUzI1Ni1HQ00tU0hBMzg0OkFFUzEyOC1TSEEyNTY6QUVTMjU2LVNIQTI1NjpBRVMxMjgtU0hBOkFFUzI1Ni1TSEE6QUVTOkNBTUVMTElBOkRFUy1DQkMzLVNIQTohYU5VTEw6IWVOVUxMOiFFWFBPUlQ6IURFUzohUkM0OiFNRDU6IVBTSzohYUVDREg6IUVESC1EU1MtREVTLUNCQzMtU0hBOiFFREgtUlNBLURFUy1DQkMzLVNIQTohS1JCNS1ERVMtQ0JDMy1TSEEnOwoKCQkjIFRoaXMgaXMgZm9yIEN5cGgsIG5vdCBTU0wKCQlhZGRfaGVhZGVyIENhY2hlLUNvbnRyb2wgJ3B1YmxpYywgbWF4LWFnZT02MDQ4MDAnOwoJCWFkZF9oZWFkZXIgQWNjZXNzLUNvbnRyb2wtQWxsb3ctT3JpZ2luICcqJzsKCQlhZGRfaGVhZGVyIEFjY2Vzcy1Db250cm9sLUFsbG93LU1ldGhvZHMgJ0dFVCc7Cgl9Cn0K'
script='IyEvYmluL2Jhc2gKCm1rZGlyIC9jeXBoY2RuLm5ldwpjZCAvY3lwaGNkbi5uZXcKCndnZXQgaHR0cHM6Ly9naXRodWIuY29tL2N5cGgvY3lwaC5naXRodWIuaW8vYXJjaGl2ZS9tYXN0ZXIuemlwIC1PIGRvdGhlbW92ZS56aXAKdW56aXAgZG90aGVtb3ZlLnppcApyZXBvPSIkKGxzIHwgZ3JlcCAtdiBkb3RoZW1vdmUuemlwKSIKbXYgJHJlcG8vKiAuLwpybSAtcmYgZG90aGVtb3ZlLnppcCAkcmVwbwpnemlwIC05ciAuCmNobW9kIDc3NyAtUiAuCgpjZCAvCgppZiBbIC1kIC9jeXBoY2RuLm5ldy93ZWJzaWduIF0gOyB0aGVuCglybSAtcmYgL2N5cGhjZG4ub2xkCgltdiAvY3lwaGNkbiAvY3lwaGNkbi5vbGQKCW12IC9jeXBoY2RuLm5ldyAvY3lwaGNkbgplbHNlCglybSAtcmYgL2N5cGhjZG4ubmV3CmZpCgoKaWYgWyAkKHBzIGF1eCB8IGdyZXAgbmdpbnggfCBncmVwIC12IGdyZXAgfCB3YyAtbCkgLWx0IDEgXSA7IHRoZW4KCXNlcnZpY2Ugbmdpbnggc3RvcAoJc2VydmljZSBuZ2lueCBzdGFydApmaQo='
update='IyEvYmluL2Jhc2gKCmV4cG9ydCBERUJJQU5fRlJPTlRFTkQ9bm9uaW50ZXJhY3RpdmUKYXB0LWdldCAteSAtLWZvcmNlLXllcyB1cGRhdGUKYXB0LWdldCAteSAtLWZvcmNlLXllcyBkaXN0LXVwZ3JhZGUKcmVib290Cg=='


dir="$(pwd)"
cd $(cd "$(dirname "$0")"; pwd) # $(dirname `readlink -f "${0}" || realpath "${0}"`)

sed -i 's/# deb /deb /g' /etc/apt/sources.list
sed -i 's/\/\/.*archive.ubuntu.com/\/\/archive.ubuntu.com/g' /etc/apt/sources.list

export DEBIAN_FRONTEND=noninteractive
apt-add-repository -y ppa:nginx/development
apt-get -y --force-yes update
apt-get -y --force-yes dist-upgrade
apt-get -y --force-yes install nginx openssl unzip

mkdir /etc/nginx/ssl
chmod 600 /etc/nginx/ssl
echo "${cert}" | base64 --decode > /etc/nginx/ssl/cert.pem
echo "${key}" | base64 --decode > /etc/nginx/ssl/key.pem

echo "${conf}" | base64 --decode | sed "s/worker_connections 768;/worker_connections $(ulimit -n);/g" > /etc/nginx/nginx.conf

rm -rf /cyphcdn
echo "${script}" | base64 --decode > /cyphcdn.sh
echo "${update}" | base64 --decode > /update.sh
chmod 700 /cyphcdn.sh
chmod 700 /update.sh
/cyphcdn.sh

updatehour=$RANDOM
let 'updatehour %= 24'
updateday=$RANDOM
let 'updateday %= 7'

crontab -l > /cyphcdn.cron
echo '0,30 * * * * /cyphcdn.sh' >> /cyphcdn.cron
echo "0 ${updatehour} * * ${updateday} /update.sh" >> /cyphcdn.cron
crontab /cyphcdn.cron
rm /cyphcdn.cron

rm cyphcdnsetup.sh
reboot
