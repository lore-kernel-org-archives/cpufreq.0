From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] speedstep-centrino: Avoid returning zero freq on
	transient MSR values
Date: Fri, 10 Dec 2004 10:37:09 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB60038B2BFD@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.de>, Jeremy Fitzhardinge <jeremy@goop.org>
Cc: davej@redhat.com, cpufreq list <cpufreq@www.linux.org.uk>

>-----Original Message-----
>From: Dominik Brodowski [mailto:linux@dominikbrodowski.de]=20
>Sent: Friday, December 10, 2004 6:48 AM
>To: Jeremy Fitzhardinge
>Cc: Pallipadi, Venkatesh; davej@redhat.com; cpufreq list
>Subject: Re: [PATCH] speedstep-centrino: Avoid returning zero=20
>freq on transient MSR values
>
>> Doesn't this suggest there's a more subtle problem?  If the CPU is
>> changing speeds autonomously, then it means the TSC=20
>calibration will be
>> broken.  Is there some way of finding out about these transitions?
>
>The TSC runs at a fixed frequency on these CPUs [Venki will=20
>submit a patch
>for that soon], so it isn't a problem for the kernel AFAICS.

Yes. These are Pentium 4 based processsors and with Enhanced Speedstep
on these processors, tsc rate will not change with CPU frequency change.

>> Also, why not just report the actual MSR frequency, rather=20
>than looking
>> for a table/_PSS match?  Are the MSR values meaningfully encoded?
>
>AFAIK, the encoding may be very chip specific.

The MSR value encoding is not well defined and can change.=20
I agree that the udelay in this patch is kind of ugly, as it can slow
down get_freq(). But, the transient value are uncommon, so we may not go
through that code path very frequently. Other, way to solve it is to
look at CONTROL MSR, whenever we have this transient value.
I will work on a patch from that angle and we can probably pick the
better of the two patches.

Thanks,
Venki
