From: Jiri Hladky <hladky.jiri@seznam.cz>
Subject: Re: Pentium III Coppermine
Date: Thu, 14 Oct 2004 16:22:05 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200410141622.05561.hladky.jiri@seznam.cz>
References: <33222.14179-2631-1010294146-1097668908@email.seznam.cz>
	<20041013193706.A57813F03@latitude.mynet.no-ip.org>
Reply-To: hladky.jiri@seznam.cz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20041013193706.A57813F03@latitude.mynet.no-ip.org>
Content-Disposition: inline
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
To: aeriksson@fastmail.fm
Cc: cpufreq@www.linux.org.uk

Hi Anders,

CPU stepping under windows is working just fine, so I know that my CPU 
supports it. 

Unfortunatelly, my speedstep-lib does not support relaxed_check option:-( So 
neither this workaround  is working:-(

Anyway, thank you very much for the hint!

Bye
Jiri

On Wednesday 13 October 2004 21:37, you wrote:
> I have an ancient PIII coppermine too which fails the normal
> speedstep detection. Try
>
> modprobe speedstep-lib relaxed_check=1
> modprobe speedstep-smi smi_port=0xb2 smi_cmd=0x82 smi_sig=1
>
> But BEWARE. The relaxed_check thing is said to be able to kill
> machines which are not speedstep capable!!!!!!!
>
> /Anders

> >  Hi everybody,
> > 
> > I have installed SUSE 9.1 on T22 IBM laptop. I was not able to get cpufreq 
to work.
> > 
> > I can load speedstep-smi module without any problems. The both commands
> > 
> > modprobe -v speedstep-smi
> > modprobe -v speedstep-smi smi_port=0xb2 smi_cmd=0x82 smi_sig=1
> > 
> > are working fine, no errors. However, directory
> > 
> > /sys/devices/system/cpu/cpu0/
> > 
> > is empty and /proc/cpufreq contains just:
> > 
> > minimum CPU frequency - maximum CPU frequency - policy
> > 
> > so I concluded that speedstep is not working.
> > 
> > I'm going to attach file /proc/cpuinfo. I will really appreciate any help 
to get speedstep working.
> > 
> > I have also used program "speedstep detect" but I don't know how can I use 
results of this program.
> > 
> > Please let me know if you need more information to debug it.
> > 
> > Thank you very much!
> > Jirka
> > 
> > Kernel: 2.6.5-7.108-default
> > 
> > modprobe -v speedstep-smi smi_port=0xb2 smi_cmd=0x82 smi_sig=1
> > 
insmod /lib/modules/2.6.5-7.108-default/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-smi.ko 
smi_port=0xb2 smi_cmd=0x82 smi_sig=1
> > 
> > =============/proc/cpuinfo=============
> > processor : 0
> > vendor_id : GenuineIntel
> > cpu family : 6
> > model : 8
> > model name : Pentium III (Coppermine)
> > stepping : 10
> > cpu MHz : 896.142
> > cache size : 256 KB
> > fdiv_bug : no
> > hlt_bug : no
> > f00f_bug : no
> > coma_bug : no
> > fpu : yes
> > fpu_exception : yes
> > cpuid level : 2
> > wp : yes
> > flags : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca cmov pat pse36 
mmx fxsr sse
> > bogomips : 1773.56
> > =============/proc/cpuinfo=============
> > 
> > ======== Speedstep detect==============
> > ./speedstep-detect
> > dmi_scan: return:
> > DMI 2.3 present.
> > 46 structures occupying 1585 bytes.
> > DMI table at 0x17FF0000.
> > BIOS Vendor: IBM
> > BIOS Version: 16ET20WW (1.00b)
> > BIOS Release: 03/07/2001
> > System Vendor: IBM
> > Product Name: 26478EG
> > Version: Not Available
> > Board Vendor: IBM
> > Board Name: 26478EG
> > Board Version: Not Available
> > Trying Intel's int15 GSIC:
> > BIOS support GSIC call:
> > signature: GSIC
> > command port = 0x00b2
> > command = 0x0082
> > event port = 0x00c000b3
> > flags = 0x07d00000
> > probing chipsets: Found PIIX4
> > pmbase at 0x1000
> > Dumping PM IO register for this southbridge:
> > PMCNTRL (0x1004): 0x1401
> > (0x1006): 0x0000
> > GPEN (0x100e): 0x0a00
> > PCNTRL (0x1010): 0x00003200
> > (0x1016): 0x0000
> > DEVSTS (0x101c): 0x00000000
> > GLBLEN (0x1020): 0x0400
> > (0x1022): 0x00000000
> > GLBCTL (0x1028): 0x03011f01
> > DEVCTL (0x102c): 0x02000000
> > GPIs: (0x1030): 0x070862
> > (0x1033): 0x00
> > GPOs: (0x1034): 0x7f7787fe
> > (0x1038): 0x62 0x08 0x07 0x00 0xfe 0x87 0x77 0x7f
> > 
> > 
> > You need to boot on AC and battery and see if GPOs change.
> > Then, see if one bit change in between, you have then to note the number
> > of this bit. This will be the gpo_hilo= number kernel option for
> > enabling the speedstep-piix4 module under Linux.
> > ..28..24..20..16..12...8...4...0
> > GPOs: (0x1034): 0x7f7787fe 01111111011101111000011111111110
> > ==========================================================================
