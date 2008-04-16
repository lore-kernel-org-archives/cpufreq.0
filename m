From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Cbe-oss-dev] [Patch] Resending:
	cell_add_spuaware_cpufreq_governor.diff
Date: Wed, 16 Apr 2008 14:08:25 +0200
Message-ID: <200804161408.26145.arnd@arndb.de>
References: <20080118171119.3faa4a6a@de.ibm.com>
	<200804140221.41726.arnd@arndb.de>
	<20080416134938.01d27dc2@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20080416134938.01d27dc2@de.ibm.com>
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
To: cbe-oss-dev@ozlabs.org
Cc: parabelboi@bopserverein.de, Christian Krafft <krafft@de.ibm.com>, cpufreq@lists.linux.org.uk

On Wednesday 16 April 2008, Christian Krafft wrote:
> This patch is also missing a correct load calculation.
> It works pretty well for spu's running at full time or idling, but not so well
> for mixed load (i.e. each spu running 50 percent of the time we would
> switch to fullspeed instead of half speed).

So why should that be something to optimize for? If the SPUs are all idle,
I would assume we'd be better off throwing the tasks off and putting them
into low-power mode, rather than changing the frequency, right?

What's the point of your driver, really?

	Arnd <><
