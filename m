From: Kronos <kronos@kronoz.cjb.net>
Subject: [PATCH] Fix cpu recognization if BIOS does not set cpu to max freq
	[was: Re: [Bug 3600] New: Cpu recognization fails after
	upgrade from 2.6.7 to 2.6.9]
Date: Sat, 23 Oct 2004 23:43:25 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041023214325.GA13050@dreamland.darkstar.lan>
References: <200410201413.i9KED718023481@fire-1.osdl.org>
	<20041020154744.GA5372@dreamland.darkstar.lan>
	<20041020180537.17d0dd7c@paraclito.crema>
	<20041020165110.GA6992@dreamland.darkstar.lan>
	<20041021102529.GD22405@poupinou.org>
Reply-To: kronos@kronoz.cjb.net
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041021102529.GD22405@poupinou.org>
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
Cc: Dave Jones <davej@redhat.com>, cpufreq@www.linux.org.uk

Il Thu, Oct 21, 2004 at 12:25:29PM +0200, Bruno Ducrot ha scritto: 
> On Wed, Oct 20, 2004 at 06:51:10PM +0200, Kronos wrote:
> > Il Wed, Oct 20, 2004 at 06:05:37PM +0200, Daniele Bonomi ha scritto: 
> > > On Wed, 20 Oct 2004 17:47:44 +0200 Kronos <kronos@kronoz.cjb.net> wrote:
> > > 
> > > > Hi,
> > > > I saw something similar on my notebook. In my case when the notebook
> > > > is turned on while using battery BIOS sets CPU speed to a frequency
> > > > lower than the defaul (800MHz for me). It seems that powernow driver
> > > > is confused by the BIOS fiddling with CPU speed and fails to load. I
> > > > had the same symptoms: PST not found and wrong min/max frequencies.
> > > > 
> > > > Disabling "Automatic CPU power saving" (or something like that) in the
> > > > BIOS cures the problem for me. Note that this option do not affect
> > > > power management under linux (or windows), it just controls the CPU
> > > > before a real OS comes up.
> > > 
> > > I tried but it didn't worked for me.
> > > For me doesn't work even if i'm plugged in...
> > 
> > Ok, can you apply this patch to 2.6.9 (and enable debug):
> > 
> > --- a/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004-10-20 18:46:51.000000000 +0200
> > +++ b/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004-10-20 18:47:06.000000000 +0200
> > @@ -597,7 +597,7 @@
> >  	rdmsrl (MSR_K7_FID_VID_STATUS, fidvidstatus.val);
> >  
> >  	/* A K7 with powernow technology is set to max frequency by BIOS */
> > -	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.MFID];
> > +	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.CFID];
> >  	if (!fsb) {
> >  		printk(KERN_WARNING PFX "can not determine bus frequency\n");
> >  		return -EINVAL;
> > 
> > 
> 
> No.  It's wrong.  Though I *much* prefer the form you submit, this will
> break other unfortunately, and therefore maxfid have to be used
> here for now as per AMD documentation (problem is, your bios is broken
> because it do not respect AMD recomandation since after POST the
> processor shall be put in max frequencies instead of 800MHz).  In short,
> there is a need to choose who would be broken here for now, and
> I have to do the one recommanded by AMD.

What about the following patch. Tested here and works as expected:

powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
powernow: CPU wasn't set to maximum frequency. Using workaround.
powernow: FSB: 133.917 MHz
powernow: Found PSB header at c00f0320
powernow: Table version: 0x12
powernow: Flags: 0x0 (Mobile voltage regulator)
powernow: Settling Time: 100 microseconds.
powernow: Has 1 PST tables. (Only dumping ones relevant to this CPU).
powernow: PST:0 (@c00f0330)
powernow:  cpuid: 0x7a0  fsb: 133  maxFID: 0x16  startvid: 0xb
powernow:    FID: 0x12 (4.0x [535MHz])  VID: 0x13 (1.200V)
powernow:    FID: 0x6 (6.0x [803MHz])  VID: 0x13 (1.200V)
powernow:    FID: 0xa (8.0x [1071MHz])  VID: 0x13 (1.200V)
powernow:    FID: 0xe (10.0x [1339MHz])  VID: 0xe (1.300V)
powernow:    FID: 0x2 (12.0x [1607MHz])  VID: 0xc (1.400V)
powernow:    FID: 0x16 (14.0x [1874MHz])  VID: 0xb (1.450V)
powernow: SGTC: 13333
powernow: Minimum speed 535 MHz. Maximum speed 1874 MHz.

without the workaround:

powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
powernow: FSB:  57.393 MHz
powernow: Found PSB header at c00f0320
powernow: Table version: 0x12
powernow: Flags: 0x0 (Mobile voltage regulator)
powernow: Settling Time: 100 microseconds.
powernow: Has 1 PST tables. (Only dumping ones relevant to this CPU).
powernow: No PST tables match this cpuid (0x7a0)
powernow: This is indicative of a broken BIOS.
powernow: Trying ACPI perflib
powernow: acpi:  P0: 1862 MHz 21000 mW 125 uS control 009c4176 SGTC 10000
powernow:    FID: 0x16 (14.0x [803MHz])  VID: 0xb (1.450V)
powernow: acpi:  P1: 1600 MHz 15000 mW 125 uS control 009c4182 SGTC 10000
powernow:    FID: 0x2 (12.0x [688MHz])  VID: 0xc (1.400V)
powernow: acpi:  P2: 1333 MHz 15000 mW 125 uS control 009c41ce SGTC 10000
powernow:    FID: 0xe (10.0x [573MHz])  VID: 0xe (1.300V)
powernow: acpi:  P3: 1064 MHz 15000 mW 125 uS control 009c426a SGTC 10000
powernow:    FID: 0xa (8.0x [459MHz])  VID: 0x13 (1.200V)
powernow: acpi:  P4: 798 MHz 15000 mW 125 uS control 009c4266 SGTC 10000
powernow:    FID: 0x6 (6.0x [344MHz])  VID: 0x13 (1.200V)
powernow: acpi:  P5: 532 MHz 15000 mW 125 uS control 009c4272 SGTC 10000
powernow:    FID: 0x12 (4.0x [229MHz])  VID: 0x13 (1.200V)
powernow: Minimum speed 229 MHz. Maximum speed 803 MHz.

---

On some notebooks BIOS fails to set K7 CPUs to the maximum frequency.
powernow-k7 fails to load or falls back to ACPI (if available) with
wrong values. If a bogus FSB speed is detected a workaround should be
used.

Signed-off-by: Luca Tettamanti <kronos@kronoz.cjb.net>

--- a/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004-10-23 22:29:40.000000000 +0200
+++ b/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004-10-23 22:39:23.000000000 +0200
@@ -598,6 +598,13 @@
 
 	/* A K7 with powernow technology is set to max frequency by BIOS */
 	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.MFID];
+	if (fsb < 99000) {
+		/* BIOS did not set the processor to the max frequency.
+		 * This does not respect AMD recomandation, but it happens.
+		 */
+		printk(KERN_INFO PFX "CPU wasn't set to maximum frequency. Using workaround.\n");
+		fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.CFID];
+	}
 	if (!fsb) {
 		printk(KERN_WARNING PFX "can not determine bus frequency\n");
 		return -EINVAL;


Luca
-- 
Home: http://kronoz.cjb.net
Software is like sex; it's better when it's free.
Linus Torvalds
