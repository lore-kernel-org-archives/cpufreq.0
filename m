From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: cpufreq & dual core CPUs.
Date: Wed, 31 May 2006 07:10:51 -0700
Message-ID: <88056F38E9E48644A0F562A38C64FB600861752F@scsmsx403.amr.corp.intel.com>
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
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Andrew Morton <akpm@osdl.org>, Dave Jones <davej@redhat.com>, cpufreq@www.linux.org.uk

=20

>-----Original Message-----
>From: Dominik Brodowski [mailto:linux@dominikbrodowski.net]=20
>Sent: Tuesday, May 30, 2006 10:34 PM
>To: Pallipadi, Venkatesh
>Cc: Dave Jones; Andrew Morton; cpufreq@www.linux.org.uk
>Subject: Re: cpufreq & dual core CPUs.
>
>Hi,
>
>> >That implies to me that they're separate cores no?
>>=20
>> This implies software coordination is not happening here.
>> But, that is OK, as hardware or BIOS coordination can be happening.
>
>However, I still fail to see why hardware/BIOS coordination is=20
>in any way
>better to software coordination and why we don't use software=20
>coordination
>for speedstep-centrino. Especially as it can so easily lead to=20
>confusion.
>

I don't have the numbers comparing the two. But, this is how things go
with hardware and software coordination at ondemand and driver level
(Assuming single socket dual core CPU).

Software coordination
- There is a single instance of sampling happening in ondemand.
- That instance checks utilization of all CPUs (using kstat) and decides
whether to increase or decrease the frequency.
- Then it makes a call to the driver to change the frequency.
- Now driver has to do MSR write on both the cores to ensure the
frequency change.
- It uses set_cpus_allowed to go to first CPU and writes MSR
- It uses set_cpus_allowed to go to second CPU and writes MSR
- Note that set_cpus_allowed in turn kicks up migration thread and then
sets the affinity.

Hardware Coordination
- There can be two instances of sampling running totally independently
using percpu structures.
- Each of them will decide on a frequency based on utilization (kstat
and percpu ondemand structures).
- Then makes the call to the driver to write MSR.=20
- With each instance of sampling happening on correct CPU, there will
not be any need to use set_cpus_allowed at the driver.
- It just sets the MSR on current CPU and returns.

So, avoiding set_cpus_allowed will make hardware coorindation better
than software coordination. This is assuming that ondemand sampling for
each CPU runs independently. Today it does not. But, I have patchsets
that I will be sending out soon that does this.

Thanks,
Venki
