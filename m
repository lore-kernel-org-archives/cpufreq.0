From: =?iso-8859-1?q?mark=20newman?= <emergant2000@yahoo.co.uk>
Subject: Re: help using Harold Milz patch for PSB overide
Date: Thu, 26 Aug 2004 15:11:56 +0100 (BST)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040826141156.80542.qmail@web86910.mail.ukl.yahoo.com>
References: <20040824072533.4B4F350172@nathan.muc.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040824072533.4B4F350172@nathan.muc.de>
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


Thanks to everyones help, I've gotten a little
further.

To update

I've gone back to a 2.6.5 kernel using a prepatched
powernow-k7.c kindly supplied by Harid.

I've checked my kernel config and it includes the
followinfg
#
CONFIG_X86_ACPI_CPUFREQ=m
# CONFIG_X86_ACPI_CPUFREQ_PROC_INTF is not set
CONFIG_X86_POWERNOW_K6=m
CONFIG_X86_POWERNOW_K7=m
CONFIG_X86_POWERNOW_K8=m
CONFIG_X86_GX_SUSPMOD=m
CONFIG_X86_SPEEDSTEP_CENTRINO=m
CONFIG_X86_SPEEDSTEP_ICH=m
CONFIG_X86_SPEEDSTEP_SMI=m
CONFIG_X86_P4_CLOCKMOD=m
CONFIG_X86_SPEEDSTEP_LIB=m
CONFIG_X86_LONGRUN=m
CONFIG_X86_LONGHAUL=m

I have added this line to modules.conf and created
modprobe.conf.local with the same entry.  I run depmod
-a.  Also tried from cold boot

options powernow-k7 mycpuid=0x7a0 myfsbspeed=133
mymaxfid=0x16 mystartvid=0xb mynumpstates=2
myfids=0x16,0x0d

I have updated 0x15 to 0x16 as my xpm2500 supports a
14x multiplier

When I modrobe powernow-k7 it loads cleanly and also
loads freq_table

I can load the performance govenor cleanly

dmesg shows that frequency and voltage can be scaled,
but x86info says fid's wont change

I have selected the userspace govenor as default but
get no cpufreq directory under
/sys/devices/system/cpu/cpu0

cpudynd shows scaling as being disabled

My multiplier is still set at the default 6x according
to x86info

Does anyone have any suggestions.  I'm going to read
up on the gentoo module loading structure and make
sure I've set up the options correctly.  I'm still
unsure where I can get my cpuid from.  I have enabled
the cpuid module but don't know where it sends the
results.

Thanks

Mark

?


 --- Harald Milz <milz@seneca.muc.de> wrote: 
> mark newman <emergant2000@yahoo.co.uk> wrote:
> > using insmod.  I am however wonderring if all the
> > relevant dependencies were loaded.  I'll check on
> > this.
> 
> I added this line to my modprobe.conf.local, and
> simply modprobe
> everything: 
> 
> options powernow-k7 mycpuid=0x7a0 myfsbspeed=133
> mymaxfid=0x15 mystartvid=0xb mynumpstates=2
> myfids=0x15,0x0d
> 
> Don't forget to run "depmod -a" after modifying
> modprobe.conf.*. 
> 
> -- 
> Diplomacy is the art of saying "nice doggy" until
> you can find a rock.
> 
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq
>  


	
	
		
___________________________________________________________ALL-NEW Yahoo! Messenger - all new features - even more fun!  http://uk.messenger.yahoo.com
