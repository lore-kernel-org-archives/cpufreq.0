From: =?UTF-8?B?VG9yYWxmIEbDtnJzdGVy?= <toralf.foerster@gmx.de>
Subject: Re: 3.10-rcX: cpu governor ondemand doesn't scale well after s2ram
Date: Wed, 26 Jun 2013 20:36:18 +0200
Message-ID: <51CB34A2.7090404@gmx.de>
References: <51C08370.4050906@gmx.de> <1778593.ufLkNuJuaY@vostro.rjw.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1778593.ufLkNuJuaY@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: cpufreq@vger.kernel.org

On 06/19/2013 12:05 AM, Rafael J. Wysocki wrote:
> Hmm.  This looks like something unrelated to the previous reports.

yes

> How do you check the frequencies?

much more significant is the temperature :

$> cat /sys/devices/system/cpu/cpu\?/thermal_throttle/package_power_lim=
it_count /proc/acpi/ibm/fan /sys/class/hwmon/hwmon\?/device/temp\?_inpu=
t'

- it is around 49=C2=B0 if just 4 BOINC childs are running at nice leve=
l -19, but it is above 65=C2=B0C if the issue exists. And in hat case I=
 just do run=20

$> for g in performance ondemand; do for i in 0 1 2 3; do echo $g > /sy=
s/devices/system/cpu/cpu$i/cpufreq/scaling_governor; done; done; echo 1=
 > /sys/devices/system/cpu/cpufreq/ondemand/ignore_nice

and the system is back to normal.

> Does that happen every time?  If so, any chance to bisect driver/cpuf=
req
> changes between 3.9 and now?

first bisect attempts failed. I realized that the issue only occurs if =
the power is plugged in. If the system is running on battery the issue =
doesn't occurred (I checked it more than once)

> Does it work without ignore_nice?
Seems not to be related to that.

--=20
MfG/Sincerely
Toralf F=C3=B6rster
pgp finger print: 7B1A 07F4 EC82 0F90 D4C2 8936 872A E508 7DB6 9DA3
