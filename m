From: Andrew Morton <akpm@osdl.org>
Subject: Re: 2.6.11: USB broken on nforce4, ipv6 still broken, centrino
 speedstep even more broken than in 2.6.10
Date: Wed, 25 May 2005 16:54:39 -0700
Message-ID: <20050525165439.7230c9de.akpm@osdl.org>
References: <20050311202122.GA13205@fefe.de>
	<20050311173517.7fe95918.akpm@osdl.org>
	<1110599659.12485.279.camel@localhost.localdomain>
	<20050321163225.4af1c169.akpm@osdl.org>
	<1111454454.6633.5.camel@linux.site>
	<20050322222943.GA10442@codeblau.de> <42434E60.1060209@goop.org>
	<20050325001729.GA30397@codeblau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20050325001729.GA30397@codeblau.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Felix von Leitner <felix-linuxkernel@fefe.de>
Cc: jeremy@goop.org, cpufreq@ZenII.linux.org.uk, abelay@novell.com

Felix von Leitner <felix-linuxkernel@fefe.de> wrote:
>
> Thus spake Jeremy Fitzhardinge (jeremy@goop.org):
> > Unfortunately, the Dothans *REQUIRE* some degree of ACPI support; the
> > speedfreq-centrino needs to extract a table from ACPI to know what are
> > valid operating (voltage/frequency) points to use for the CPU.  The
> > patch you're using is definitely wrong in principle, though if it works
> > for you in practice then by all means use it.
> 
> I enabled these:
> 
>   CONFIG_CPU_FREQ=y
>   CONFIG_CPU_FREQ_STAT=y
>   CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
>   CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
>   CONFIG_CPU_FREQ_GOV_POWERSAVE=y
>   CONFIG_CPU_FREQ_GOV_USERSPACE=y
>   CONFIG_CPU_FREQ_GOV_ONDEMAND=y
>   CONFIG_CPU_FREQ_TABLE=y
>   CONFIG_X86_SPEEDSTEP_CENTRINO=y
>   CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI=y
>   CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=y
> 
> It should have worked, shouldn't it?
> 
> Well, it did not.  You can look at the kernel messages at
> http://dl.fefe.de/dmesg.gz if that helps.
> 
> No cpufreq, and as far as I can see, no speedstep.
> The fan is running, that's all I can tell.
> 

Felix, did all these problems end up getting resolved in 2.6.12-rc5?

If not, we'll probably need a few reminders as to where we stand, thanks.
