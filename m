From: Zwane Mwaikambo <zwane@linuxpower.ca>
Subject: Re: [PATCH] cpufreq: 1/4 SMT awareness: save cpumask_t cpus
Date: Mon, 30 Aug 2004 12:45:19 -0400 (EDT)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Pine.LNX.4.58.0408301229020.21527@montezuma.fsmlabs.com>
References: <88056F38E9E48644A0F562A38C64FB6002A3B8F0@scsmsx403.amr.corp.intel.com>
	<Pine.LNX.4.58.0408200132510.4544@montezuma.fsmlabs.com>
	<20040829130134.GC17032@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040829130134.GC17032@dominikbrodowski.de>
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: davej@redhat.com, cpufreq@www.linux.org.uk

On Sun, 29 Aug 2004, Dominik Brodowski wrote:

> Actually, I do favor "2" by large, and there simply may not be "dumb"
> governors once we propagate the SMT awareness to the cpufreq core. Zwane,
> are you aware of my current patch set which aims at the same direction? IIRC
> [and my memory might be a bit off after a long vacation], it mostly needs
> work from the "governor" perspective -- and testing. Don't have hardware
> here...

Yeah, i saw the patches and indeed the work should be done in the
governor, i should be able to help with the testing.

Thanks,
	Zwane
