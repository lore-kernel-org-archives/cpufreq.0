From: Harald Milz <milz@seneca.muc.de>
Subject: Re: powernow-k7 for XP-M 2400+ CPU
Date: Fri, 28 May 2004 08:15:24 +0200 (CEST)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040528061524.7A75649C4D@nathan.muc.de>
References: <20040525225007.2DCE949C52@nathan.muc.de>
	<20040526102057.GK4933@poupinou.org>
	<20040526171938.1920049C55@nathan.muc.de>
	<20040526185434.GP4933@poupinou.org>
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Bruno Ducrot <ducrot@poupinou.org> wrote:
> Yes, I can probably help you somehow.  But send the dmesg at
> first.  You only waste my time if you don't post that damn log.

My CPU says,

powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
powernow: Found PSB header at c00f0810
powernow: Table version: 0x12
powernow: Flags: 0x1 (Desktop voltage regulator)
powernow: Settling Time: 100 microseconds.
powernow: Has 1 PST tables. (Only dumping ones relevant to this CPU).
powernow: No PST tables match this cpuid (0x7a0)
powernow: This is indicative of a broken BIOS.
powernow: See http://www.codemonkey.org.uk/projects/cpufreq/powernow-k7.s=
html

and the CPU is seen by the BIOS as

processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 6
model           : 10
model name      : AMD Athlon(TM) MP
stepping        : 0
cpu MHz         : 1800.924
cache size      : 512 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca cmo=
v pat pse36 mmx fxsr sse syscall mp mmxext 3dnowext 3dnow
bogomips        : 3563.52

But it is a 2400+ XP-M with a Barton core. I suspect the BIOS says Athlon
MP because the MP's and the XP-M's L5.3 bridges are open which confuses t=
he
BIOS. The CPU runs at 133x13,5, i.e. within its specs. I do not intend to
overclock it although the mobiles are said to be well overclockable.=20

The only thing I need is the powernow-dmesg output of a similar CPU on
whatever machine, and then I will patch the powernow-k7 module to have it
fake a similar PST. Simple enough as it seems.=20

TIA!!!=20


--=20
"In short, _=08N is Richardian if, and only if, _=08N is not Richardian."
