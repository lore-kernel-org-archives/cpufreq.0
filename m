From: Jan De Luyck <ml@kcore.org>
Subject: Re: 2.4.22-jl9: speedstep-centrino.o: init_module: No such device
Date: Wed, 27 Aug 2003 07:43:34 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200308270743.34643.ml@kcore.org>
References: <200308262206.37039.lkml@kcore.org>
	<20030826203637.GA18392@brodo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20030826203637.GA18392@brodo.de>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@brodo.de>
Cc: cpufreq@www.linux.org.uk

On Tuesday 26 August 2003 22:36, Dominik Brodowski wrote:
> On Tue, Aug 26, 2003 at 10:06:36PM +0200, Jan De Luyck wrote:
> > I just patched my 2.4.22 with this patch - so i can get centrino
> > speedstep support in 2.4 - but it won't load:
> >
> > # modprobe speedstep-centrino
> > /lib/modules/2.4.22-jl9/kernel/arch/i386/kernel/speedstep-centrino.o:
> > init_module: No such device
> >
> > Any ideas?
>
> Could you post your /proc/cpuinfo to the cpufreq mailing list at
> cpufreq@www.linux.org.uk, please?

Here it is:

devilkin@precious:~$ cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 9
model name      : Intel(R) Pentium(R) M processor 1600MHz
stepping        : 5
cpu MHz         : 1598.679
cache size      : 0 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr mce cx8 sep mtrr pge mca cmov pat clflush dts acpi mmx fxsr sse sse2 tm
bogomips        : 3191.60


Jan
