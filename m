From: Harald Milz <milz@seneca.muc.de>
Subject: Re: help using Harold Milz patch for PSB overide
Date: Mon, 23 Aug 2004 21:11:48 +0200 (CEST)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040823191148.4DE434BE9F@nathan.muc.de>
References: <20040821154720.736.qmail@web86901.mail.ukl.yahoo.com>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

mark newman <emergant2000@yahoo.co.uk> wrote:

> Its possible I have misapplied the patch.  If anyone
> could send me their patched powernow-k7.c off list
> that would be a help

Huh - what kernel did you apply it against? Mine is a 2.6.5-104 from SUSE
9.1. I can send you a patched powernow-k7.c but I assume it's not about
this file. Are you sure everything is set correctly in .config? Here it's 

CONFIG_X86_ACPI_CPUFREQ=m
# CONFIG_X86_ACPI_CPUFREQ_PROC_INTF is not set
CONFIG_X86_POWERNOW_K6=m
CONFIG_X86_POWERNOW_K7=m
CONFIG_X86_POWERNOW_K8=m
CONFIG_X86_POWERNOW_K8_ACPI=y
CONFIG_X86_GX_SUSPMOD=m
CONFIG_X86_SPEEDSTEP_CENTRINO=m
CONFIG_X86_SPEEDSTEP_ICH=m
CONFIG_X86_SPEEDSTEP_SMI=m
CONFIG_X86_P4_CLOCKMOD=m
CONFIG_X86_SPEEDSTEP_LIB=m
CONFIG_X86_LONGRUN=m
CONFIG_X86_LONGHAUL=m

> as I monitor temps I should be fairly safe.  I doubt
> my board will allow changes in voltage anyway.

Yup - the SoftVID pins are hardly ever connected on desktop boards -
although I've read about some mods in various fora. Which is nonsense,
marketing-wise. Connecting the pins costs about 0.00002$. 

-- 
Vila: "I think I have just made the biggest mistake of my life."
Orac: "It is unlikely.  I would predict there are far greater mistakes
      waiting to be made by someone with your obvious talent for it."
