From: =?ISO-8859-1?Q?Vincent_Stehl=E9?= <vincent.stehle@free.fr>
Subject: longhaul: Unknown VIA CPU
Date: Wed, 03 Sep 2003 00:23:59 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <3F55187F.70707@free.fr>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: cpufreq@www.linux.org.uk


Hi,

I tried to get the longhaul module to work on my VIA EPIA M10000=20
motherboard (C3-2 cpu), but I did not succeed yet.

I use cpufreq 2.4.21-2, and I see the following message in the syslog=20
when I "modprobe longhaul":

     longhaul: Unknown VIA CPU. Contact davej@suse.de

I'd be pleased to help with what seems to be a "new" cpu, but I do not=20
know what to begin with.

Here is my /proc/cpuinfo; don't know if this is of any use to anyone (:

---
processor       : 0
vendor_id       : CentaurHauls
cpu family      : 6
model           : 9
model name      : VIA Nehemiah
stepping        : 1
cpu MHz         : 999.531
cache size      : 64 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu de tsc msr mtrr pge cmov mmx fxsr sse
bogomips        : 1992.29
---

Regards,

--=20
Vincent Stehl=E9
