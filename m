From: Zwane Mwaikambo <zwane@linuxpower.ca>
Subject: Re: [PATCH] Hotplug cpu: fix p4-clockmod
Date: Mon, 30 Aug 2004 12:28:44 -0400 (EDT)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Pine.LNX.4.58.0408301214120.21527@montezuma.fsmlabs.com>
References: <20040829125717.GA17032@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040829125717.GA17032@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: CPU Freq ML <cpufreq@www.linux.org.uk>

On Sun, 29 Aug 2004, Dominik Brodowski wrote:

> > This currently oopses when a processor goes offline since it can't
> > schedule itself onto the correct cpu.
>
> What's the call trace? Because I don't see why it should happen: if the CPU
> is removed, cpufreq_remove_dev() gets called, which cleans up the governor
> and the device driver -- and I can't see a call to setdc in this code path.

kernel BUG at arch/i386/kernel/cpu/cpufreq/p4-clockmod.c:148!
invalid operand: 0000 [#1]
PREEMPT SMP DEBUG_PAGEALLOC
Modules linked in:
CPU:    0
EIP:    0060:[<c01147a3>]    Not tainted VLI
EFLAGS: 00010297   (2.6.8.1-mm2)
EIP is at cpufreq_p4_target+0x1c3/0x210
eax: eb3b4a40   ebx: eb365e98   ecx: eb3b4a40   edx: 00000002
esi: eb364000   edi: 00000001   ebp: eb365ebc   esp: eb365e94
ds: 007b   es: 007b   ss: 0068
Process cpuspeed (pid: 2491, threadinfo=eb364000 task=eb3b4a40)
Stack: 00000003 00000003 00000007 00000001 0030d400 002ab980 eb365f02 c06d8a40
       00000000 c0832ca0 eb365edc c0557199 c0832ca0 002ab980 00000000 002ab980
       00000000 c073f240 eb365f00 c0557ec2 c0832ca0 002ab980 00000000 ffffffea
Call Trace:
 [<c0108915>] show_stack+0x75/0x90
 [<c0108a75>] show_registers+0x125/0x190
 [<c0108c79>] die+0x109/0x1f0
 [<c0109153>] do_invalid_op+0xe3/0xf0
 [<c01084dd>] error_code+0x2d/0x40
 [<c0557199>] __cpufreq_driver_target+0x69/0x70
 [<c0557ec2>] cpufreq_set+0x72/0xa0
 [<c05581f7>] store_speed+0x37/0x40
 [<c05567cb>] store+0x4b/0x60
 [<c01b2178>] flush_write_buffer+0x28/0x30
 [<c01b21be>] sysfs_write_file+0x3e/0x50
 [<c016dbdc>] vfs_write+0xac/0x100
 [<c016dcdc>] sys_write+0x3c/0x70
 [<c0107359>] sysenter_past_esp+0x52/0x79
Code: ff ff 59 58 8d 47 01 50 6a 02 53 e8 18 26 28 00 83 c4 0c 89 c1 83 f8 02 7e 05 b9 02 00 00 00 89 cf 83 f9 01 7e b2 e9 22 ff ff ff <0f> 0b 94 00 70 9d 64 c0 eb bc 8d 76 00 8d 75 e4 6a 00 89 7d e4

> > So we now disable preemption whilst reading or setting the DC.
> Or should we disable CPU hotplug [IIRC there's some callback to temporarily
> do that] in the cpufreq core before calling ->target() or ->get()
>
> > There is a questionable hunk which returns the
> > stock_freq if the processor being read from is offline.

The cpufreq_sysdev_driver stuff only covers device removal and won't cover
the processor being removed. In order to take care of that you need to either
disable preemption or hold the cpucontrol semaphore, or you could register
a cpu online/offline notifier and do the necessary work there.

Thanks,
	Zwane
