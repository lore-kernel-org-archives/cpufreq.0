From: Laurence Darby <ldarby@tuffmail.com>
Subject: Re: [PATCH] Re: cpufreq limits avilable frequencies to 800MHz on
	git kernel
Date: Fri, 18 Jul 2008 12:38:58 +0100
Message-ID: <20080718123858.eb989874.ldarby@tuffmail.com>
References: <200805231944.57320.arekm@maven.pl>
	<200807171548.04584.trenn@suse.de>
	<20080718114159.b713360d.ldarby@tuffmail.com>
	<200807181236.16389.trenn@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200807181236.16389.trenn@suse.de>
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
To: Thomas Renninger <trenn@suse.de>
Cc: cpufreq@lists.linux.org.uk

Thomas Renninger wrote:

> On Friday 18 July 2008 12:41:59 pm Laurence Darby wrote:
> >
> > I tried this patch, but I don't think it made a difference, ie. _PPC
> > still got called before the rest.  Was this meant to fix my E8400
> > not being recognised problem?
> 
> Sorry, I not only messed up with mixing up two variables, but also
> with mailing...
> 
> Below  is the one that may work if this really is the problem.
> 

This stops _PPC output appearing altogether, but still gets the same
messages:

...
[    8.168008] acpi-cpufreq: acpi_cpufreq_cpu_init
[    8.168008] cpufreq-core: initialization failed
...

Laurence
