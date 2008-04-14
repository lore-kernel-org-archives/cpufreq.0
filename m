From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Cbe-oss-dev] [Patch] Resending: cell: add spu aware cpufreq
	governor
Date: Mon, 14 Apr 2008 02:21:41 +0200
Message-ID: <200804140221.41726.arnd@arndb.de>
References: <20080118171119.3faa4a6a@de.ibm.com>
	<20080128190341.21c8fc97@de.ibm.com>
	<20080128191225.092a6143@de.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20080128191225.092a6143@de.ibm.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
To: cbe-oss-dev@ozlabs.org
Cc: parabelboi@bopserverein.de, Christian Krafft <krafft@de.ibm.com>, cpufreq@lists.linux.org.uk

Sorry for my late reply, I lost track of this discussion when it happened
during LCA and never got back to it. The patch looks good enough for 2.6.26,
I think, but one thing still really bothers me:

On Monday 28 January 2008, Christian Krafft wrote:
> +/* parts of this function should go into spu scheduler */
> +static int spu_gov_calc_load(struct spu_gov_info_struct *info)
> +{
> +=A0=A0=A0=A0=A0=A0=A0unsigned long active_tasks; /* fixed-point */
> +=A0=A0=A0=A0=A0=A0=A0int cpu, load;
> +
> +=A0=A0=A0=A0=A0=A0=A0cpu =3D info->policy->cpu;
> +=A0=A0=A0=A0=A0=A0=A0active_tasks =3D cbe_spu_info[cpu_to_node(cpu)].nr_=
active * FIXED_1;
> +
> +=A0=A0=A0=A0=A0=A0=A0/* this is also a bit too trivial
> +=A0=A0=A0=A0=A0=A0=A0 * actually we want the max load of all spu's belon=
ging together */
> +=A0=A0=A0=A0=A0=A0=A0CALC_LOAD(info->load, EXP_1, active_tasks);
> +
> +=A0=A0=A0=A0=A0=A0=A0load =3D (info->load + FIXED_1 / 200) >> FSHIFT;
> +
> +=A0=A0=A0=A0=A0=A0=A0return load;
> +}

The nr_active variable in cbe_spu_info has a completely different meaning
from nr_active() in the linux scheduler. AFAICS, basing your computation
on this makes no sense whatsoever. Instead of looking at what threads are
running on the SPUs, you look at what is loaded. Because of our lazy loading
scheduler mechanism, a task occupying all SPUs at 10% of the time and
otherwise calling nanosleep or futex_wait will still show up as 100% load
here, so we don't lower the frequency although we should.

What's worse, a compute-intensive task running on half of the SPUs with the
rest of them being idle shows up as 50% load and causes the frequency to be
dropped to 50%, when it should run at full speed.

	Arnd <><
