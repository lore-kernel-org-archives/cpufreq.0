From: Erik Slagter <erik@slagter.name>
Subject: Re: [PATCH] acpi-cpufreq: Use IA32_APERF and IA32_MPERF and get freq
 feedback from hardware
Date: Mon, 25 Sep 2006 18:02:51 +0200
Message-ID: <4517FDAB.9010705@slagter.name>
References: <EB12A50964762B4D8111D55B764A8454A4110F@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <EB12A50964762B4D8111D55B764A8454A4110F@scsmsx413.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@www.linux.org.uk

Pallipadi, Venkatesh wrote:

> The problem is, a lot of times current frequency may not mean much as
> frequency can change immediately after one get frequency call or
> immediately before we did the call. The freuency can change
> asynchronously due to number of reasons like hardware coordination, TM2
> and get frequency will not help to get frequency over a period of time.
> Also, there is no call back from hardware when frequency changes
> asynchronously. So, getting average frequency over a period of time is
> the best we can do in order to use the utilization in that period and
> make some frequency target decision for next sampling period.

I get your drift ;-)

Actually what I am interested in is this:

 - spotting frequency switching by tm2 because I suspect my processor
might be running hot sometimes (a little overlocking ;-))
 - seeing the actual running frequency, as this may not be the value the
processor is set for (again, an overclocking issue, I know).

After booting the value in /proc/cpuinfo is correct, related to the
frequency the cpu is actually set to. After a switch by cpufreq, only
the "standard" values are shown there, although performance shows the
cpu is still running at it's higher clock.

BTW I also noticed that on a CPU with C1e the performance increases when
the acpi-cpufreq module is loaded and set to ondemand. Could it be that
the module can make smarter decisions than the processor itself? Does
the module override the C1e functionality, actually? Output of the sys
stats directorie shows indeed correct switching to lower speed when idle.
