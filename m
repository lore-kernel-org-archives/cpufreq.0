From: mru@kth.se (=?iso-8859-1?q?M=E5ns_Rullg=E5rd?=)
Subject: Re: [PATCHSET] 0/3 Dynamic cpufreq governor and updates to ACPI
 P-state driver
Date: Tue, 21 Oct 2003 13:09:16 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <yw1x3cdmetk3.fsf@kth.se>
References: <88056F38E9E48644A0F562A38C64FB60077911@scsmsx403.sc.intel.com>
	<yw1xbrsaeu44.fsf@kth.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@www.linux.org.uk
Cc: linux-kernel@vger.kernel.org

mru@kth.se (M=E5ns Rullg=E5rd) writes:

>> Most of the latest CPUs (laptop CPUs in particular) have feature=20
>> which enable very low latency P-state transitions=20
>> (like Enhanced Speedstep Technology-EST). Using this feature,=20
>> we can have a lightweight in kernel cpufreq governor,=20
>> to vary CPU frequency depending on the CPU usage. The=20
>> advantage being low power consumption and also cooler laptops.
>
> So, I took this thing for a spin, but it didn't work at all.  I loaded
> the module, and did "echo demandbased > /sys/.../scaling_governor".
> This echo never returned, and the keyboard locked up.  After a little
> while, the fan started running at full speed.  I managed to cut and
> paste into an xterm and start top, which showed nothing unusual.  I
> could shut down and reboot normally.

I might add that this was on an Asus M2400E laptop.

/proc/cpuinfo:
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 15
model		: 2
model name	: Mobile Intel(R) Pentium(R) 4 - M CPU 1.80GHz
stepping	: 7
cpu MHz		: 2070.179
cache size	: 512 KB
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 2
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca cmov pat pse36=
 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe cid
bogomips	: 4087.80

--=20
M=E5ns Rullg=E5rd
mru@kth.se
