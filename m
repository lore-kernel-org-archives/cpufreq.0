From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: longrun.
Date: Sat, 3 Jul 2004 21:33:13 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040703193313.GA8736@dominikbrodowski.de>
References: <20040703163807.GU7101@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040703163807.GU7101@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

On Sat, Jul 03, 2004 at 05:38:07PM +0100, Dave Jones wrote:
> I was just looking into this..
> Error: ./arch/i386/kernel/cpu/cpufreq/longrun.o .data refers to 00000018 R_386_32          .init.text
> 
> When I noticed that longrun_get_policy() is only called from longrun_cpu_init().
> Is there a reason this driver doesn't have a .getpolicy method pointer pointing
> to this routine ?

Because "policy" is/should be driver specific. Longrun CPUs can be set to a
frequency range _and_ a "policy" (powersave or performance); even though we
currently assume all such "range" CPUs support these two modes we should
stop doing so soon. So, the core doesn't implement a "getpolicy" method --
only a "get" (==get current frequency) function. For Longrun CPUs, this is
purely informational as neither the TSC nor any other part of the kernel
needs to know the current frequency, and the frequency may and most likely
will change "behind the kernel's back". And it is implemented in

static unsigned int longrun_get(unsigned int cpu)

> 
> Incidentally, I'm a bit puzzled by the error.
> The only __init functions are ..
> 
> longrun_get_policy
> longrun_determine_freqs
> longrun_cpu_init
> longrun_init
> 
> The first two are only called by the 3rd. and the 3rd/4th are
> only ever called at init time.
> 
> What do I miss here?

Sorry, don't know what's broken here. However, I might suspect these
functions being __init() [*] -- could you change that to __devinit and/or
remove it completely, and re-test, please?

Thanks,
	Dominik


[*] ... I know, it was me ...
