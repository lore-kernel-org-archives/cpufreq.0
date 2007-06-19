From: "Lei Yang" <leiyang@google.com>
Subject: Re: Which cpu-freq module to use for Intel(R) Xeon(R) CPU
Date: Tue, 19 Jun 2007 15:00:24 -0700
Message-ID: <c583a31b0706191500s5e36dc83xd67b0d61f4ff8025@mail.gmail.com>
References: <c583a31b0706191434r6d4ad0d7h5316d76bf210caa1@mail.gmail.com>
	<653FFBB4508B9042B5D43DC9E18836F501091A2D@scsmsx415.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <653FFBB4508B9042B5D43DC9E18836F501091A2D@scsmsx415.amr.corp.intel.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: Dave Jones <davej@redhat.com>, cpufreq@lists.linux.org.uk

Venki, Thanks for the fast response!!

I did try to use the acpi-cpufreq module, however I got an error when I
modprobe:

modprobe acpi-cpufreq
FATAL: Error inserting acpi_cpufreq (/lib/modules/2.6.18-
smp-210.1_rc2/kernel/arch/x86_64/kernel/cpufreq/acpi-cpufreq.ko): Device or
resource busy

Any idea what went wrong?

About the last problem, scaling_cur_freq also shows 1998000, which means
that 'echo  2331000 > scaling_setspeed' doesn't have any effect at all.
Also, what do you mean by 'try changing freq of all CPUs in a physical
package and check'?

Thanks again,
Lei


On 6/19/07, Pallipadi, Venkatesh <venkatesh.pallipadi@intel.com> wrote:
>
>
>
> >-----Original Message-----
> >From: cpufreq-bounces@lists.linux.org.uk
> >[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Lei Yang
> >Sent: Tuesday, June 19, 2007 2:34 PM
> >To: Dave Jones
> >Cc: cpufreq@lists.linux.org.uk
> >Subject: Re: Which cpu-freq module to use for Intel(R) Xeon(R) CPU
> >
> >OK. I upgraded the system to 2.6.18. I can now load the
> >speedstep-centrino
> >module and used the 'userspace' govener. In
> >/sys/devices/system/cpu/cpu0/cpufreq/ there are the following files:
>
> Post 2.6.20 kernel, you should use acpi-cpufreq driver.
>
> >
> >affected_cpus     cpuinfo_max_freq  scaling_available_frequencies
> >scaling_cur_freq  scaling_governor  scaling_min_freq
> >cpuinfo_cur_freq  cpuinfo_min_freq  scaling_available_governors
> >scaling_driver    scaling_max_freq  scaling_setspeed
> >
> >I have the following questions/problems:
> >
> >1)  I looked into the value of each file.
> >     cpuinfo_max_freq : 2331000
> >     cpuinfo_min_freq: 1998000
> >     scaling_available_frequencies : 2331000 1998000 1998000
> >1998000 1998000
> >1998000
> >
> >Why the available frequencies have multiple 1998000?
>
> This is how BIOSes export it to avoid having dynamic table to support
> different CPU models. Later kernels
> remove duplicates while displaying the freq. This is just the cosmetic
> issue of how things are displayed.
>
> >2) Since I'm using the userspace govener, I tried 'echo 1998000 >
> >scaling_setspeed' , then
> >
> >scaling_setspeed : 1998000
> >
> >However, cpuinfo_cur_freq is still 2331000. In contrast,
> >/proc/cpuinfo shows
> >that the frequency is actually changed to 1998.000 MHz. Why are they
> >inconsistent?
>
> scaling_cur_freq must be showing 1998 in this case.
> cpuinfo_cur_freq shows the actual freq from hardware, which can be
> higher due to some dependent core/thread
> (in same package) requesting higher freq. /proc/cpuinfo and
> scaling_cur_freq shows kernel cahcned freq for this CPU.
>
>
> >
> >3) Afterwards, I want to change the frequency back to 2331000
> >by calling
> >'echo 2331000 > scaling_setspeed'. However, the
> >'scaling_setspeed' is not
> >changed and the frequency is still 1998000. I tried this
> >several times with
> >no luck. Is this a bug in the govener or in the centrino module?
> >
>
> Not sure about this. This should change ideally. Will be interesting to
> see what *cur_freq shows.
> Also try changing freq of all CPUs in a physical package and check.
>
> Thanks,
> Venki
>
