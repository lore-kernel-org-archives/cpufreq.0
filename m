From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: Re: [1/5] reorganizes & code cleaning in acpi-cpufreq
Date: Sun, 1 Oct 2006 06:41:26 -0700
Message-ID: <20061001064126.A16290@unix-os.sc.intel.com>
References: <20060901140753.D14821@unix-os.sc.intel.com>
	<20060927024051.GA19413@redhat.com>
	<20060927024148.GA29163@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060927024148.GA29163@redhat.com>;
	from davej@redhat.com on Tue, Sep 26, 2006 at 10:41:48PM -0400
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: alexey.y.starikovskiy@intel.com, cpufreq <cpufreq@www.linux.org.uk>, Dominik Brodowski <linux@dominikbrodowski.net>

On Tue, Sep 26, 2006 at 10:41:48PM -0400, Dave Jones wrote:
> On Fri, Sep 01, 2006 at 02:07:53PM -0700, Venkatesh Pallipadi wrote:
> 
>  > Some clean up and redsign of the driver. Mainly making it easier to add
>  > support for multiple sub-mechanisms of changing frequency. Currently this
>  > driver supports only ACPI SYSTEM_IO address space. With the changes
>  > below it is easier to add support for other address spaces like Intel 
>  > Enhanced Speedstep which uses MSR (ACPI FIXED_FEATURE_HARDWARE) to do the 
>  > transitions.
> 
> This patch-series fell at the first hurdle.
> 
> error: patch failed: arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c:91
> error: arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c: patch does not apply
> 

This reject was coming from one earlier patch that hasn't gone it yet. The earlier bug fix patch had subject "acpi-cpufreq and software coordination".

> When you repost rediffed patchset, please make the subject of each patch
> in the series a unique description, as this gets used in the shortlog.
> 
> As this series failed, your subsequent patches
>  acpi-cpufreq: Make cpuinfo_cur_freq work again
> and
>  Use IA32_APERF and IA32_MPERF and get freq feedback from hardware
> 
> also failed. If you want to fold those into the other changes, or
> just send a complete rediffed 7-series patchset, I'll apply those.
>

OK. Did refresh of all these patches with 2.6.18-git. Will send a 8 patch 
patchset now.

Thanks,
Venki 
