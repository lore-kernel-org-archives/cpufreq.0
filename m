From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: problems setting freq on dual core t2600, 2.6.17-1.2157_FC5smp
Date: Thu, 3 Aug 2006 13:47:16 -0700
Message-ID: <EB12A50964762B4D8111D55B764A8454566E8C@scsmsx413.amr.corp.intel.com>
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
To: tobias.bocanegra@day.com, Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Cc: cpufreq@lists.linux.org.uk



> something other that is funny is that sysfs does not show correct
cur_freq
> # echo 1000000 > scaling_setspeed
> # cat cpuinfo_cur_freq
> 1667000
>=20
> # cat /proc/cpuinfo | grep MHz
> cpu MHz         : 1000.000=20

Can you "cat scaling_cur_freq" at the same time? My guess is that will
show 1000000.

/proc/cpuinfo and scaling_cur_freq shows previously cached value, value
that was tried to be set last time. cpuinfo_cur_freq shows current
frequency that is gets from hardware. As you have a dual coure CPU and 2
CPUs sharing frequency in hardware coordinated manner [1], you will have
to reduce the freq on both to see the actual change. Actual hardware
frequency increase happens as soon as any one core requests for higher
freq, however.

Thanks,
Venki

[1] Hardware coordination of frequencies: More than one logical
processors can share same frequency by design. The frequency
coordination across them will happen in hardware coordination, in which
case, OS will think that each CPU has its own independent control and
give requests to the CPU independently. Hardware picks the highest
frequency among all dependent CPUs and maintains all dependent CPUs at
that frequency.
