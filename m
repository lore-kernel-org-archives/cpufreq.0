From: aeriksson2@fastmail.fm
Subject: Re: Pentium III (Coppermine) cpufreq support
Date: Thu, 29 Jan 2004 09:50:36 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20040129085037.77B733FFB@latitude.mynet.no-ip.org>
References: <linux@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: Message from Dominik Brodowski <linux@dominikbrodowski.de> 
	of "Thu, 29 Jan 2004 10:26:04 +0100."
	<20040129092604.GB5591@dominikbrodowski.de> 
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
To: visyz@visyz.net, cpufreq@www.linux.org.uk


Hi all,

Another PIII(Speedstep)/440BZ owner chiming in...

I've been successful in getting the -smi driver to work (I believe).
However, I need to apply this patch:

--- ../../cf-2.6/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-lib.c 2003-08-19 15:38:33.000000000 +0200
+++ arch/i386/kernel/cpu/cpufreq/speedstep-lib.c        2003-11-10 21:41:12.325084272 +0100
@@ -200,7 +200,7 @@
                 */
                rdmsr(MSR_IA32_PLATFORM_ID, msr_lo, msr_hi);
                dprintk(KERN_DEBUG "cpufreq: Coppermine: MSR_IA32_PLATFORM ID is 0x%x, 0x%x\n", msr_lo, msr_hi);
-               if ((msr_hi & (1<<18)) && (msr_hi & (3<<24))) {
+               if ((msr_hi & (1<<18)) ) {
                        if (c->x86_mask == 0x01)
                                return SPEEDSTEP_PROCESSOR_PIII_C_EARLY;
                        else

Now reading the comment just before these lines, it's
apparent that this is not the way things are supposed to work.
I've asked for this patch to be considered by the maintainers
and the decision was not to apply it. I'd be interested in
other approaches to getting past these lines in the cpu 
detection code which works can be committed. 

You may want to check this path yourself. But I wouldn't be 
surprised if doing the Wrong Thing here could fry your box.

Question:
Is there any chance that tricking the code into accepting 
the cpu as speedstep-capable, would made the code appear to
work when observing the behavior from outside but actually
do no good to the metal? I don't have the hardware here to 
check if the box actually does consume less power when in
low performance mode.

/Anders


Dominik Brodowski <linux@dominikbrodowski.de> said:
> In contrast to your opinion Linux cpufreq support for Mobile Pentium III=20
> Coppermines on 440BX/ZX/DX has received an enormeous amount of work,
> especially from Bruno Ducrot and Hiroshi Miura. Also, one of the previous
> cpufreq maintainers (me) owns a notebook which contains a Mobile Pentium III
> Coppermine and a 440BX AGPset chipset...
> 
> > Heh. Yeah. anyways. I have an HP Omnibook 4150B, which amounts to the
> > aforementioned coppermine (with speeds from 233-450mhz)
> 
> There is no SpeedStep-capable mobile Pentium III with a core frequency of 4=
> 50 MHz.
> The "lowest" SpeedStep-capable is a 500MHz variant. See Intel Document
> 245306, revision 43, page 14.
> 
> However, it _might_ be that I miss something and this CPU is indeed
> speedstep capable.
> 
> >, on a
> > 440BX/ZX/DX bridge. I tried out the test program to see if it's usable,
> > and while 1 bit did change, it was in GOP 0x0034, not 0x0038. Or maybe
> > that's the other way around. Basically, the one that was supposed to
> > change didn't, and the one that wasn't, did.
> 
> There is no one which is _supposed_ to change. It's just that GPO #0 is the
> most _common_ to change. However, you really should try the speedstep-smi
> module first.
> 
> > Are those in charge of the cpufreq development interested in getting the
> > dump still, or have you moved on to bigger and better (tm) processors?
> 
> Even though I now own a wonderful centrino notebook, me and many others=20
> still work on the various "earlier" speedstep drivers. So be a bit more=20
> careful what you say, please.
> 
> 	Dominik
