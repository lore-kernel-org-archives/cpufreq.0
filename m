From: Stefan Seyfried <seife@gmane0305.slipkontur.de>
Subject: Re: 2.6.11 cpufreq: Device or resource busy
Date: Fri, 11 Mar 2005 18:59:49 +0100
Message-ID: <20050311175949.GC21611@message-id.gmane0305.slipkontur.de>
References: <20050308222516.GA20370@carfax.org.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050308222516.GA20370@carfax.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk

On Tue, Mar 08, 2005 at 10:25:16PM +0000, Hugo Mills wrote:
>    I've just upgraded my laptop (ASUS M3000 -- see below) from 2.6.10
> to 2.6.11. It now seems to be unable to load the acpi_cpufreq module:
> 
> hrm@joshua:hrm $ sudo modprobe acpi-cpufreq
> FATAL: Error inserting acpi_cpufreq (/lib/modules/2.6.11-plain/kernel/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.ko): Device or resource busy

> CONFIG_X86_ACPI_CPUFREQ=m
> # CONFIG_X86_POWERNOW_K6 is not set
> # CONFIG_X86_POWERNOW_K7 is not set
> # CONFIG_X86_POWERNOW_K8 is not set
> # CONFIG_X86_GX_SUSPMOD is not set
> CONFIG_X86_SPEEDSTEP_CENTRINO=y
> CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=y
> CONFIG_X86_SPEEDSTEP_ICH=y
> # CONFIG_X86_SPEEDSTEP_SMI is not set
> CONFIG_X86_P4_CLOCKMOD=y

> # CONFIG_X86_ACPI_CPUFREQ_PROC_INTF is not set
> CONFIG_X86_SPEEDSTEP_LIB=y
> CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK=y

I wonder why you have some of them built in, others as modules and why does
the stupid P4_CLOCKMOD driver have to be compiled in? I think this one is
to blame.
-- 
Stefan Seyfried
