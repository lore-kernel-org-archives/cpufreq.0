From: "Allen H. Ibara" <uce.llist@ibara.net>
Subject: cpufreq lockdep warning
Date: Wed, 12 Jul 2006 21:02:00 -0700
Message-ID: <20060713040200.GA12731@wam.verbalee.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
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
To: cpufreq@lists.linux.org.uk
Cc: davej@codemonkey.org.uk

Hi,

Not sure what to make of this lockdep warning with recent git i386
kernel:

=======================================================
[ INFO: possible circular locking dependency detected ]
-------------------------------------------------------
powernowd/5276 is trying to acquire lock:
 (&policy->lock){--..}, at: [<c0330bed>] mutex_lock+0x1c/0x1f

but task is already holding lock:
 (cpucontrol){--..}, at: [<c0330bed>] mutex_lock+0x1c/0x1f

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (cpucontrol){--..}:
       [<c0135a10>] lock_acquire+0x5e/0x7e
       [<c0330a67>] __mutex_lock_slowpath+0xb0/0x21a
       [<c0330bed>] mutex_lock+0x1c/0x1f
       [<c0138c9b>] __lock_cpu_hotplug+0x38/0x52
       [<c0138d8a>] lock_cpu_hotplug+0xa/0xc
       [<c02d9bcd>] __cpufreq_driver_target+0x13/0x4e
       [<c02db44a>] cpufreq_governor_performance+0x1a/0x20
       [<c02da145>] __cpufreq_governor+0x7c/0x14d
       [<c02da420>] __cpufreq_set_policy+0xc7/0x102
       [<c02da6e9>] cpufreq_set_policy+0x2d/0x6f
       [<c02daa01>] cpufreq_add_dev+0x2d6/0x450
       [<c027d2d5>] sysdev_driver_register+0x58/0x9b
       [<c02da2dd>] cpufreq_register_driver+0x7f/0xfb
       [<f898155a>] powernowk8_init+0x65/0x73 [powernow_k8]
       [<c013b6f7>] sys_init_module+0x15e0/0x1741
       [<c0102e5d>] sysenter_past_esp+0x56/0x8d

-> #0 (&policy->lock){--..}:
       [<c0135a10>] lock_acquire+0x5e/0x7e
       [<c0330a67>] __mutex_lock_slowpath+0xb0/0x21a
       [<c0330bed>] mutex_lock+0x1c/0x1f
       [<c02da681>] store_scaling_governor+0x120/0x15b
       [<c02d9fa3>] store+0x35/0x46
       [<c018e3ce>] sysfs_write_file+0xb1/0xd7
       [<c015be13>] vfs_write+0x8a/0x136
       [<c015c650>] sys_write+0x3b/0x60
       [<c0102e5d>] sysenter_past_esp+0x56/0x8d

other info that might help us debug this:

1 lock held by powernowd/5276:
 #0:  (cpucontrol){--..}, at: [<c0330bed>] mutex_lock+0x1c/0x1f


I would guess that store_scaling_governor in drivers/cpufreq/cpufreq.c should
do mutex_lock(&policy->lock) before lock_cpu_hotplug() (near line 426),
but someone who's more familiar with it should probably validate that.

Thanks,

--AHI
