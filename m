From: =?ISO-8859-1?Q?Ferdinand_H=FCbner?= <fh@cvmx.org>
Subject: Re: CPU-Frequency limited to lowest available frequency while	under
	load
Date: Thu, 01 Nov 2007 19:07:59 +0100
Message-ID: <472A15FF.5040504@cvmx.org>
References: <4727062E.9090806@cvmx.org>
	<1193837319.4590.466.camel@queen.suse.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------050009090504040206090206"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1193837319.4590.466.camel@queen.suse.de>
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
To: trenn@suse.de
Cc: cpufreq@lists.linux.org.uk

This is a multi-part message in MIME format.
--------------050009090504040206090206
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Thomas Renninger wrote:

> It can be:
>  1) frequency limited by BIOS through _PPC
>  2) frequency reduced by thermal passive limit
>  3) some really odd cpufreq core bug
> 
>>From the last bugs occurring in this area I expect it's 1.
> 
> You should add a printk in drivers/acpi/processor_perflib.c
> acpi_processor_get_platform_limit():
> 	status = acpi_evaluate_integer(pr->handle, "_PPC", NULL, &ppc);
> and print out the ppc value here, best after the checks whether this
> call succeeded.
> 
> This should be picked up in cpufreq debug output as _PPC often caused
> cpufreq problems. A quick look tells me that it is a bit ugly to use
> cpufreq debug syntax in acpi layer, but it should be possible and
> appropriate.
> 
> If _PPC is 0 all freqs are allowed, if it is 1 the highest freq is not
> allowed anymore..., so this should always be 0 when working on AC power.

I have applied the patch and ran some tests with cpufreq core debugging
enabled. What I receive is the following output:

cpufreq-core: target for CPU 0: 2000000 kHz, relation 1
cpufreq-core: setting new policy for CPU 0: 1000000 - 2000000 kHz
freq-table: request for verification of policy (1000000 - 2000000 kHz)
for cpu 0
freq-table: verification lead to (1000000 - 2000000 kHz) for cpu 0
freq-table: request for verification of policy (1000000 - 1000000 kHz)
for cpu 0
freq-table: verification lead to (1000000 - 1000000 kHz) for cpu 0
cpufreq-core: new min and max freqs are 1000000 - 1000000 kHz

I repeated the test a couple of times and the _PPC values have always
been 0 except for the last test I did. The value was 3 in the last test.
Does that mean that the BIOS is partially responsible?

> If it is this it could be that:
>   - ACPI is confused
>   - It is intended by BIOS (are you working on battery -> look up
>     your BIOS options, maybe you can modify anything related)
>   - _PPC is wrong at init (or later) and the value is not reevaluated

I was not working on battery, the _PPC values were 0 at init. I re-ran
the tests whithout X or acpid enabled and the problem did not happen
without acpid/X. So I guess the problem has something to do with ACPI?

I tried to investigate further with acpi debugging, but I am completely
overwhelmed with acpi's debugging output. I have no clue how to read
something useful from it.

I have attached parts of /var/log/messages with the debugging output
from cpufreq (I did not include the acpi part).

> Maybe you should open a bugreport on http://bugzilla.kernel.org, pls add
> me to CC then.

I would start with posting at the acpi mailing list, maybe someone can
help me debugging...


Thank you for your help,

Ferdinand

--------------050009090504040206090206
Content-Type: text/plain;
 name="messages.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="messages.txt"

Nov  1 09:59:38 panther cpufreq-core: target for CPU 0: 2000000 kHz, relation 1
Nov  1 09:59:42 panther printk: 89 messages suppressed.
Nov  1 09:59:42 panther cpufreq-core: target for CPU 0: 2000000 kHz, relation 1
Nov  1 09:59:47 panther printk: 223 messages suppressed.
Nov  1 09:59:47 panther cpufreq-core: target for CPU 0: 1838571 kHz, relation 0
Nov  1 09:59:52 panther printk: 182 messages suppressed.
Nov  1 09:59:52 panther cpufreq-core: target for CPU 0: 1381714 kHz, relation 0
Nov  1 09:59:57 panther printk: 168 messages suppressed.
Nov  1 09:59:57 panther cpufreq-core: target for CPU 0: 1400000 kHz, relation 0
Nov  1 10:00:02 panther printk: 170 messages suppressed.
Nov  1 10:00:02 panther cpufreq-core: target for CPU 0: 2000000 kHz, relation 1
Nov  1 10:00:02 panther cpufreq-core: setting new policy for CPU 0: 1000000 - 2000000 kHz
Nov  1 10:00:02 panther freq-table: request for verification of policy (1000000 - 2000000 kHz) for cpu 0
Nov  1 10:00:02 panther freq-table: verification lead to (1000000 - 2000000 kHz) for cpu 0
Nov  1 10:00:02 panther freq-table: request for verification of policy (1000000 - 1000000 kHz) for cpu 0
Nov  1 10:00:02 panther freq-table: verification lead to (1000000 - 1000000 kHz) for cpu 0
Nov  1 10:00:02 panther cpufreq-core: new min and max freqs are 1000000 - 1000000 kHz
Nov  1 10:00:02 panther cpufreq-core: governor: change or update limits
Nov  1 10:00:02 panther cpufreq-core: __cpufreq_governor for CPU 0, event 3
Nov  1 10:00:02 panther cpufreq-core: target for CPU 0: 1000000 kHz, relation 1
Nov  1 10:00:02 panther freq-table: request for target 1000000 kHz (relation: 1) for cpu 0
Nov  1 10:00:02 panther freq-table: target is 3 (1000000 kHz, 3)
Nov  1 10:00:02 panther cpufreq-core: notification 0 of frequency transition to 1000000 kHz
Nov  1 10:00:02 panther cpufreq-core: notification 0 of frequency transition to 1000000 kHz
Nov  1 10:00:02 panther cpufreq-core: notification 1 of frequency transition to 1000000 kHz
Nov  1 10:00:02 panther cpufreq-core: notification 1 of frequency transition to 1000000 kHz
Nov  1 10:00:02 panther acpid: received event "processor CPU0 00000080 00000003"
Nov  1 10:00:02 panther acpid: notifying client 5849[0:0]
Nov  1 10:00:02 panther acpid: executing action "/etc/acpi/default.sh processor CPU0 00000080 00000003"
Nov  1 10:00:02 panther cpufreq-core: setting new policy for CPU 0: 1000000 - 2000000 kHz
Nov  1 10:00:02 panther freq-table: request for verification of policy (1000000 - 2000000 kHz) for cpu 0
Nov  1 10:00:02 panther freq-table: verification lead to (1000000 - 2000000 kHz) for cpu 0
Nov  1 10:00:02 panther freq-table: request for verification of policy (1000000 - 1000000 kHz) for cpu 0
Nov  1 10:00:02 panther freq-table: verification lead to (1000000 - 1000000 kHz) for cpu 0
Nov  1 10:00:02 panther cpufreq-core: new min and max freqs are 1000000 - 1000000 kHz
Nov  1 10:00:02 panther cpufreq-core: governor: change or update limits
Nov  1 10:00:02 panther cpufreq-core: __cpufreq_governor for CPU 0, event 3
Nov  1 10:00:02 panther logger: ACPI event unhandled: processor CPU0 00000080 00000003
Nov  1 10:00:02 panther acpid: action exited with status 0
Nov  1 10:00:02 panther acpid: completed event "processor CPU0 00000080 00000003"
Nov  1 10:00:02 panther acpid: received event "processor CPU1 00000080 00000003"
Nov  1 10:00:02 panther acpid: notifying client 5849[0:0]
Nov  1 10:00:02 panther acpid: executing action "/etc/acpi/default.sh processor CPU1 00000080 00000003"
Nov  1 10:00:02 panther logger: ACPI event unhandled: processor CPU1 00000080 00000003
Nov  1 10:00:02 panther acpid: action exited with status 0
Nov  1 10:00:02 panther acpid: completed event "processor CPU1 00000080 00000003"
Nov  1 10:00:27 panther printk: 16 messages suppressed.
Nov  1 10:00:27 panther cpufreq-core: CPU 0: _PPC is 0 - frequency not limited
Nov  1 10:00:27 panther cpufreq-core: updating policy for CPU 0
Nov  1 10:00:27 panther cpufreq-core: setting new policy for CPU 0: 1000000 - 2000000 kHz
Nov  1 10:00:27 panther freq-table: request for verification of policy (1000000 - 2000000 kHz) for cpu 0
Nov  1 10:00:27 panther freq-table: verification lead to (1000000 - 2000000 kHz) for cpu 0
Nov  1 10:00:27 panther freq-table: request for verification of policy (1000000 - 2000000 kHz) for cpu 0
Nov  1 10:00:27 panther freq-table: verification lead to (1000000 - 2000000 kHz) for cpu 0
Nov  1 10:00:27 panther cpufreq-core: new min and max freqs are 1000000 - 2000000 kHz
Nov  1 10:00:27 panther cpufreq-core: governor: change or update limits
Nov  1 10:00:27 panther cpufreq-core: __cpufreq_governor for CPU 0, event 3
Nov  1 10:00:27 panther acpid: received event "processor CPU0 00000080 00000000"
Nov  1 10:00:27 panther acpid: notifying client 5849[0:0]
Nov  1 10:00:27 panther acpid: executing action "/etc/acpi/default.sh processor CPU0 00000080 00000000"
Nov  1 10:00:27 panther cpufreq-core: CPU 1: _PPC is 0 - frequency not limited
Nov  1 10:00:27 panther cpufreq-core: updating policy for CPU 1
Nov  1 10:00:27 panther cpufreq-core: Warning: CPU frequency out of sync: cpufreq and timing core thinks of 1000000, is 0 kHz.
Nov  1 10:00:27 panther cpufreq-core: setting new policy for CPU 0: 1000000 - 2000000 kHz
Nov  1 10:00:27 panther freq-table: request for verification of policy (1000000 - 2000000 kHz) for cpu 0
Nov  1 10:00:27 panther freq-table: verification lead to (1000000 - 2000000 kHz) for cpu 0
Nov  1 10:00:27 panther freq-table: request for verification of policy (1000000 - 2000000 kHz) for cpu 0
Nov  1 10:00:27 panther freq-table: verification lead to (1000000 - 2000000 kHz) for cpu 0
Nov  1 10:00:27 panther cpufreq-core: new min and max freqs are 1000000 - 2000000 kHz
Nov  1 10:00:27 panther cpufreq-core: governor: change or update limits
Nov  1 10:00:27 panther cpufreq-core: __cpufreq_governor for CPU 0, event 3
Nov  1 10:00:27 panther logger: ACPI event unhandled: processor CPU0 00000080 00000000
Nov  1 10:00:27 panther acpid: action exited with status 0
Nov  1 10:00:27 panther acpid: completed event "processor CPU0 00000080 00000000"
Nov  1 10:00:27 panther acpid: received event "processor CPU1 00000080 00000000"
Nov  1 10:00:27 panther acpid: notifying client 5849[0:0]
Nov  1 10:00:27 panther acpid: executing action "/etc/acpi/default.sh processor CPU1 00000080 00000000"
Nov  1 10:00:27 panther logger: ACPI event unhandled: processor CPU1 00000080 00000000
Nov  1 10:00:27 panther acpid: action exited with status 0
Nov  1 10:00:27 panther acpid: completed event "processor CPU1 00000080 00000000"
Nov  1 10:00:42 panther printk: 2 messages suppressed.
Nov  1 10:00:42 panther cpufreq-core: target for CPU 0: 2000000 kHz, relation 1
Nov  1 10:00:42 panther freq-table: request for target 2000000 kHz (relation: 1) for cpu 0
Nov  1 10:00:42 panther freq-table: target is 0 (2000000 kHz, 0)


----------------- 

Nov  1 10:38:05 panther cpufreq-core: CPU 0: _PPC is 3 - frequency  limited
Nov  1 10:38:05 panther cpufreq-core: setting new policy for CPU 0: 1000000 - 2000000 kHz
Nov  1 10:38:05 panther freq-table: request for verification of policy (1000000 - 2000000 kHz) for cpu 0
Nov  1 10:38:05 panther freq-table: verification lead to (1000000 - 2000000 kHz) for cpu 0
Nov  1 10:38:05 panther freq-table: request for verification of policy (1000000 - 1000000 kHz) for cpu 0
Nov  1 10:38:05 panther freq-table: verification lead to (1000000 - 1000000 kHz) for cpu 0
Nov  1 10:38:05 panther cpufreq-core: new min and max freqs are 1000000 - 1000000 kHz
Nov  1 10:38:05 panther cpufreq-core: governor: change or update limits
Nov  1 10:38:05 panther cpufreq-core: __cpufreq_governor for CPU 0, event 3
Nov  1 10:38:05 panther cpufreq-core: target for CPU 0: 1000000 kHz, relation 1
Nov  1 10:38:05 panther freq-table: request for target 1000000 kHz (relation: 1) for cpu 0
Nov  1 10:38:05 panther acpid: received event "processor CPU0 00000080 00000003"
Nov  1 10:38:05 panther acpid: notifying client 1676[0:0]
Nov  1 10:38:05 panther acpid: executing action "/etc/acpi/default.sh processor CPU0 00000080 00000003"
Nov  1 10:38:05 panther freq-table: target is 3 (1000000 kHz, 3)
Nov  1 10:38:05 panther cpufreq-core: notification 0 of frequency transition to 1000000 kHz
Nov  1 10:38:05 panther cpufreq-core: notification 0 of frequency transition to 1000000 kHz
Nov  1 10:38:05 panther cpufreq-core: notification 1 of frequency transition to 1000000 kHz
Nov  1 10:38:05 panther cpufreq-core: notification 1 of frequency transition to 1000000 kHz
Nov  1 10:38:05 panther cpufreq-core: setting new policy for CPU 0: 1000000 - 2000000 kHz
Nov  1 10:38:05 panther freq-table: request for verification of policy (1000000 - 2000000 kHz) for cpu 0
Nov  1 10:38:05 panther freq-table: verification lead to (1000000 - 2000000 kHz) for cpu 0
Nov  1 10:38:05 panther freq-table: request for verification of policy (1000000 - 1000000 kHz) for cpu 0
Nov  1 10:38:05 panther freq-table: verification lead to (1000000 - 1000000 kHz) for cpu 0
Nov  1 10:38:05 panther cpufreq-core: new min and max freqs are 1000000 - 1000000 kHz
Nov  1 10:38:05 panther cpufreq-core: governor: change or update limits
Nov  1 10:38:05 panther cpufreq-core: __cpufreq_governor for CPU 0, event 3
Nov  1 10:38:05 panther logger: ACPI event unhandled: processor CPU0 00000080 00000003
Nov  1 10:38:05 panther acpid: action exited with status 0
Nov  1 10:38:05 panther acpid: completed event "processor CPU0 00000080 00000003"
Nov  1 10:38:05 panther acpid: received event "processor CPU1 00000080 00000003"
Nov  1 10:38:05 panther acpid: notifying client 1676[0:0]
Nov  1 10:38:05 panther acpid: executing action "/etc/acpi/default.sh processor CPU1 00000080 00000003"
Nov  1 10:38:05 panther logger: ACPI event unhandled: processor CPU1 00000080 00000003
Nov  1 10:38:05 panther acpid: action exited with status 0
Nov  1 10:38:05 panther acpid: completed event "processor CPU1 00000080 00000003"
Nov  1 10:39:28 panther [fglrx:firegl_lock] *ERROR* Process 2822 is using illegal context 0x00000003
Nov  1 10:39:54 panther su[1821]: pam_unix(su:session): session closed for user root
Nov  1 10:41:17 panther printk: 6 messages suppressed.
Nov  1 10:41:17 panther cpufreq-core: CPU 0: _PPC is 0 - frequency not limited
Nov  1 10:41:17 panther cpufreq-core: updating policy for CPU 0
Nov  1 10:41:17 panther cpufreq-core: setting new policy for CPU 0: 1000000 - 2000000 kHz
Nov  1 10:41:17 panther freq-table: request for verification of policy (1000000 - 2000000 kHz) for cpu 0
Nov  1 10:41:17 panther freq-table: verification lead to (1000000 - 2000000 kHz) for cpu 0
Nov  1 10:41:17 panther freq-table: request for verification of policy (1000000 - 2000000 kHz) for cpu 0
Nov  1 10:41:17 panther freq-table: verification lead to (1000000 - 2000000 kHz) for cpu 0
Nov  1 10:41:17 panther cpufreq-core: new min and max freqs are 1000000 - 2000000 kHz
Nov  1 10:41:17 panther cpufreq-core: governor: change or update limits
Nov  1 10:41:17 panther cpufreq-core: __cpufreq_governor for CPU 0, event 3
Nov  1 10:41:17 panther acpid: received event "processor CPU0 00000080 00000000"
Nov  1 10:41:17 panther acpid: notifying client 1676[0:0]
Nov  1 10:41:17 panther acpid: executing action "/etc/acpi/default.sh processor CPU0 00000080 00000000"
Nov  1 10:41:17 panther cpufreq-core: CPU 1: _PPC is 0 - frequency not limited
Nov  1 10:41:17 panther cpufreq-core: updating policy for CPU 1
Nov  1 10:41:17 panther cpufreq-core: Warning: CPU frequency out of sync: cpufreq and timing core thinks of 1000000, is 0 kHz.
Nov  1 10:41:17 panther cpufreq-core: notification 0 of frequency transition to 0 kHz
Nov  1 10:41:17 panther cpufreq-core: notification 1 of frequency transition to 0 kHz
Nov  1 10:41:17 panther cpufreq-core: setting new policy for CPU 0: 1000000 - 2000000 kHz
Nov  1 10:41:17 panther freq-table: request for verification of policy (1000000 - 2000000 kHz) for cpu 0
Nov  1 10:41:17 panther freq-table: verification lead to (1000000 - 2000000 kHz) for cpu 0
Nov  1 10:41:17 panther freq-table: request for verification of policy (1000000 - 2000000 kHz) for cpu 0
Nov  1 10:41:17 panther freq-table: verification lead to (1000000 - 2000000 kHz) for cpu 0
Nov  1 10:41:17 panther cpufreq-core: new min and max freqs are 1000000 - 2000000 kHz
Nov  1 10:41:17 panther cpufreq-core: governor: change or update limits
Nov  1 10:41:17 panther cpufreq-core: __cpufreq_governor for CPU 0, event 3
Nov  1 10:41:17 panther logger: ACPI event unhandled: processor CPU0 00000080 00000000
Nov  1 10:41:17 panther acpid: action exited with status 0
Nov  1 10:41:17 panther acpid: completed event "processor CPU0 00000080 00000000"
Nov  1 10:41:17 panther acpid: received event "processor CPU1 00000080 00000000"
Nov  1 10:41:17 panther acpid: notifying client 1676[0:0]
Nov  1 10:41:17 panther acpid: executing action "/etc/acpi/default.sh processor CPU1 00000080 00000000"
Nov  1 10:41:17 panther logger: ACPI event unhandled: processor CPU1 00000080 00000000
Nov  1 10:41:17 panther acpid: action exited with status 0
Nov  1 10:41:17 panther acpid: completed event "processor CPU1 00000080 00000000"
Nov  1 10:41:17 panther cpufreq-core: target for CPU 0: 2000000 kHz, relation 1
Nov  1 10:41:17 panther freq-table: request for target 2000000 kHz (relation: 1) for cpu 0
Nov  1 10:41:17 panther freq-table: target is 0 (2000000 kHz, 0)
Nov  1 10:41:22 panther printk: 550 messages suppressed.
Nov  1 10:41:22 panther cpufreq-core: target for CPU 0: 1188571 kHz, relation 0

--------------050009090504040206090206
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------050009090504040206090206--

