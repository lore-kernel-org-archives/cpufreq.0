From: "Zhu, Yi" <yi.zhu@intel.com>
Subject: how to get Pentium 4 multiplier
Date: Thu, 10 Jun 2004 13:55:13 +0800
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3ACA40606221794F80A5670F0AF15F8403BD5535@pdsmsx403>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>, Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@www.linux.org.uk


Hi,

I found pentium4_get_frequency() uses 24:31 of 0x2c
(MSR_EBC_FREQUENCY_ID)
to get Pentium 4 FSB multiplier. There is problem because it is not said
in the
IA-32 Intel (C) Architecture Software Developer's Manual, Volume 3:
System=20
Prgramming Guide (latest Order Number 253668). So it got the wrong
number.

$ cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 1
model name      : Intel(R) Pentium(R) 4 CPU 2.00GHz
stepping        : 2
cpu MHz         : 498.627
cache size      : 256 KB

$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
16200000

I compiled my 2.6.7-rc3 kernel with SPEEDSTEP_DEBUG and dmesg
gives:

speedstep-lib: P4 - MSR_EBC_FREQUENCY_ID: 0xa201f000 0x0
speedstep-lib: P4 - FSB 100000 kHz; Multiplier 162

You can find more detailed information here:
http://bugme.osdl.org/show_bug.cgi?id=3D2754


How to resolve?

My proposal is get the frequency by using the brand string
(x86_model_id)
for P4 processors. All P4 has the brand string. Because the MSR way
works
for P6 and PentiumM, but not for P4.

Any comments?

Thanks,
-----------------------------------------------------------------
Opinions expressed are those of the author and do not represent Intel
Corp.

- Zhu Yi (Chuyee)

GnuPG v1.0.6 (GNU/Linux)
http://cn.geocities.com/chewie_chuyee/gpg.txt or
$ gpg --keyserver wwwkeys.pgp.net --recv-keys 71C34820
1024D/71C34820 C939 2B0B FBCE 1D51 109A  55E5 8650 DB90 71C3 4820=20
