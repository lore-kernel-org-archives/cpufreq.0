From: Elvis Stansvik <elvstone@gmail.com>
Subject: Trying to set governor results in instantaneous reboot on MSI K8N
 Master2-FAR with dual Opterons
Date: Fri, 11 Mar 2011 16:30:43 +0100
Message-ID: <AANLkTinyR0scJB7FPzDx6u3Q8kfM39hRuY5U_wP-C-C8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=0016364ed77031f54e049e36a5aa
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=YPvdrOQRmgpLmiqa8YJF3oAVB9iMniPUf2LpqjxcKQ8=;
        b=u/ns38U6BBBAbfv1VD/y4Xws140NSQMJvWhfE6vKPQMVk1NNZ2/+7s5u6uNTRpFJno
         JlMEFEefI2y+C8y5pbrqIe7Axvjqydrmcuz0BZ1MFpjJEbJbzhOi5tTiz7oyssXmAyW2
         jwZRyhPSKFow1KhX6SvFekCMoBRk8M97xQJXc=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: cpufreq@vger.kernel.org

--0016364ed77031f54e049e36a5aa
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

I'm trying to get CPU frequency scaling to work on an MSI K8N
Master2-FAR motherboard running dual Opteron 252.

At first, the powernow-k8 module wouldn't load saying "No such
device", but after a BIOS upgrade from version 1.1 to version 1.42
from MSI, the 'powernow-k8' module loaded without problems. The dmesg
output when loading is attached as dmesg.txt.

The output of `cpufreq-info' after loading the module looks fine, and
is attached as cpufreq-info.txt

I can also load the two governor modules cpufreq_conservative and
cpufreq_ondemand without any problems.

However, whenever I try to change the scaling governor to anything
else than the default (performance), by running e.g.

cpufreq-set -r -g ondemand

or

cpufreq-set -c 0 -g ondemand

I get an immediate reboot!

I've also attached my /proc/cpuinfo as cpuinfo.txt.

The two Opterons are OSP252FAABL.

I'm running an up-to-date Arch Linux (x64) with kernel 2.6.37.

Another interesting bit is that the "Cool'n'Quiet" option that was
present in BIOS version 1.1 disappeared when I upgraded to 1.42.

I originally posted my problem on the Arch Linux Forum but was adviced
to bring it here. My original post can be found at [1].

Anyone have this board working with frequency scaling and dual CPUs?
Would love to get it to work as I'm more interested in silence than in
performance, and frequency scaling would allow my fans to spin down a
bit when I'm not doing CPU intensive work.

Note that my processor model isn't detected (in /proc/cpuinfo or by
cpufreq-info). I believe this could possibly be due to BIOS not
recognizing the model either. The OSP252FAABL is identical to the
OSA252FAABL I think. It's just that they were only sold to system
builders like HP and IBM. Found mine on eBay. Could the fact that the
exact model isn't recognized by the kernel have something to do with
my reboot problem?

Thankful for any advice/help!

Best regards,
Elvis

[1] https://bbs.archlinux.org/viewtopic.php?pid=902284

--0016364ed77031f54e049e36a5aa
Content-Type: text/plain; charset=US-ASCII; name="dmesg.txt"
Content-Disposition: attachment; filename="dmesg.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gl59al980

cG93ZXJub3ctazg6IEZvdW5kIDEgQU1EIFByb2Nlc3NvciBNb2RlbCBVbmtub3duICgyIGNwdSBj
b3JlcykgKHZlcnNpb24gMi4yMC4wMCkKcG93ZXJub3ctazg6ICAgIDAgOiBmaWQgMHgxMiAoMjYw
MCBNSHopLCB2aWQgMHg2CnBvd2Vybm93LWs4OiAgICAxIDogZmlkIDB4MTAgKDI0MDAgTUh6KSwg
dmlkIDB4OApwb3dlcm5vdy1rODogICAgMiA6IGZpZCAweGUgKDIyMDAgTUh6KSwgdmlkIDB4YQpw
b3dlcm5vdy1rODogICAgMyA6IGZpZCAweGMgKDIwMDAgTUh6KSwgdmlkIDB4Ywpwb3dlcm5vdy1r
ODogICAgNCA6IGZpZCAweGEgKDE4MDAgTUh6KSwgdmlkIDB4ZQpwb3dlcm5vdy1rODogICAgNSA6
IGZpZCAweDIgKDEwMDAgTUh6KSwgdmlkIDB4MTIKcG93ZXJub3ctazg6ICAgIDAgOiBmaWQgMHgx
MiAoMjYwMCBNSHopLCB2aWQgMHg2CnBvd2Vybm93LWs4OiAgICAxIDogZmlkIDB4MTAgKDI0MDAg
TUh6KSwgdmlkIDB4OApwb3dlcm5vdy1rODogICAgMiA6IGZpZCAweGUgKDIyMDAgTUh6KSwgdmlk
IDB4YQpwb3dlcm5vdy1rODogICAgMyA6IGZpZCAweGMgKDIwMDAgTUh6KSwgdmlkIDB4Ywpwb3dl
cm5vdy1rODogICAgNCA6IGZpZCAweGEgKDE4MDAgTUh6KSwgdmlkIDB4ZQpwb3dlcm5vdy1rODog
ICAgNSA6IGZpZCAweDIgKDEwMDAgTUh6KSwgdmlkIDB4MTI=
--0016364ed77031f54e049e36a5aa
Content-Type: text/plain; charset=US-ASCII; name="cpufreq-info.txt"
Content-Disposition: attachment; filename="cpufreq-info.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gl59aqcn1

Y3B1ZnJlcXV0aWxzIDAwODogY3B1ZnJlcS1pbmZvIChDKSBEb21pbmlrIEJyb2Rvd3NraSAyMDA0
LTIwMDkKUmVwb3J0IGVycm9ycyBhbmQgYnVncyB0byBjcHVmcmVxQHZnZXIua2VybmVsLm9yZywg
cGxlYXNlLgphbmFseXppbmcgQ1BVIDA6CiAgZHJpdmVyOiBwb3dlcm5vdy1rOAogIENQVXMgd2hp
Y2ggcnVuIGF0IHRoZSBzYW1lIGhhcmR3YXJlIGZyZXF1ZW5jeTogMAogIENQVXMgd2hpY2ggbmVl
ZCB0byBoYXZlIHRoZWlyIGZyZXF1ZW5jeSBjb29yZGluYXRlZCBieSBzb2Z0d2FyZTogMAogIG1h
eGltdW0gdHJhbnNpdGlvbiBsYXRlbmN5OiAxMDkgdXMuCiAgaGFyZHdhcmUgbGltaXRzOiAxMDAw
IE1IeiAtIDIuNjAgR0h6CiAgYXZhaWxhYmxlIGZyZXF1ZW5jeSBzdGVwczogMi42MCBHSHosIDIu
NDAgR0h6LCAyLjIwIEdIeiwgMi4wMCBHSHosIDEuODAgR0h6LCAxMDAwIE1IegogIGF2YWlsYWJs
ZSBjcHVmcmVxIGdvdmVybm9yczogY29uc2VydmF0aXZlLCBvbmRlbWFuZCwgcGVyZm9ybWFuY2UK
ICBjdXJyZW50IHBvbGljeTogZnJlcXVlbmN5IHNob3VsZCBiZSB3aXRoaW4gMTAwMCBNSHogYW5k
IDIuNjAgR0h6LgogICAgICAgICAgICAgICAgICBUaGUgZ292ZXJub3IgInBlcmZvcm1hbmNlIiBt
YXkgZGVjaWRlIHdoaWNoIHNwZWVkIHRvIHVzZQogICAgICAgICAgICAgICAgICB3aXRoaW4gdGhp
cyByYW5nZS4KICBjdXJyZW50IENQVSBmcmVxdWVuY3kgaXMgMi42MCBHSHouCmFuYWx5emluZyBD
UFUgMToKICBkcml2ZXI6IHBvd2Vybm93LWs4CiAgQ1BVcyB3aGljaCBydW4gYXQgdGhlIHNhbWUg
aGFyZHdhcmUgZnJlcXVlbmN5OiAxCiAgQ1BVcyB3aGljaCBuZWVkIHRvIGhhdmUgdGhlaXIgZnJl
cXVlbmN5IGNvb3JkaW5hdGVkIGJ5IHNvZnR3YXJlOiAxCiAgbWF4aW11bSB0cmFuc2l0aW9uIGxh
dGVuY3k6IDEwOSB1cy4KICBoYXJkd2FyZSBsaW1pdHM6IDEwMDAgTUh6IC0gMi42MCBHSHoKICBh
dmFpbGFibGUgZnJlcXVlbmN5IHN0ZXBzOiAyLjYwIEdIeiwgMi40MCBHSHosIDIuMjAgR0h6LCAy
LjAwIEdIeiwgMS44MCBHSHosIDEwMDAgTUh6CiAgYXZhaWxhYmxlIGNwdWZyZXEgZ292ZXJub3Jz
OiBjb25zZXJ2YXRpdmUsIG9uZGVtYW5kLCBwZXJmb3JtYW5jZQogIGN1cnJlbnQgcG9saWN5OiBm
cmVxdWVuY3kgc2hvdWxkIGJlIHdpdGhpbiAxMDAwIE1IeiBhbmQgMi42MCBHSHouCiAgICAgICAg
ICAgICAgICAgIFRoZSBnb3Zlcm5vciAicGVyZm9ybWFuY2UiIG1heSBkZWNpZGUgd2hpY2ggc3Bl
ZWQgdG8gdXNlCiAgICAgICAgICAgICAgICAgIHdpdGhpbiB0aGlzIHJhbmdlLgogIGN1cnJlbnQg
Q1BVIGZyZXF1ZW5jeSBpcyAyLjYwIEdIei4=
--0016364ed77031f54e049e36a5aa
Content-Type: text/plain; charset=US-ASCII; name="cpuinfo.txt"
Content-Disposition: attachment; filename="cpuinfo.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gl59at7j2

cHJvY2Vzc29yICAgICAgIDogMAp2ZW5kb3JfaWQgICAgICAgOiBBdXRoZW50aWNBTUQKY3B1IGZh
bWlseSAgICAgIDogMTUKbW9kZWwgICAgICAgICAgIDogMzcKbW9kZWwgbmFtZSAgICAgIDogQU1E
IFByb2Nlc3NvciBNb2RlbCBVbmtub3duCnN0ZXBwaW5nICAgICAgICA6IDEKY3B1IE1IeiAgICAg
ICAgIDogMjYwMC4wMDAKY2FjaGUgc2l6ZSAgICAgIDogMTAyNCBLQgpmcHUgICAgICAgICAgICAg
OiB5ZXMKZnB1X2V4Y2VwdGlvbiAgIDogeWVzCmNwdWlkIGxldmVsICAgICA6IDEKd3AgICAgICAg
ICAgICAgIDogeWVzCmZsYWdzICAgICAgICAgICA6IGZwdSB2bWUgZGUgcHNlIHRzYyBtc3IgcGFl
IG1jZSBjeDggYXBpYyBzZXAgbXRyciBwZ2UgbWNhIGNtb3YgcGF0IHBzZTM2IGNsZmx1c2ggbW14
IGZ4c3Igc3NlIHNzZTIgc3lzY2FsbCBueCBtbXhleHQgZnhzcl9vcHQgbG0gM2Rub3dleHQgM2Ru
b3cgcmVwX2dvb2Qgbm9wbCBwbmkgbGFoZl9sbQpib2dvbWlwcyAgICAgICAgOiA1MjI5LjcyClRM
QiBzaXplICAgICAgICA6IDEwMjQgNEsgcGFnZXMKY2xmbHVzaCBzaXplICAgIDogNjQKY2FjaGVf
YWxpZ25tZW50IDogNjQKYWRkcmVzcyBzaXplcyAgIDogNDAgYml0cyBwaHlzaWNhbCwgNDggYml0
cyB2aXJ0dWFsCnBvd2VyIG1hbmFnZW1lbnQ6IHRzIGZpZCB2aWQgdHRwCgpwcm9jZXNzb3IgICAg
ICAgOiAxCnZlbmRvcl9pZCAgICAgICA6IEF1dGhlbnRpY0FNRApjcHUgZmFtaWx5ICAgICAgOiAx
NQptb2RlbCAgICAgICAgICAgOiAzNwptb2RlbCBuYW1lICAgICAgOiBBTUQgUHJvY2Vzc29yIE1v
ZGVsIFVua25vd24Kc3RlcHBpbmcgICAgICAgIDogMQpjcHUgTUh6ICAgICAgICAgOiAyNjAwLjAw
MApjYWNoZSBzaXplICAgICAgOiAxMDI0IEtCCmZwdSAgICAgICAgICAgICA6IHllcwpmcHVfZXhj
ZXB0aW9uICAgOiB5ZXMKY3B1aWQgbGV2ZWwgICAgIDogMQp3cCAgICAgICAgICAgICAgOiB5ZXMK
ZmxhZ3MgICAgICAgICAgIDogZnB1IHZtZSBkZSBwc2UgdHNjIG1zciBwYWUgbWNlIGN4OCBhcGlj
IHNlcCBtdHJyIHBnZSBtY2EgY21vdiBwYXQgcHNlMzYgY2xmbHVzaCBtbXggZnhzciBzc2Ugc3Nl
MiBzeXNjYWxsIG54IG1teGV4dCBmeHNyX29wdCBsbSAzZG5vd2V4dCAzZG5vdyByZXBfZ29vZCBu
b3BsIHBuaSBsYWhmX2xtCmJvZ29taXBzICAgICAgICA6IDUyMjguMjIKVExCIHNpemUgICAgICAg
IDogMTAyNCA0SyBwYWdlcwpjbGZsdXNoIHNpemUgICAgOiA2NApjYWNoZV9hbGlnbm1lbnQgOiA2
NAphZGRyZXNzIHNpemVzICAgOiA0MCBiaXRzIHBoeXNpY2FsLCA0OCBiaXRzIHZpcnR1YWwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAKcG93ZXIgbWFuYWdlbWVudDogdHMgZmlkIHZpZCB0dHA=
--0016364ed77031f54e049e36a5aa--
