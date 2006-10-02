From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] acpi-cpufreq: Use IA32_APERF and IA32_MPERF and get
	freq feedback from hardware
Date: Mon, 2 Oct 2006 19:03:35 -0400
Message-ID: <20061002230335.GB9748@dominikbrodowski.de>
References: <EB12A50964762B4D8111D55B764A8454A41225@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <EB12A50964762B4D8111D55B764A8454A41225@scsmsx413.amr.corp.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@www.linux.org.uk

On Mon, Sep 25, 2006 at 09:36:13AM -0700, Pallipadi, Venkatesh wrote:
> >BTW I also noticed that on a CPU with C1e the performance 
> >increases when
> >the acpi-cpufreq module is loaded and set to ondemand. Could it be that
> >the module can make smarter decisions than the processor itself? Does
> >the module override the C1e functionality, actually? Output of the sys
> >stats directorie shows indeed correct switching to lower speed 
> >when idle.
> 
> I am not sure how ondemand can help with more performance with C1E. One
> possible explanation:
> With C1E, hardware goes to lower frequency on idle by itself. Only
> difference ondemand can be making is running at a lower frequency even
> when CPU is busy and average utilization is low. Due to this CPU can run
> cooler than without ondemand. And due to that TM2 may not kick in as
> frequently as it would without the ondemand. But, I am not sure how C1E
> makes the difference here. This behavior should be same with ot without
> C1E capable CPU. What is the workload you have. Partially idle? What is
> the CPU utilization over time?

Does the CPU get out of C1E quicker if the CPU frequency is already lower?

Thanks,
	Dominik
