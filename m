From: Thomas Renninger <trenn@suse.de>
Subject: RE: cpufreq stops working after a while
Date: Thu, 17 Aug 2006 17:28:19 +0200
Message-ID: <1155828499.4302.1304.camel@queen.suse.de>
References: <EB12A50964762B4D8111D55B764A8454741E13@scsmsx413.amr.corp.intel.com>
	<1155752344.3554.4.camel@localhost.localdomain>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1155752344.3554.4.camel@localhost.localdomain>
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
Content-Type: text/plain; charset="utf-8"
To: Carlos Garcia Campos <carlosgc@gnome.org>
Cc: cpufreq@lists.linux.org.uk

On Wed, 2006-08-16 at 20:19 +0200, Carlos Garcia Campos wrote:
> El mié, 16-08-2006 a las 06:27 -0700, Pallipadi, Venkatesh escribió:
> >  

Sorry, I don't see it... A last guess...
When these Dells allow freqs again after (un-)plugging AC, a processor
event is thrown, _PPC is reread and freqs are allowed again.
This works AFAIK.

Maybe this processor event is missing when the machine unlimits freq
because of thermal issues and _PPC does not get updated.

You should be able to test this by:
If you run into this issue (freq limited), wait a while until the
machine is cool (better wait a bit longer..) then unplug and replug the
AC adapter. Then wait for ten seconds. _PPC should get reevaluated and
max_freq should be set to highest freq again.

You can watch the acpi events by stopping hal/acpid whatever
accesses /proc/acpi/events, then do cat /proc/acpi/events.
Something like:
processor CPU0 0000008X 00000000
allows all freqs again
processor CPU0 0000008X 00000002
e.g. limits frequencies to the third highest.

If this is the case (processor event to allow all freqs again is
missing), the attached patch (patch is on top of the one I posted some
minutes ago) might help.

> 1.- scaling_max_freq is set to 600000
> 
> speedstep-centrino: target=1520000kHz old=1600000 new=1400000 msr=0e24
> cpufreq-core: notification 0 of frequency transition to 1400000 kHz
> userspace: saving cpu_cur_freq of cpu 0 to be 1400000 kHz
> cpufreq-core: notification 1 of frequency transition to 1400000 kHz
> cpufreq-core: scaling loops_per_jiffy to 1395912 for frequency 1400000 kHz
> userspace: saving cpu_cur_freq of cpu 0 to be 1400000 kHz
> cpufreq-core: target for CPU 0: 1440000 kHz, relation 1
> printk: 42 messages suppressed.
> cpufreq-core: updating policy for CPU 0
> cpufreq-core: Warning: CPU frequency out of sync: cpufreq and timing core thinks of 1600000, is 600000 kHz.
> cpufreq-core: notification 0 of frequency transition to 600000 kHz
> userspace: saving cpu_cur_freq of cpu 0 to be 600000 kHz
> cpufreq-core: notification 1 of frequency transition to 600000 kHz
> cpufreq-core: scaling loops_per_jiffy to 598248 for frequency 600000 kHz
> userspace: saving cpu_cur_freq of cpu 0 to be 600000 kHz
> cpufreq-core: setting new policy for CPU 0: 600000 - 1600000 kHz
> freq-table: request for verification of policy (600000 - 1600000 kHz) for cpu 0
> freq-table: verification lead to (600000 - 1600000 kHz) for cpu 0
> freq-table: request for verification of policy (600000 - 600000 kHz) for cpu 0
> freq-table: verification lead to (600000 - 600000 kHz) for cpu 0
> cpufreq-core: new min and max freqs are 600000 - 600000 kHz
> cpufreq-core: governor: change or update limits
> cpufreq-core: __cpufreq_governor for CPU 0, event 3
> cpufreq-core: target for CPU 0: 600000 kHz, relation 1
> freq-table: request for target 600000 kHz (relation: 1) for cpu 0
> 
> 2.- I can set 1600000 again and it works
> 
> cpufreq-core: updating policy for CPU 0
> cpufreq-core: Warning: CPU frequency out of sync: cpufreq and timing core thinks of 600000, is 1600000 kHz.
This is where I expect freqs are allowed again and simply increase
max_freq to current_freq..., it's as ugly as the machine' BIOS ...

> cpufreq-core: notification 0 of frequency transition to 1600000 kHz
> userspace: saving cpu_cur_freq of cpu 0 to be 1600000 kHz
> cpufreq-core: scaling loops_per_jiffy to 1595328 for frequency 1600000 kHz
> cpufreq-core: notification 1 of frequency transition to 1600000 kHz
> userspace: saving cpu_cur_freq of cpu 0 to be 1600000 kHz
> cpufreq-core: setting new policy for CPU 0: 600000 - 600000 kHz
> freq-table: request for verification of policy (600000 - 600000 kHz) for cpu 0
> freq-table: verification lead to (600000 - 600000 kHz) for cpu 0
> freq-table: request for verification of policy (600000 - 600000 kHz) for cpu 0
> freq-table: verification lead to (600000 - 600000 kHz) for cpu 0
> cpufreq-core: new min and max freqs are 600000 - 600000 kHz
> cpufreq-core: governor: change or update limits
> cpufreq-core: __cpufreq_governor for CPU 0, event 3
> cpufreq-core: target for CPU 0: 600000 kHz, relation 1
> freq-table: request for target 600000 kHz (relation: 1) for cpu 0
> freq-table: target is 7 (600000 kHz, 1554)
> speedstep-centrino: target=600000kHz old=1600000 new=600000 msr=0612
> 
> I hope it helps to catch the problem. 

Hope that helps, if not I run out of ideas...

 drivers/cpufreq/cpufreq.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletion(-)

Index: linux-2.6.18-rc4/drivers/cpufreq/cpufreq.c
===================================================================
--- linux-2.6.18-rc4.orig/drivers/cpufreq/cpufreq.c
+++ linux-2.6.18-rc4/drivers/cpufreq/cpufreq.c
@@ -1514,8 +1514,12 @@ int cpufreq_update_policy(unsigned int c
 			dprintk("Driver did not initialize current freq");
 			data->cur = policy.cur;
 		} else {
-			if (data->cur != policy.cur)
+			if (data->cur != policy.cur){
 				cpufreq_out_of_sync(cpu, data->cur, policy.cur);
+				if (data->cur > policy.max)
+					data->user_policy.max = policy.max =
+						data->cur;
+			}
 		}
 	}
