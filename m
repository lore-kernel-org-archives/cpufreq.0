From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: bad ACPI tables for Dothan?
Date: Tue, 27 Jul 2004 17:13:01 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1090973581.16558.13.camel@localhost>
References: <410557B4.6060303@gmx.de> <1090872497.8114.3.camel@localhost>
	<41061454.90306@gmx.de> <1090965071.16558.2.camel@localhost>
	<4106E08D.3000909@gmx.de> <1090970168.16558.7.camel@localhost>
	<4106EB87.4010603@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <4106EB87.4010603@gmx.de>
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
To: Frederik Reiss <frederikreiss@gmx.de>
Cc: cpufreq list <cpufreq@www.linux.org.uk>

On Wed, 2004-07-28 at 01:55 +0200, Frederik Reiss wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Jeremy Fitzhardinge schrieb:
> | Ah, OK, a bit more information.  Looks like there's a strange table in
> | your ACPI.  See what this shows.
> |
> | 	J
> Hi again, here are the requested informations:
> 
> Jul 28 01:45:17 localhost kernel: invalid encoded frequency: ffff (0kHz)
> != 25500000
> Jul 28 01:45:17 localhost kernel: speedstep-centrino: no table support
> for CPU model "Intel(R) Pentium(R) M processor 1.50GHz":
> Jul 28 01:45:17 localhost kernel: speedstep-centrino: try compiling with
> CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI enabled

OK, I'm out of my depth.  I really don't know anything about ACPI or
these tables, but they look corrupted.  It seems that you have an entry
for a 25GHz CPU...

I'm CC:ing the cpufreq list, since someone there might have better
suggestions.


cpufreq folks: Frederik has a Tosiba M30-851 laptop with this CPU:

vendor_id       : GenuineIntel
cpu family      : 6
model           : 13
model name      : Intel(R) Pentium(R) M processor 1.50GHz
stepping        : 6
cpu MHz         : 1496.370
flags           : fpu vme de pse tsc msr mce cx8 apic sep mtrr pge mca
cmov pat clflush dts acpi mmx fxsr sse sse2 ss tm pbe tm2 est
bogomips        : 2957.31

In theory the ACPI tables should work fine for this Dothan, but they
seem corrupt.  It seems that centrino_cpu_init_acpi() is getting a
0xffff control register value, and a corresponding 25GHz CPU core speed.
I'm assuming there's someone who knows what this means.

	J
