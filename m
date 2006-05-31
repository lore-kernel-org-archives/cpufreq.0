From: Jacob Shin <jacob.w.shin@gmail.com>
Subject: Re: cpufreq & dual core CPUs.
Date: Wed, 31 May 2006 00:05:15 -0500
Message-ID: <447D240B.6090507@gmail.com>
References: <88056F38E9E48644A0F562A38C64FB60085E063E@scsmsx403.amr.corp.intel.com>
	<20060531045417.GA9439@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060531045417.GA9439@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: Andrew Morton <akpm@osdl.org>, cpufreq@www.linux.org.uk

Dave Jones wrote:

> On Tue, May 30, 2006 at 09:40:37PM -0700, Pallipadi, Venkatesh wrote:

> yes, sorry for omitting that, though I'm not sure this problem
> is unique to Intel CPUs, though powernow-k8 does seem to have
> some awareness of the cpu_core_map

Yes, powernow-k8 will populate cpufreq_policy->cpus with cpu_core_map[] in order
to communicate to cpufreq driver that the two cores are tied together in freq,
and voltage.

> Looking at that file on my core duo laptop, I see ..
> 
> (00:47:47:davej@exile:~)$ cat /sys/devices/system/cpu/cpu0/cpufreq/affected_cpus
> 0
> (00:47:54:davej@exile:~)$ cat /sys/devices/system/cpu/cpu1/cpufreq/affected_cpus
> 1
> 
> That implies to me that they're separate cores no?

Are both cores on core-duos tied together?  Then why not populate ->cpus with both
of the cores set?

-Jacob Shin
AMD, Inc.
