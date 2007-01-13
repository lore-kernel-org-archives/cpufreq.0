From: Romain =?iso-8859-1?Q?Li=E9vin?= <roms@lievin.net>
Subject: RE: Frequency can't switch on a dual Turion 64
Date: Sat, 13 Jan 2007 22:55:57 +0100 (CET)
Message-ID: <47131.10.10.10.3.1168725357.squirrel@www.lievin.net>
References: <43212.193.48.146.2.1168602995.squirrel@www.lievin.net>    
	<1449F58C868D8D4E9C72945771150BDFD964C6@SAUSEXMB1.amd.com>   
	<1168719708.14230.78.camel@sublime.site>
Mime-Version: 1.0
Content-Type: multipart/mixed;boundary="----=_20070113225557_96736"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1168719708.14230.78.camel@sublime.site>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: trenn@suse.de
Cc: davej@codemonkey.org.uk, Romain =?iso-8859-1?Q?Li=E9vin?= <roms@lievin.net>, cpufreq@lists.linux.org.uk

------=_20070113225557_96736
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

> I also think this is ACPI triggered...
> does:
> echo 1600000 > /sys/devices/../scaling_max_freq
> helps, maybe shortly?

I already done that some time ago: it does nothing. And echoing on
scaling_cur_freq raises a 'Permission denied'.

> Is this an HP laptop?

No, it isn't. This is a Fujitsu-Siemens Amilo Pa1538.

> Do you have some extended powernow/cpufreq configs in BIOS?

No, I haven't. The BIOS is very small.

> Is it getting too hot?

LM sensors  (k8temp.c) is returning 34 & 3 =B0C for both CPU. Acpi is
returning 37=B0C.

> Check whether there exists a passive trip point in:
> /proc/acpi/thermal_zone/*/trip_points
> and whether
> /proc/acpi/thermal_zone/*/temperature exceeds it.

Trip points exist but they are not exceeded (see ouput attached).

>
>     Thomas
>
>

Romain.
--=20
email:	<roms@lievin.net>
web:	<http://www.lievin.net>
"Linux, y'a moins bien mais c'est plus cher !"









------=_20070113225557_96736
Content-Type: application/octet-stream; name="cpufreq.acpi"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="cpufreq.acpi"

Y29vbGluZyBtb2RlOglhY3RpdmUKPHBvbGxpbmcgZGlzYWJsZWQ+CnN0YXRlOiAgICAgICAgICAg
ICAgICAgICBvawp0ZW1wZXJhdHVyZTogICAgICAgICAgICAgMzYgQwpjcml0aWNhbCAoUzUpOiAg
ICAgICAgICAgMTAzIEMKcGFzc2l2ZTogICAgICAgICAgICAgICAgIDc2IEM6IHRjMT0zIHRjMj0x
IHRzcD0xNTAgZGV2aWNlcz0weGZmZmY4MTAwM2ZmMDZiMzAgMHhmZmZmODEwMDNmZjA2YWYwIAph
Y3RpdmVbMF06ICAgICAgICAgICAgICAgNzUgQzogZGV2aWNlcz0weGZmZmY4MTAwM2ZmMTQyZDAg
CmFjdGl2ZVsxXTogICAgICAgICAgICAgICA2MiBDOiBkZXZpY2VzPTB4ZmZmZjgxMDAzZmYxNDI1
MCAK
------=_20070113225557_96736
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

------=_20070113225557_96736--



