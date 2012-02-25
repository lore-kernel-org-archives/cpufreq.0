From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH] processor passthru - upload _Cx and _Pxx data to
 hypervisor (v5).
Date: Fri, 24 Feb 2012 19:21:36 -0500
Message-ID: <20120225002136.GB26913@phenom.dumpdata.com>
References: <1330036270-20015-1-git-send-email-konrad.wilk@oracle.com>
 <4F47733E020000780007497D@nat28.tlf.novell.com>
Mime-Version: 1.0
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4F47733E020000780007497D@nat28.tlf.novell.com>
Sender: linux-acpi-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Beulich <JBeulich@suse.com>, davej@redhat.com, cpufreq@vger.kernel.org
Cc: ke.yu@intel.com, kevin.tian@intel.com, lenb@kernel.org, xen-devel@lists.xensource.com, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Feb 24, 2012 at 10:23:42AM +0000, Jan Beulich wrote:
> >>> On 23.02.12 at 23:31, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com> wrote:
> > This module (processor-passthru)  collects the information that the cpufreq
> > drivers and the ACPI processor code save in the 'struct acpi_processor' and
> > then uploads it to the hypervisor.
> 
> Thus looks conceptually wrong to me - there shouldn't be a need for a
> CPUFreq driver to be loaded in Dom0 (or your module should masquerade
> as the one and only suitable one).

So before your email I had been thinking that b/c of the cpuidle rework
by Len it meant that when the cpufreq drivers are active - they would be started
from the cpu_idle call - and since  cpu_idle call ends up being default_idle on
pvops (which calls safe_halt) that would be fine. This is the work that Len did
"cpuidle: replace xen access to x86 pm_idle and default_idle" and
"cpuidle: stop depending on pm_idle" 

But cpufreq != cpuidle != cpufreq governor, and they all are run by different rules.
The ondemand cpufreq governor for example runs a timer and calls the appropiate cpufreq
driver. So with these patches I posted we end up with a cpufreq driver in the kernel
and in Xen hypervisor - both of them trying to change Pstates. Not good (to be fair,
if powernow-k8/acpi-cpufreq would try it via WRMSR -  those would up being trapped and
ignored by the hypervisor. I am not sure about the outw though).

The pre-RFC version of this posted driver implemented a cpufreq governor that was
nop and for future work was going to make a hypercall to get the true cpufreq value
to report properly in /proc/cpuinfo - but I hadn't figured out a way to make it be
the default one dynamically.

Perhaps having xencommons do 
echo "xen" > /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

And s/processor-passthru/cpufreq-xen/ would do it? That would eliminate the [performance,
ondemand,powersave,etc] cpufreq governors from calling into the cpufreq drivers to alter P-states.

Let me CC Dave Jones and the cpufreq mailing list - perhaps they might have
some ideas?
[The patch is http://lwn.net/Articles/483668/]
