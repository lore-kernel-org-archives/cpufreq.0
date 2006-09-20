From: Nils =?iso-8859-1?q?H=FCbner?= <nils.huebner@gmx.de>
Subject: Unsupported CPU by Linux-PHC 0.2.6
Date: Wed, 20 Sep 2006 21:51:11 +0200
Message-ID: <200609202151.11879.nils.huebner@gmx.de>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_vuZEFqMsHf2/sZT"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
To: cpufreq@lists.linux.org.uk

--Boundary-00=_vuZEFqMsHf2/sZT
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi everyone,

i tried to install Linux-PHC 0.2.6 on my Suse Linux 10.1 with Kernel 2.6.18 
final.

I got this error-message:
-----------Begin
Si1520:/home/nils # dmesg|grep speedstep
speedstep-centrino: found unsupported CPU with Enhanced SpeedStep: 
send /proc/cpuinfo to cpufreq@lists.linux.org.uk
-----------End

My CPU is an Intel Core Duo T2300. It should normally be supported, shouldn't 
it?
So i followed your advise, i attached the file to this mail.

Thanks in advance.

Greets,
	Nils Huebner from Germany

--Boundary-00=_vuZEFqMsHf2/sZT
Content-Type: text/plain;
  charset="us-ascii";
  name="cpuinfo"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="cpuinfo"

processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 14
model name	: Genuine Intel(R) CPU           T2300  @ 1.66GHz
stepping	: 8
cpu MHz		: 1663.279
cache size	: 2048 KB
physical id	: 0
siblings	: 2
core id		: 0
cpu cores	: 2
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 10
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx constant_tsc pni monitor vmx est tm2 xtpr
bogomips	: 3330.07

processor	: 1
vendor_id	: GenuineIntel
cpu family	: 6
model		: 14
model name	: Genuine Intel(R) CPU           T2300  @ 1.66GHz
stepping	: 8
cpu MHz		: 1663.279
cache size	: 2048 KB
physical id	: 0
siblings	: 2
core id		: 1
cpu cores	: 2
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 10
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx constant_tsc pni monitor vmx est tm2 xtpr
bogomips	: 3326.51


--Boundary-00=_vuZEFqMsHf2/sZT
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--Boundary-00=_vuZEFqMsHf2/sZT--

