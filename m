From: Simon <simon@highlyillogical.org>
Subject: newbie: Patch Confusion, P4 not supported?
Date: Wed, 18 Jun 2003 12:45:07 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200306181245.07941.simon@highlyillogical.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.arm.linux.org.uk

Hi,

Sorry about the dumb newbie question. Can't find any docs on this.

I just upgraded to a vanilla 2.4.21 kernel, and want to add cpufreq support 
back for my Intel P4, in my Thinkpad A31p.

I had this working with 2.4.20, using the 'advanced' patch from 
http://www.brodo.de/cpufreq/, and controlling it by echo-ing stuff to 
/proc/cpufreq

I couldn't make any of the patches on www.brodo.de/cpufreq_old apply to my 
kernel cleanly. They look rather old, and the page is no longer in use. So I 
donloaded the latest patch from ftp://ftp.linux.org.uk/pub/linux/cpufreq/ 
(ftp://ftp.linux.org.uk/pub/linux/cpufreq/cpufreq-LINUX_2_4-20030617.tar.bz2) 
and applied this.

Now, it says that my cpu is unsupported. As follows:

shiro proc # dmesg | grep cpufreq
cpufreq: Intel(R) SpeedStep(TM) support $Revision: 1.7.2.6 $
cpufreq: Intel(R) SpeedStep(TM) for this processor not (yet) available.

/proc/cpufreq no longer exists.

Seems strange. It *used* to work with the old patch, but somehow has decided 
not to work with the new one. Am I missing some kernel parameter or 
something? Or has support been taken out? Or am I using the wrong patch?

Thanks
Simon

output of /proc/cpuinfo follows:

shiro linux # cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 2
model name      : Mobile Intel(R) Pentium(R) 4 - M CPU 2.00GHz
stepping        : 7
cpu MHz         : 1199.045
cache size      : 512 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca cmov pat 
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm
bogomips        : 2385.51
