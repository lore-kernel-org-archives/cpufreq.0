From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: ondemand governor
Date: Sat, 25 Sep 2004 17:20:21 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB6002F2B127@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C4A35E.9DB6BCB0"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Stefan Seyfried <seife@gmane0305.slipkontur.de>
Cc: cpufreq@www.linux.org.uk

This is a multi-part message in MIME format.

------_=_NextPart_001_01C4A35E.9DB6BCB0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


>-----Original Message-----
>From: Stefan Seyfried [mailto:seife@gmane0305.slipkontur.de]=20
>Sent: Saturday, September 25, 2004 2:59 PM
>To: Pallipadi, Venkatesh
>Cc: cpufreq@www.linux.org.uk
>Subject: Re: ondemand governor
>
>On Sat, Sep 25, 2004 at 11:42:32AM -0700, Pallipadi, Venkatesh wrote:
>
>> >> Unfortunately, only indirectly. Modprobe cpufreq_ondemand=20
>and then=20
>> >> cat /sys/devices/system/cpu/cpu0/cpufreq/ondemand/sampling_rate
>> >> The latency can be deduced then.
>> >
>> >10000
>> >=20
>>=20
>> That means the CPU usage is being checked every 10mS and 100mS for
>> Possible increase and decrease in freq, respectively.
>>=20
>> Try tuning the following.=20
>> down_threshold=3D40
>> up_threshold=3D60
>> sampling_rate=3D100000
>> sampling_down_factor=3D1
>>=20
>> This will make CPU usage checks every 100mS and increase the freq if
>> utilization is more than 60% and decrease the freq if utilization is=20
>> less than 40%.
>
>That's much better (i didn't change up_treshold, 80 is already too
>low IMO :-) but it still goes up with almost no cpu usage often when
>disk is accessed.
>"find /" will push it to 1700 solid.


OK. Attached patch (untested) should help the find / case.

Thanks,
Venki

------_=_NextPart_001_01C4A35E.9DB6BCB0
Content-Type: application/octet-stream;
	name="ondemand_iowait.patch"
Content-Transfer-Encoding: base64
Content-Description: ondemand_iowait.patch
Content-Disposition: attachment;
	filename="ondemand_iowait.patch"

LS0tIGxpbnV4LTIuNi45LXJjMi8vZHJpdmVycy9jcHVmcmVxL2NwdWZyZXFfb25kZW1hbmQuYy5v
cmcJMjAwNC0wOS0yNSAxOTowNjoxMC4wMDAwMDAwMDAgLTA3MDAKKysrIGxpbnV4LTIuNi45LXJj
Mi8vZHJpdmVycy9jcHVmcmVxL2NwdWZyZXFfb25kZW1hbmQuYwkyMDA0LTA5LTI1IDE5OjExOjIx
LjAwMDAwMDAwMCAtMDcwMApAQCAtMjIxLDYgKzIyMSw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmli
dXRlX2dyb3VwIGRic19hdHRyX2cKIHN0YXRpYyB2b2lkIGRic19jaGVja19jcHUoaW50IGNwdSkK
IHsKIAl1bnNpZ25lZCBpbnQgaWRsZV90aWNrcywgdXBfaWRsZV90aWNrcywgZG93bl9pZGxlX3Rp
Y2tzOworCXVuc2lnbmVkIGludCB0b3RhbF9pZGxlX3RpY2tzOwogCXVuc2lnbmVkIGludCBmcmVx
X2Rvd25fc3RlcDsKIAl1bnNpZ25lZCBpbnQgZnJlcV9kb3duX3NhbXBsaW5nX3JhdGU7CiAJc3Rh
dGljIGludCBkb3duX3NraXBbTlJfQ1BVU107CkBAIC0yNDQsOSArMjQ1LDExIEBAIHN0YXRpYyB2
b2lkIGRic19jaGVja19jcHUoaW50IGNwdSkKIAkgKiA1JSBvZiBtYXhfZnJlcXVlbmN5IAogCSAq
LwogCS8qIENoZWNrIGZvciBmcmVxdWVuY3kgaW5jcmVhc2UgKi8KLQlpZGxlX3RpY2tzID0ga3N0
YXRfY3B1KGNwdSkuY3B1c3RhdC5pZGxlIC0gCisJdG90YWxfaWRsZV90aWNrcyA9IGtzdGF0X2Nw
dShjcHUpLmNwdXN0YXQuaWRsZSArCisJCWtzdGF0X2NwdShjcHUpLmNwdXN0YXQuaW93YWl0Owor
CWlkbGVfdGlja3MgPSB0b3RhbF9pZGxlX3RpY2tzIC0gCiAJCXRoaXNfZGJzX2luZm8tPnByZXZf
Y3B1X2lkbGVfdXA7Ci0JdGhpc19kYnNfaW5mby0+cHJldl9jcHVfaWRsZV91cCA9IGtzdGF0X2Nw
dShjcHUpLmNwdXN0YXQuaWRsZTsKKwl0aGlzX2Ric19pbmZvLT5wcmV2X2NwdV9pZGxlX3VwID0g
dG90YWxfaWRsZV90aWNrczsKIAogCS8qIFNjYWxlIGlkbGUgdGlja3MgYnkgMTAwIGFuZCBjb21w
YXJlIHdpdGggdXAgYW5kIGRvd24gdGlja3MgKi8KIAlpZGxlX3RpY2tzICo9IDEwMDsKQEAgLTI1
OCw3ICsyNjEsNyBAQCBzdGF0aWMgdm9pZCBkYnNfY2hlY2tfY3B1KGludCBjcHUpCiAJCQl0aGlz
X2Ric19pbmZvLT5jdXJfcG9saWN5LT5tYXgsIAogCQkJQ1BVRlJFUV9SRUxBVElPTl9IKTsKIAkJ
ZG93bl9za2lwW2NwdV0gPSAwOwotCQl0aGlzX2Ric19pbmZvLT5wcmV2X2NwdV9pZGxlX2Rvd24g
PSBrc3RhdF9jcHUoY3B1KS5jcHVzdGF0LmlkbGU7CisJCXRoaXNfZGJzX2luZm8tPnByZXZfY3B1
X2lkbGVfZG93biA9IHRvdGFsX2lkbGVfdGlja3M7CiAJCXJldHVybjsKIAl9CiAKQEAgLTI2Nywx
MiArMjcwLDEyIEBAIHN0YXRpYyB2b2lkIGRic19jaGVja19jcHUoaW50IGNwdSkKIAlpZiAoZG93
bl9za2lwW2NwdV0gPCBkYnNfdHVuZXJzX2lucy5zYW1wbGluZ19kb3duX2ZhY3RvcikKIAkJcmV0
dXJuOwogCi0JaWRsZV90aWNrcyA9IGtzdGF0X2NwdShjcHUpLmNwdXN0YXQuaWRsZSAtIAorCWlk
bGVfdGlja3MgPSB0b3RhbF9pZGxlX3RpY2tzIC0gCiAJCXRoaXNfZGJzX2luZm8tPnByZXZfY3B1
X2lkbGVfZG93bjsKIAkvKiBTY2FsZSBpZGxlIHRpY2tzIGJ5IDEwMCBhbmQgY29tcGFyZSB3aXRo
IHVwIGFuZCBkb3duIHRpY2tzICovCiAJaWRsZV90aWNrcyAqPSAxMDA7CiAJZG93bl9za2lwW2Nw
dV0gPSAwOwotCXRoaXNfZGJzX2luZm8tPnByZXZfY3B1X2lkbGVfZG93biA9IGtzdGF0X2NwdShj
cHUpLmNwdXN0YXQuaWRsZTsKKwl0aGlzX2Ric19pbmZvLT5wcmV2X2NwdV9pZGxlX2Rvd24gPSB0
b3RhbF9pZGxlX3RpY2tzOwogCiAJZnJlcV9kb3duX3NhbXBsaW5nX3JhdGUgPSBkYnNfdHVuZXJz
X2lucy5zYW1wbGluZ19yYXRlICoKIAkJZGJzX3R1bmVyc19pbnMuc2FtcGxpbmdfZG93bl9mYWN0
b3I7CkBAIC0zNDIsOSArMzQ1LDExIEBAIHN0YXRpYyBpbnQgY3B1ZnJlcV9nb3Zlcm5vcl9kYnMo
c3RydWN0IGMKIAkJdGhpc19kYnNfaW5mby0+Y3VyX3BvbGljeSA9IHBvbGljeTsKIAkJCiAJCXRo
aXNfZGJzX2luZm8tPnByZXZfY3B1X2lkbGVfdXAgPSAKLQkJCQlrc3RhdF9jcHUoY3B1KS5jcHVz
dGF0LmlkbGU7CisJCQkJa3N0YXRfY3B1KGNwdSkuY3B1c3RhdC5pZGxlICsKKwkJCQlrc3RhdF9j
cHUoY3B1KS5jcHVzdGF0Lmlvd2FpdDsKIAkJdGhpc19kYnNfaW5mby0+cHJldl9jcHVfaWRsZV9k
b3duID0gCi0JCQkJa3N0YXRfY3B1KGNwdSkuY3B1c3RhdC5pZGxlOworCQkJCWtzdGF0X2NwdShj
cHUpLmNwdXN0YXQuaWRsZSArCisJCQkJa3N0YXRfY3B1KGNwdSkuY3B1c3RhdC5pb3dhaXQ7CiAJ
CXRoaXNfZGJzX2luZm8tPmVuYWJsZSA9IDE7CiAJCXN5c2ZzX2NyZWF0ZV9ncm91cCgmcG9saWN5
LT5rb2JqLCAmZGJzX2F0dHJfZ3JvdXApOwogCQlkYnNfZW5hYmxlKys7Cg==

------_=_NextPart_001_01C4A35E.9DB6BCB0
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

------_=_NextPart_001_01C4A35E.9DB6BCB0--

