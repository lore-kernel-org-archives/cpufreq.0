From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [2.6.9-rc2] ondemand governor not working
Date: Wed, 15 Sep 2004 09:48:37 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB6002DC6069@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C49B43.D8F45ED5"
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
To: kronos@kronoz.cjb.net, cpufreq@www.linux.org.uk

This is a multi-part message in MIME format.

------_=_NextPart_001_01C49B43.D8F45ED5
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


How about this patch?

We should have some lower limit check for transition latency=20
in ondemand governor.=20

Thanks,
Venki

>-----Original Message-----
>From: cpufreq-bounces@www.linux.org.uk=20
>[mailto:cpufreq-bounces@www.linux.org.uk] On Behalf Of Kronos
>Sent: Wednesday, September 15, 2004 9:33 AM
>To: cpufreq@www.linux.org.uk
>Subject: [2.6.9-rc2] ondemand governor not working
>
>Hi,
>I just tried 2.6.9-rc2 and found out that ondemand governor is not
>working. Sampling rate is set to zero:
>
>/sys/devices/system/cpu/cpu0/cpufreq/ondemand/sampling_rate
>0
>/sys/devices/system/cpu/cpu0/cpufreq/ondemand/sampling_rate_max
>0
>/sys/devices/system/cpu/cpu0/cpufreq/ondemand/sampling_rate_min
>0
>
>This is what I've found out: powernow-k7 sets transition_latency to a
>very low value:
>
>powernow: PowerNOW! Technology present. Can scale: frequency=20
>and voltage.
>powernow: FSB: 133.902 MHz
>powernow: Found PSB header at c00f0320
>powernow: Table version: 0x12
>powernow: Flags: 0x0 (Mobile voltage regulator)
>powernow: Settling Time: 100 microseconds.
>powernow: Has 1 PST tables. (Only dumping ones relevant to this CPU).
>powernow: PST:0 (@c00f0330)
>powernow:  cpuid: 0x7a0  fsb: 133  maxFID: 0x16  startvid: 0xb
>powernow:    FID: 0x12 (4.0x [535MHz])  VID: 0x13 (1.200V)
>powernow:    FID: 0x6 (6.0x [803MHz])  VID: 0x13 (1.200V)
>powernow:    FID: 0xa (8.0x [1071MHz])  VID: 0x13 (1.200V)
>powernow:    FID: 0xe (10.0x [1339MHz])  VID: 0xe (1.300V)
>powernow:    FID: 0x2 (12.0x [1606MHz])  VID: 0xc (1.400V)
>powernow:    FID: 0x16 (14.0x [1874MHz])  VID: 0xb (1.450V)
>powernow: SGTC: 13333
>powernow: Minimum speed 535 MHz. Maximum speed 1874 MHz.
>
>powernow-k7.c:637:
>
>policy->cpuinfo.transition_latency =3D 20 * latency / fsb;
>
>transition_latency =3D 20 * 13333 / 133902 =3D (int)1.99 =3D 1
>       =20
>Since transition_latency is expressed in ns it seems to me a bit low,
>maybe it should be 1ms?
>
>The ondemand governor then does this:
>
>cpufreq_ondemand.c:350
>def_sampling_rate =3D (policy->cpuinfo.transition_latency / 1000) *
>                                       =20
>DEF_SAMPLING_RATE_LATENCY_MULTIPLIER;
>
>transition_latency / 1000 is clearly zero.
>
>Luca
>--=20
>Home: http://kronoz.cjb.net
>"La Via prosegue senza fine."
>	Bilbo Baggins - Il Signore degli Anelli - J.R.R. Tolkien
>
>_______________________________________________
>Cpufreq mailing list
>Cpufreq@www.linux.org.uk
>http://www.linux.org.uk/mailman/listinfo/cpufreq
>

------_=_NextPart_001_01C49B43.D8F45ED5
Content-Type: application/octet-stream;
	name="ondemand_latency_lowerlimit.patch"
Content-Transfer-Encoding: base64
Content-Description: ondemand_latency_lowerlimit.patch
Content-Disposition: attachment; filename="ondemand_latency_lowerlimit.patch"

LS0tIGxpbnV4LTIuNi45LXJjMi8vZHJpdmVycy9jcHVmcmVxL2NwdWZyZXFfb25kZW1hbmQuYy5v
cmcJMjAwNC0wOS0xNSAxMTozMjozOC4wMDAwMDAwMDAgLTA3MDAKKysrIGxpbnV4LTIuNi45LXJj
Mi8vZHJpdmVycy9jcHVmcmVxL2NwdWZyZXFfb25kZW1hbmQuYwkyMDA0LTA5LTE1IDExOjM2OjQz
LjAwMDAwMDAwMCAtMDcwMApAQCAtMzQ0LDggKzM0NCwxNCBAQCBzdGF0aWMgaW50IGNwdWZyZXFf
Z292ZXJub3JfZGJzKHN0cnVjdCBjCiAJCSAqIGlzIHVzZWQgZm9yIGZpcnN0IHRpbWUKIAkJICov
CiAJCWlmIChkYnNfZW5hYmxlID09IDEpIHsKKwkJCXVuc2lnbmVkIGludCBsYXRlbmN5OwogCQkJ
LyogcG9saWN5IGxhdGVuY3kgaXMgaW4gblMuIENvbnZlcnQgaXQgdG8gdVMgZmlyc3QgKi8KLQkJ
CWRlZl9zYW1wbGluZ19yYXRlID0gKHBvbGljeS0+Y3B1aW5mby50cmFuc2l0aW9uX2xhdGVuY3kg
LyAxMDAwKSAqCisKKwkJCWxhdGVuY3kgPSBwb2xpY3ktPmNwdWluZm8udHJhbnNpdGlvbl9sYXRl
bmN5OworCQkJaWYgKGxhdGVuY3kgPCAxMDAwKQorCQkJCWxhdGVuY3kgPSAxMDAwOworCisJCQlk
ZWZfc2FtcGxpbmdfcmF0ZSA9IChsYXRlbmN5IC8gMTAwMCkgKgogCQkJCQlERUZfU0FNUExJTkdf
UkFURV9MQVRFTkNZX01VTFRJUExJRVI7CiAJCQlkYnNfdHVuZXJzX2lucy5zYW1wbGluZ19yYXRl
ID0gZGVmX3NhbXBsaW5nX3JhdGU7CiAK

------_=_NextPart_001_01C49B43.D8F45ED5
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

------_=_NextPart_001_01C49B43.D8F45ED5--

