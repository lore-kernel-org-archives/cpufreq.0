From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Which cpu-freq module to use for Intel(R) Xeon(R) CPU
Date: Tue, 19 Jun 2007 15:07:25 -0700
Message-ID: <653FFBB4508B9042B5D43DC9E18836F501091A66@scsmsx415.amr.corp.intel.com>
References: <c583a31b0706191500s5e36dc83xd67b0d61f4ff8025@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <c583a31b0706191500s5e36dc83xd67b0d61f4ff8025@mail.gmail.com>
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
To: Lei Yang <leiyang@google.com>
Cc: Dave Jones <davej@redhat.com>, cpufreq@lists.linux.org.uk

=20


________________________________

	From: Lei Yang [mailto:leiyang@google.com]=20
	Sent: Tuesday, June 19, 2007 3:00 PM
	To: Pallipadi, Venkatesh
	Cc: Dave Jones; cpufreq@lists.linux.org.uk
	Subject: Re: Which cpu-freq module to use for Intel(R) Xeon(R)
CPU
=09
=09
	Venki, Thanks for the fast response!!
=09
	I did try to use the acpi-cpufreq module, however I got an error
when I modprobe:
=09
	modprobe acpi-cpufreq
	FATAL: Error inserting acpi_cpufreq
(/lib/modules/2.6.18-smp-210.1_rc2/kernel/arch/x86_64/kernel/cpufreq/acp
i-cpufreq.ko ): Device or resource busy
=09
	Any idea what went wrong?


[Venki] Yes. This may not work on 2.6.18. If you use 2.6.21 however,
thie above should work.
=09
	About the last problem, scaling_cur_freq also shows 1998000,
which means that 'echo  2331000 > scaling_setspeed' doesn't have any
effect at all. Also, what do you mean by 'try changing freq of all CPUs
in a physical package and check'?=20

[Venki] On most processors all logical CPUs (cores, threads) share the
same frequency using something called Hardware coordination. That means,
only when all dependent logical CPUs request for a lower freq, they
change the freq. If one logical CPU asks for higer freq and the other
logical CPU which is dependent asks for a lower freq, then both of them
continue to run at higher freq.
I guess on you system you have 2 physical sockets? All logical CPUs
belonging to one socket will be dependent for frequency. So, when you do
setspeed, try echoing for each CPU in the socket and then check whether
the change has taken effect.

Also, if you use ondemand governor, CPU freq should automatically change
based on utilization.

Thanks,
Venki
