From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] acpi-cpufreq: Use IA32_APERF and IA32_MPERF and get
	freq feedback from hardware
Date: Mon, 25 Sep 2006 09:36:13 -0700
Message-ID: <EB12A50964762B4D8111D55B764A8454A41225@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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
To: Erik Slagter <erik@slagter.name>
Cc: cpufreq@www.linux.org.uk

=20

>-----Original Message-----
>From: Erik Slagter [mailto:erik@slagter.name]=20
>Pallipadi, Venkatesh wrote:
>> The problem is, a lot of times current frequency may not mean much as
>> frequency can change immediately after one get frequency call or
>> immediately before we did the call. The freuency can change
>> asynchronously due to number of reasons like hardware=20
>coordination, TM2
>> and get frequency will not help to get frequency over a=20
>period of time.
>> Also, there is no call back from hardware when frequency changes
>> asynchronously. So, getting average frequency over a period=20
>of time is
>> the best we can do in order to use the utilization in that period and
>> make some frequency target decision for next sampling period.
>
>I get your drift ;-)
>
>Actually what I am interested in is this:
>
> - spotting frequency switching by tm2 because I suspect my processor
>might be running hot sometimes (a little overlocking ;-))
> - seeing the actual running frequency, as this may not be the=20
>value the
>processor is set for (again, an overclocking issue, I know).
>
>After booting the value in /proc/cpuinfo is correct, related to the
>frequency the cpu is actually set to. After a switch by cpufreq, only
>the "standard" values are shown there, although performance shows the
>cpu is still running at it's higher clock.
>

You can look at /sys/..../cpufreq/cpuinfo_cur_freq to get the
instantaneous frequency from hardware (But only works when MSR based
transitions are used. There is no way to get current frequency when IO
port based transitions are being used).
/sys/..../cpufreq/scaling_cur_freq and /proc/cpuinfo shows the last
value that cpufreq tried to set.

>BTW I also noticed that on a CPU with C1e the performance=20
>increases when
>the acpi-cpufreq module is loaded and set to ondemand. Could it be that
>the module can make smarter decisions than the processor itself? Does
>the module override the C1e functionality, actually? Output of the sys
>stats directorie shows indeed correct switching to lower speed=20
>when idle.

I am not sure how ondemand can help with more performance with C1E. One
possible explanation:
With C1E, hardware goes to lower frequency on idle by itself. Only
difference ondemand can be making is running at a lower frequency even
when CPU is busy and average utilization is low. Due to this CPU can run
cooler than without ondemand. And due to that TM2 may not kick in as
frequently as it would without the ondemand. But, I am not sure how C1E
makes the difference here. This behavior should be same with ot without
C1E capable CPU. What is the workload you have. Partially idle? What is
the CPU utilization over time?

Thanks,
Venki
