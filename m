From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7859] Frequency can't switch on a dual Turion 64
Date: Mon, 22 Jan 2007 00:59:42 -0800
Message-ID: <200701220859.l0M8xgIR020948@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=7859





------- Additional Comments From trenn@suse.de  2007-01-22 00:51 -------
What I found:
your BIOS only uses Notify (\_PR.CPU0, 0x80) calls, but does not inform the 
second CPU about changes (something like Notify (\_PR.CPU1, 0x80)).

In drivers/cpufreq/cpufreq.c:cpufreq_add_dev() a new policy object is 
allocated, also for a mangaged CPU. Therefore I think the attached patch is 
needed.

The _PPC function is used to tell the kernel which frequencies are allowed. A 
value of zero means all freqs are allowed, a value of one means the highest 
freq is not allowed (only 800 in your case).

Your BIOS initialses the _PPC value (XPPC variable) with 1 and it could be that 
_PPC must not be invoked at cpufreq initialisation time. To figure that out you 
should add a line like that at the end of drivers/cpufreq/processor_perflib.c: 
acpi_processor_ppc_notifier() (Best before the verify call, if you use my patch 
also place this line into the for_each_cpu_mask loop):
        printk ("PPC - ppc: %d, cpuid: %d, policy_cpu: %d\n", ppc, pr->id, 
policy->cpu);

If _PPC must not get invoked at initialisation time (if you have only the ppc 
call once at module load time and it's always 1), this patch is also needed:
http://marc.theaimsgroup.com/?l=linux-acpi&m=116900368102272&w=2


------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
