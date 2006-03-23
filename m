From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: Re: [PATCH] keep ignore_nice_load value when the ondemand govenor
 is reselected
Date: Thu, 23 Mar 2006 08:26:11 +0100
Message-ID: <44224D93.5080101@tremplin-utc.net>
References: <4411485F.1010401@tremplin-utc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <4411485F.1010401@tremplin-utc.net>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>, Dave Jones <davej@redhat.com>
Cc: CPUFreq Mailing List <cpufreq@lists.linux.org.uk>

10.03.2006 10:35, Eric Piel wrote/a =C3=A9crit:
> Hello,
>=20
> With the ondemand governor, ignore_nice_load is reset each time the=20
> governor is selected. That's annoying because each time I change to=20
> another governor and change back to ondemand, I also have to set up=20
> ignore_nice_load. eg:
> # cat /sys/devices/system/cpu/cpu0/cpufreq/ondemand/ignore_nice_load
> 1
> # cpufreq-set -g powersave
> # cpufreq-set -g ondemand
> # cat /sys/devices/system/cpu/cpu0/cpufreq/ondemand/ignore_nice_load
> 0
>=20
> This behavior is also inconsistent with the other variables of=20
> /sys/devices/system/cpu/cpu0/cpufreq/ondemand/
>=20
> Attached is a patch that corrects the behavior.

Hello, I've sent this patch and "Warn if ondemand governor can not run=20
due to too long transition latency" mostly 2 weeks ago and didn't get=20
any feedback. It would be nice if at least this patch could make it to=20
2.6.17 as it fixes a glitch. Venki, could you ACK or NACK these patches?

Dave, if they don't apply cleanly against the cpufreq git tree (due to=20
the big clean up commit), I can redo them... just let me know :-)

Eric
