From: Zwane Mwaikambo <zwane@linuxpower.ca>
Subject: RE: [PATCH] cpufreq: 1/4 SMT awareness: save cpumask_t cpus
Date: Fri, 20 Aug 2004 01:35:10 -0400 (EDT)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Pine.LNX.4.58.0408200132510.4544@montezuma.fsmlabs.com>
References: <88056F38E9E48644A0F562A38C64FB6002A3B8F0@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <88056F38E9E48644A0F562A38C64FB6002A3B8F0@scsmsx403.amr.corp.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: davej@redhat.com, Dominik Brodowski <linux@dominikbrodowski.de>, cpufreq@www.linux.org.uk

Hi Venkatesh,

On Wed, 18 Aug 2004, Pallipadi, Venkatesh wrote:

> 2) Or leave the synchronization overhead to the policy governor.
> Driver only says a set of CPUs will be affected by the change.
> It is the responsibility of the governor to take care of
> SMT synchronization and preventing one CPU slowing down all
> the other ones. Governor should only write only when all dependent
> CPUs are idle.
>
> I think Dominik is thinking of option 2.
> I see advantages in option 2 as governor can do the synchronization
> at one place, instead of that being done in each low level driver.
> But, having said that, with option 2, a dumb governor may not do
> proper synchronization at all.

Indeed, it 2 would make the most sense especially since we have the
topology information. I'll generate and test a patch as soon as i can.

Thanks,
	Zwane
