From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] cpufreq: 1/4 SMT awareness: save cpumask_t cpus
Date: Wed, 18 Aug 2004 09:46:36 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB6002A3B8F0@scsmsx403.amr.corp.intel.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Zwane Mwaikambo <zwane@linuxpower.ca>, Dominik Brodowski <linux@dominikbrodowski.de>
Cc: davej@redhat.com, cpufreq@www.linux.org.uk


>But that aside (i'll send a patch for it and Cc you), does=20
>this patchset
>cover the case on SMT systems where one logical cpu is idle=20
>and the whole
>physical package gets throttled. We should only be programming both
>logical cpus when we're increasing the clock frequency and=20
>only one at a
>time on idle. Beat me if this is covered by your patch but i=20
>couldn't find where.
>

I think there are atleast two alternatives here:
1) Do SMT coordination at the driver level (say P4-clockmod),
And do the synchronization as you have mentioned.

2) Or leave the synchronization overhead to the policy governor.
Driver only says a set of CPUs will be affected by the change.=20
It is the responsibility of the governor to take care of
SMT synchronization and preventing one CPU slowing down all=20
the other ones. Governor should only write only when all dependent=20
CPUs are idle.

I think Dominik is thinking of option 2.
I see advantages in option 2 as governor can do the synchronization=20
at one place, instead of that being done in each low level driver.
But, having said that, with option 2, a dumb governor may not do=20
proper synchronization at all.

Thanks,
Venki
