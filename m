From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: powernow-k7 for XP-M 2400+ CPU
Date: Sun, 30 May 2004 16:22:11 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040530142211.GB4933@poupinou.org>
References: <20040528191249.GA7957@seneca.muc.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040528191249.GA7957@seneca.muc.de>
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
To: Harald Milz <hm@seneca.muc.de>
Cc: cpufreq@www.linux.org.uk

On Fri, May 28, 2004 at 09:12:49PM +0200, Harald Milz wrote:
> Bruno Ducrot <ducrot@poupinou.org> wrote:
> > Also the flags from the bios indicate that there is a desktop voltage
> > regulator, and AFAIK it's not possible to change voltage from that.
> 
> That's okay with me. It would be better to be able to change voltages as
> well but as long as I can set the clock rate it's okay. :-)
> 
> > I suspect more that the BIOS is not able to says if an Athlon is mobile,
> > or not.  Actually there is very few differences (in detection code, I
> > mean) to sort a MP from a mobile one.
> 
> Yes, but if desktop boards were willing to detect mobiles they could. It's
> just a marketing issue - which I am not willing to accept :-))
> 
> just a marketing issue - which I am not willing to accept :-))
> 
> I gave dump_psb.c a try:
> 
> PSB version: 12 flags: 1 settling time 100us res1 0 num pst 1
>   PST 1  cpuid 761 fsb 100 mfid 2 svid c numberstates 8
>     0   500000kHz  FID 04 ( 5.0)  VID 0c (1400mV)
>     1   600000kHz  FID 06 ( 6.0)  VID 0c (1400mV)
>     2   700000kHz  FID 08 ( 7.0)  VID 0c (1400mV)
>     3   800000kHz  FID 0a ( 8.0)  VID 0c (1400mV)
>     4   900000kHz  FID 0c ( 9.0)  VID 0c (1400mV)
>     5  1000000kHz  FID 0e (10.0)  VID 0c (1400mV)
>     6  1100000kHz  FID 00 (11.0)  VID 0c (1400mV)
>     7  1200000kHz  FID 02 (12.0)  VID 0c (1400mV)
> 
> But this is exactly what I got by changing line 352 in powernow-k7.c:
> 
> /*
>                                 if ((etuple == pst->cpuid) && (maxfid==pst->maxf id) && (startvid==pst->startvid))
> */
>                                 if (1==1)
> 
> So - nothing to write home about. The BIOS knows only about cpuid 0x761 --
> does anybody know what it is? I suspect it's a TB mobile, right? See also

No.  Those values are indeed for a low powered processor.  Not a mobile.
Plus, those values are for a FSB at 100MHz whereas yours is at 133MHz.

> http://www.uwsg.iu.edu/hypermail/linux/kernel/0302.2/0063.html (interesting
> Dave thought about this exact patch as well last year).

That patch does exist btw.  But it never go to mainline, and I doubt it
will work now due to some recent changes in powernow-k7.

> Just found http://seclists.org/lists/linux-kernel/2004/May/1600.html
> (Google is my friend) - and Erik Meitner has the PST data on
> http://emeitner.f2o.org/nx9005/files/dmesg.txt  :-)) 

Yes, but those values are wrong unfortunately (well, SGTC at least is
not OK, it should be at least 13333 IMO).  If I were you, I will
keep the multiplier, but not the VIDs.  Something like that (a little
bit modified though):

                 FID            VID
                  04 ( 5.0)      0c 
                  06 ( 6.0)      0c 
                  08 ( 7.0)      0c 
                  0a ( 8.0)      0c 
                  0c ( 9.0)      0c 
                  0e (10.0)      0c 
                  00 (11.0)      0c 
                  02 (12.0)      0c 
                  15 (13.5)      0c 

I don't think it's possible to change VID as I said before.

And the table in order to convert VID to voltage may need to be
modified (but you know that already).  It's purely cosmetic, but..

> It's bad that my combo doesn't even grok the ACPI P states... but I suspect
> the ACPI BIOS doesn't know anything about mobile CPUs. 

Well, it's possible that a BIOS upgrade is necessary in order to get
that fixed, who knows.  But I do have some doubt though.  The only way
to detect if there is a mobile processor is to know if the VRM part is
able to change the voltage of the processor at run time.  IMHO, you
should also printk the SFID, MFID, SVID and MVID at boot time:

--- linux-26/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/05/30 14:10:41	1.2
+++ linux-26/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/05/30 14:14:24
@@ -557,6 +557,9 @@ static int __init powernow_cpu_init (str
 		return -EINVAL;
 	}
 	dprintk(KERN_INFO PFX "FSB: %3d.%03d MHz\n", fsb/1000, fsb%1000);
+	dprintk(KERN_INFO PFX "SVID: %.2x MVID: %.2x SFID: %.2x MFID: %.2x\n",
+			fidvidstatus.bits.SVID, fidvidstatus.bits.MVID,
+			fidvidstatus.bits.SFID, fidvidstatus.bits.MFID);
 
 	if ((dmi_broken & BROKEN_CPUFREQ) || acpi_force) {
 		printk (KERN_INFO PFX "PSB/PST known to be broken.  Trying ACPI instead\n");


If SVID (start VID) and MVID (max VID) are not the same, then I'm wrong,
and it's possible to change voltage.

> Anyway - I'll try making up a couple of FIDs and patch the module. If it
> works (or not) I'll post the patch.
> 

Good luck!

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
