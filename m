From: Alexander Bokovoy <ab@altlinux.org>
Subject: Re: [PATCHSET] 0/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Wed, 22 Oct 2003 00:11:19 +0300
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031021211119.GE3133@sam-solutions.net>
References: <88056F38E9E48644A0F562A38C64FB60077911@scsmsx403.sc.intel.com>
	<yw1xbrsaeu44.fsf@kth.se> <20031021203037.GB3133@sam-solutions.net>
	<yw1xoewaiavf.fsf@kth.se>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <yw1xoewaiavf.fsf@kth.se>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: M?ns Rullg?rd <mru@kth.se>
Cc: cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org

On Tue, Oct 21, 2003 at 10:39:16PM +0200, M?ns Rullg?rd wrote:
> Alexander Bokovoy <ab@altlinux.org> writes:
> 
> >> > Most of the latest CPUs (laptop CPUs in particular) have feature 
> >> > which enable very low latency P-state transitions 
> >> > (like Enhanced Speedstep Technology-EST). Using this feature, 
> >> > we can have a lightweight in kernel cpufreq governor, 
> >> > to vary CPU frequency depending on the CPU usage. The 
> >> > advantage being low power consumption and also cooler laptops.
> >> 
> >> So, I took this thing for a spin, but it didn't work at all.  I loaded
> >> the module, and did "echo demandbased > /sys/.../scaling_governor".
> >> This echo never returned, and the keyboard locked up.  After a little
> >> while, the fan started running at full speed.  I managed to cut and
> >> paste into an xterm and start top, which showed nothing unusual.  I
> >> could shut down and reboot normally.
> > I applied these patches to stock 2.6.0-test8 and selected 'demandbased' as
> > default governor. In result, everything worked from the very beginning, my
> > Centrino-based system went to 600MHz and was upping when load was going
> > higher during compilation or disk access but went down when load was
> > lowering. So it works well for me.
> 
> What's your /proc/cpuinfo?  Mine says
> 
> processor	: 0
> vendor_id	: GenuineIntel
> cpu family	: 15
> model		: 2
> model name	: Mobile Intel(R) Pentium(R) 4 - M CPU 1.80GHz
> stepping	: 7
> cpu MHz		: 2069.912
> cache size	: 512 KB
> fdiv_bug	: no
> hlt_bug		: no
> f00f_bug	: no
> coma_bug	: no
> fpu		: yes
> fpu_exception	: yes
> cpuid level	: 2
> wp		: yes
> flags		: fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe cid
> bogomips	: 4087.80
As I said, it is Centrino-based, with 1.3GHz Pentium M:

processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 9
model name	: Intel(R) Pentium(R) M processor 1300MHz
stepping	: 5
cpu MHz		: 597.592
cache size	: 1024 KB
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 2
wp		: yes
flags		: fpu vme de pse tsc msr mce cx8 apic sep mtrr pge mca cmov pat clflush dts acpi mmx fxsr sse sse2 tm
bogomips	: 1192.75

Note the current CPU MHz sticking to ~600 -- it is cpufreq's result.

-- 
/ Alexander Bokovoy
Samba Team                      http://www.samba.org/
ALT Linux Team                  http://www.altlinux.org/
Midgard Project Ry              http://www.midgard-project.org/
