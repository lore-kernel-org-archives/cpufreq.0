From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] transition latency of speedstep-ich (third try)
Date: Wed, 28 Sep 2005 16:53:46 -0700
Message-ID: <88056F38E9E48644A0F562A38C64FB6005DBB974@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: Eric Piel <Eric.Piel@tremplin-utc.net>
Cc: davej@redhat.com, Dominik Brodowski <linux@dominikbrodowski.net>, cpufreq@lists.linux.org.uk


>-----Original Message-----
>From: Eric Piel [mailto:Eric.Piel@tremplin-utc.net]=20
>> Eric,
>> Can you put rdtsc's around these in/out on your system and=20
>check how long do they really take. On P4M, rdtsc should be=20
>running all the time other than the Cpu being in deep_sleep=20
>state. That should give us some idea about the SMM latency.
>>=20
>Ok, I've just done it. It's on a P3 coppermine though (not a P4M). So=20
>I've measure the difference of tsc before and after the in/out=20
>instructions (not included the local_irq_*()). The patch is=20
>attached for=20
>double check (or if someone wants to try on another CPU). The values=20
>seem very small compare to the 500uS you mentioned.
>
>After few minutes with ondemand governor, there was a log like this:
>Sep 28 23:30:32 circle kernel: cpufreq transition took 4862 cycles
>Sep 28 23:30:33 circle kernel: cpufreq transition took 4473 cycles
>Sep 28 23:30:33 circle kernel: cpufreq transition took 4836 cycles
>Sep 28 23:30:35 circle kernel: cpufreq transition took 4723 cycles
>Sep 28 23:30:35 circle kernel: cpufreq transition took 5640 cycles
>Sep 28 23:30:48 circle kernel: cpufreq transition took 4515 cycles
>Sep 28 23:30:48 circle kernel: cpufreq transition took 4904 cycles
>Sep 28 23:31:02 circle kernel: cpufreq transition took 4286 cycles
>Sep 28 23:31:02 circle kernel: cpufreq transition took 4607 cycles
>Sep 28 23:31:03 circle kernel: cpufreq transition took 4279 cycles
>Sep 28 23:31:03 circle kernel: cpufreq transition took 4605 cycles
>Sep 28 23:31:04 circle kernel: cpufreq transition took 4694 cycles
>Sep 28 23:31:04 circle kernel: cpufreq transition took 4605 cycles
>Sep 28 23:31:13 circle kernel: cpufreq transition took 4683 cycles
>Sep 28 23:31:14 circle kernel: cpufreq transition took 4676 cycles
>Sep 28 23:31:14 circle kernel: cpufreq transition took 4515 cycles
>Sep 28 23:31:15 circle kernel: cpufreq transition took 4522 cycles
>
>Maximum I've seen is 5640 cycles, minimum is about 4200c. My CPU is=20
>clocked 1GHz so the result can be easily summarized to a maximum of=20
>about 6uS.
>
>As it's very different from the numbers you got, I wonder if I mistook=20
>somewhere ?
>

I don't have any numbers with Coppermine or P4-M. Probably the reason
For low numbers is TSC itself stops at certain times during this whole
Operation. And it will also run at slower frequency once you change the
Freq (On coppermine). 6uS is too low in my opinion. We may not be=20
measuring correctly here.

Thanks,
Venki
