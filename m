From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH][powernow-k7] correcting SGTC. Timer is based upon FSB.
Date: Wed, 14 Apr 2004 18:44:07 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040414174407.GL24970@redhat.com>
References: <20040414103646.GB8953@poupinou.org>
	<20040414104148.GC24970@redhat.com>
	<20040414121857.GC8953@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040414121857.GC8953@poupinou.org>
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
Content-Transfer-Encoding: 7bit
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

On Wed, Apr 14, 2004 at 02:18:57PM +0200, Bruno Ducrot wrote:

 > I actually wanted to submit also the ACPI integration...

I just tried this out on my Compaq Evo 1015.  It has working
PST, so just uses that.  I got curious though, and hardwired it
to fall back to the ACPI method. This is what it comes out with on
PST..

powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
powernow: FSB: 132.525 MHz
powernow: Found PSB header at 020f0800
powernow: Table version: 0x12
powernow: Flags: 0x0 (Mobile voltage regulator)
powernow: Settling Time: 100 microseconds.
powernow: Has 31 PST tables. (Only dumping ones relevant to this CPU).
powernow: PST:26 (@020f09c2)
powernow:  cpuid: 0x780 fsb: 133        maxFID: 0xf     startvid: 0x9
powernow:    FID: 0x12 (4.0x [530MHz])  VID: 0x13 (1.200V)
powernow:    FID: 0x4 (5.0x [662MHz])   VID: 0x13 (1.200V)
powernow:    FID: 0x6 (6.0x [795MHz])   VID: 0x13 (1.200V)
powernow:    FID: 0xa (8.0x [1060MHz])  VID: 0xd (1.350V)
powernow:    FID: 0xf (10.5x [1391MHz]) VID: 0x9 (1.550V)
powernow: SGTC: 13333
powernow: Minimum speed 530 MHz. Maximum speed 1391 MHz.

And with the hardwired acpi fallback..

powernow: Trying ACPI perflib
powernow: acpi:  P0: 1400 MHz, 35000 mW, 125 uS, control 009c412f, status 0000012f, vid: 09 fid: 0f SGTC: 10000
powernow:    FID: 0xf (10.5x [13913MHz])        VID: 0x9 (1.550V)
powernow: acpi:  P1: 1100 MHz, 15487 mW, 125 uS, control 009c41aa, status 000001aa, vid: 0d fid: 0a SGTC: 10000
powernow:    FID: 0xa (8.0x [10600MHz]) VID: 0xd (1.350V)
powernow: acpi:  P2: 800 MHz, 12310 mW, 125 uS, control 009c4266, status 00000266, vid: 13 fid: 06 SGTC: 10000
powernow:    FID: 0x6 (6.0x [7950MHz])  VID: 0x13 (1.200V)
powernow: acpi:  P3: 660 MHz, 12310 mW, 125 uS, control 009c4264, status 00000264, vid: 13 fid: 04 SGTC: 10000
powernow:    FID: 0x4 (5.0x [6625MHz])  VID: 0x13 (1.200V)
powernow: acpi:  P4: 530 MHz, 10258 mW, 125 uS, control 009c4272, status 00000272, vid: 13 fid: 12 SGTC: 10000
powernow:    FID: 0x12 (4.0x [5300MHz]) VID: 0x13 (1.200V)
powernow: Minimum speed 530 MHz. Maximum speed 13913 MHz.

Maximum speed seems off by a factor of 10.
Formatting of that debug info could also probably be cleaned up a little,
as its very wide.  How do you feel about adding a module_param to force
fallback, so we can get a few more people testing it too ?

		Dave
