From: "Marc.Thierry" <thierry_mar@metz.supelec.fr>
Subject: Re: Cpufreq on AMD dual opteron 242
Date: Thu, 1 Jul 2004 18:14:23 CEST
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200407011614.i61GENI29047@esemetz.metz.supelec.fr>
Reply-To: thierry_mar@metz.supelec.fr
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
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
To: Bruno Ducrot <ducrot@poupinou.org>, cpufreq@www.linux.org.uk

Of course,=20

Here you are:

dunette parser 399 % cat /proc/cpuinfo=20
processor	: 0
vendor_id	: AuthenticAMD
cpu family	: 15
model		: 5
model name	: AMD Opteron(tm) Processor 242
stepping	: 1
cpu MHz		: 1603.674
cache size	: 1024 KB
fpu		: yes
fpu_exception	: yes
cpuid level	: 1
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat =
pse36 clflush mmx fxsr sse sse2 syscall nx mmxext lm 3dnowext 3dnow
bogomips	: 3153.92
TLB size	: 1088 4K pages
clflush size	: 64
cache_alignment	: 64
address sizes	: 40 bits physical, 48 bits virtual
power management: ts ttp

processor	: 1
vendor_id	: AuthenticAMD
cpu family	: 15
model		: 5
model name	: AMD Opteron(tm) Processor 242
stepping	: 1
cpu MHz		: 1603.674
cache size	: 1024 KB
fpu		: yes
fpu_exception	: yes
cpuid level	: 1
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat =
pse36 clflush mmx fxsr sse sse2 syscall nx mmxext lm 3dnowext 3dnow
bogomips	: 3203.07
TLB size	: 1088 4K pages
clflush size	: 64
cache_alignment	: 64
address sizes	: 40 bits physical, 48 bits virtual
power management: ts ttp


Bruno Ducrot <ducrot@poupinou.org> a =E9crit :

> On Thu, Jul 01, 2004 at 01:23:55PM +0200, Marc.Thierry wrote:
> &gt;=20
> &gt; Hi,
> &gt;=20
> &gt; i'm having problems with using cpufreq on my dual opteron.
> &gt; i've already used cpufreq on a p4 and i was able to make it work.
> &gt;=20
> &gt; 'dmesg |grep powernow' returns :
> &gt;=20
> &gt; powernow-k8: Power state transitions not supported
> &gt; powernow-k8: Power state transitions not supported
> &gt;=20
> &gt; after a 'modprobe powernow-k8' and of course there's no file at
> &quot;/sys/devices/system/cpu/cpu*/&quot;
> &gt;=20
>=20
> Could you please include a
> cat /proc/cpuinfo
> in your report?  Thanks.
>=20
> --=20
> Bruno Ducrot
>=20
> --  Which is worse:  ignorance or apathy?
> --  Don't know.  Don't care.


___________________________________
NOCC, http://nocc.sourceforge.net
