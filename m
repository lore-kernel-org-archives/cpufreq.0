From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Coppermine, cpufreq
Date: Fri, 31 Oct 2003 08:14:57 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031031071457.GL28351@poupinou.org>
References: <3FA11700.8080908@tcpa-info.org>
	<20031030140910.GH28351@poupinou.org>
	<3FA17DDF.5000600@tcpa-info.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3FA17DDF.5000600@tcpa-info.org>
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
To: Matthias Hannich <dumb@tcpa-info.org>
Cc: cpufreq@www.linux.org.uk

On Thu, Oct 30, 2003 at 10:08:47PM +0100, Matthias Hannich wrote:
> Am 10/30/2003 03:09 PM schrieb Ducrot Bruno:
> >What about a
> >modprobe speedstep-ich
> >instead of insmod?
> 
> root:/# modprobe speedstep-ich
> /lib/modules/2.4.22-ac4-486/kernel/arch/i386/kernel/speedstep-ich.o: 
> init_module: No such device
> Hint: insmod errors can be caused by incorrect module parameters, 
> including invalid IO or IRQ parameters.
>       You may find more information in syslog or the output from dmesg 
> (can't find anything there)
> 
> /lib/modules/2.4.22-ac4-486/kernel/arch/i386/kernel/speedstep-ich.o: 
> insmod 
> /lib/modules/2.4.22-ac4-486/kernel/arch/i386/kernel/speedstep-ich.o failed
> /lib/modules/2.4.22-ac4-486/kernel/arch/i386/kernel/speedstep-ich.o: 
> insmod speedstep-ich failed
> 
> >PS: If modprobe speedstep-ich still  do not work
> >modpbore speedstep-lib
> 
> No error messages.
> 
> >modprobe speedstep-ich
> 

Are you sure you have an ich based system?
If 'lspci -v' show
00:00.0 Host bridge: Intel Corp. 440BX/ZX/DX - 82443BX/ZX/DX Host bridge (rev 03)
...
00:07.0 ISA bridge: Intel Corp. 82371AB/EB/MB PIIX4 ISA (rev 02)

then speedstep-ich will not work.

at first, take a look at:
http://www.poupinou.org/cpufreq/

To resume:
there is 2 drivers, speedstep-piix4 and speedstep-smi.

The two are in CVS, but not in ac tree.

The speedstep-piix4 is 'old', and may be unstable for some people,
or even do not work at all.  This one is no more recommended, and
may be removed very soon now in CVS.

The speedstep-smi is the newer one.  It should be a *lot* more stable.

If you want to know if speedstep-smi does work, get first speedstep-detect
at ftp://ftp.poupinou.org/cpufreq/speedstep-detect.tar.gz

then
tar xzvfp speedstep-detect.tar.gz; cd speedstep-detect-0.01
make 
sudo ./speedstep-detect

...
BIOS DO NOT support GSIC call.  Dumping registers anyway:
eax = 0x00008680
ebx = 0x00000000
ecx = 0x00000000
edx = 0x47534943
...

In that case, (and it is normal, it was run actually under
a desktop..), speedstep-smi will not work.

But if you see something like:

...
BIOS support GSIC call:
	signature: GSIC
	command port = 0x00b2
	command =      0x0080
...

then there is good chance that speedstep-smi will work.

Note also that the others input was only meaningfull
for the (old) speedstep-piix4 actually, and 
there is no more need to reports things to me, and no
more need to boot on AC, then on battery even if
speedstep-detect will tell you to do so...

It was writen before the speedstep-smi driver.

Some notes:
 * a port to ac tree for the speedstep-smi is here:
	ftp://ftp.poupinou.org/cpufreq/speedstep-smi-24-22rc2ac3.diff

	It should apply OK in 2.4.22-ac4.

 * 'modprobe speedstep-smi' do not work, try:
	 modprobe speedstep-smi smi_cmd=0x82

Cheers,

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
