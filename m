From: =?iso-8859-1?q?mark=20newman?= <emergant2000@yahoo.co.uk>
Subject: Re: help using Harold Milz patch for PSB overide
Date: Mon, 23 Aug 2004 23:18:41 +0100 (BST)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040823221841.17193.qmail@web86906.mail.ukl.yahoo.com>
References: <20040823191148.4DE434BE9F@nathan.muc.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040823191148.4DE434BE9F@nathan.muc.de>
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

 --- Harald Milz <milz@seneca.muc.de> wr ote: 
> mark newman <emergant2000@yahoo.co.uk> wrote:
> 
> > Its possible I have misapplied the patch.  If
> anyone
> > could send me their patched powernow-k7.c off list
> > that would be a help
> 
> Huh - what kernel did you apply it against? Mine is
> a 2.6.5-104 from SUSE
> 9.1. 

Well I started with a gentoo 2.67 kern el, the 2nd 2
chunks faied. I Then copied the cpufreq dir from a
vanilla 2.68 to my existing 2.67 tree with the same
problem.  Thats when I tried to apply it manually.
Perhaps Ishould try 2.65.

>I can send you a patched powernow-k7.c but I
> assume it's not about
> this file.

Well since I'd had problems applying the patch, I'd
been working on the assumption that I'd bungled it
somehow.  I'd appreciate that patched file, it may
help in a process of elimination.  

> Are you sure everything is set correctly
> in .config? Here it's 
> 
> CONFIG_X86_ACPI_CPUFREQ=m
> # CONFIG_X86_ACPI_CPUFREQ_PROC_INTF is not set
> CONFIG_X86_POWERNOW_K6=m
> CONFIG_X86_POWERNOW_K7=m
> CONFIG_X86_POWERNOW_K8=m
> CONFIG_X86_POWERNOW_K8_ACPI=y
> CONFIG_X86_GX_SUSPMOD=m
> CONFIG_X86_SPEEDSTEP_CENTRINO=m
> CONFIG_X86_SPEEDSTEP_ICH=m
> CONFIG_X86_SPEEDSTEP_SMI=m
> CONFIG_X86_P4_CLOCKMOD=m
> CONFIG_X86_SPEEDSTEP_LIB=m
> CONFIG_X86_LONGRUN=m
> CONFIG_X86_LONGHAUL=m

Its a ittle late tonight, but I'll check this on
thursday at the latest as I have the day off work. 
I'll report back :)
> 
> > as I monitor temps I should be fairly safe.  I
> doubt
> > my board will allow changes in voltage anyway.
> 
> Yup - the SoftVID pins are hardly ever connected on
> desktop boards -
> although I've read about some mods in various fora.
> Which is nonsense,
> marketing-wise. Connecting the pins costs about
> 0.00002$. 

Thanks for responding

Mark


	
	
		
___________________________________________________________ALL-NEW Yahoo! Messenger - all new features - even more fun!  http://uk.messenger.yahoo.com
