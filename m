From: Hendrik Muhs <Hendrik.Muhs@web.de>
Subject: Re: [PATCH] Another powernow-k7 patch for Desktop XP-M usage
Date: Wed, 1 Dec 2004 21:09:08 +0100
Message-ID: <200412012109.08692.Hendrik.Muhs@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Hi,


> 
> Still can't set multiplier 11. I'm able to run CPU on 10.5x200, but not 
> at 11x200. If I use
> 
> powernow-k7 overwrite_table=1 multiplier=50,60,70,80,90,110
> 
> or
> 
> powernow-k7 overwrite_table=1 multiplier=50,60,70,80,90,11
> 
> maximum frequency becomes 1800MHz (9x200) and it's second to last 
> multiplier...

Strange, works for me:

modprobe powernow-k7 overwrite_table=1 multiplier=50,60,70,80,90,110

dmesg:

powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
powernow: FSB: 100.074 MHz
powernow: Overwriting PST table with manual settings
powernow: Settling Time: 200 microseconds.
powernow:    FID: 0x4 (5.0x [500MHz])   VID: 0xb (1.450V)
powernow:    FID: 0x6 (6.0x [600MHz])   VID: 0xb (1.450V)
powernow:    FID: 0x8 (7.0x [700MHz])   VID: 0xb (1.450V)
powernow:    FID: 0xa (8.0x [800MHz])   VID: 0xb (1.450V)
powernow:    FID: 0xc (9.0x [900MHz])   VID: 0xb (1.450V)
powernow:    FID: 0x0 (11.0x [1100MHz]) VID: 0xb (1.450V)
powernow: Minimum speed 500 MHz. Maximum speed 1100 MHz.

cat /proc/cpuinfo:

processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 6
model           : 10
model name      : mobile AMD Athlon(tm) MP-M 1700+
stepping        : 0
cpu MHz         : 1100.815
cache size      : 512 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 mmx fxsr sse syscall mp mmxext 3dnowext 3dnow
bogomips        : 2176.03


Could you please post your dmesg output and the output from 
'cat /proc/cpuinfo' after modprobe 'ing the module?

Hendrik
 
> 
> 
> 
> 
> Nebojsa Trpkovic wrote:
> 
> > Hendrik Muhs wrote:
> >
> >> You found a bug! There is an error in the translation table:
> >>
> >> +/* translation table for odd multiplier to fid*/
> >> +static int odd_multiplier[9]={
> >> +    5, 7, 9, 11, 12, 13, 1, 3,        +   
> >> 21,                                      +};
> >>
> >> should be (13 instead of 12, 15 instead of 13):
> >>
> >> +/* translation table for odd multiplier to fid*/
> >> +static int odd_multiplier[9]={
> >> +    5, 7, 9, 11, 13, 15, 1, 3,       +   
> >> 21,                                      +};
> >>
> >> A new corrected patch is attached to this mail
> >>
> >> Hendrik
> >>  
> >>
> >>
> > That works!
> >
> > Finaly I have my Barton 2500+ fully modded :D
> >
> > First, I've set it's FSB from 166MHz to 200MHz (L12 mod)
> > and then it became Mobile (L5 mod)
> >
> > Now it runs at 1GHz and switchs to 2.1GHz if needed instead of boring 
> > 1833MHz :D
> >
> >
> > Great work!
> > Thank you all!
> >
