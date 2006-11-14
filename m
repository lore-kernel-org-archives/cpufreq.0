From: Mattia Dongili <malattia@linux.it>
Subject: Re: 2.6.19-rc5-mm2
Date: Tue, 14 Nov 2006 21:58:29 +0100
Message-ID: <20061114205829.GC2504@inferi.kami.home>
References: <20061114014125.dd315fff.akpm@osdl.org> <4559A91C.10009@reub.net> <20061114170053.GA22649@in.ibm.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S966056AbWKNU7L@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20061114170053.GA22649@in.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gautham R Shenoy <ego@in.ibm.com>
Cc: Reuben Farrelly <reuben-linuxkernel@reub.net>, Andrew Morton <akpm@osdl.org>, davej@redhat.com, linux-kernel@vger.kernel.org, venkatesh.pallipadi@intel.com, CPUFreq Mailing List <cpufreq@lists.linux.org.uk>

On Tue, Nov 14, 2006 at 10:30:53PM +0530, Gautham R Shenoy wrote:
> On Tue, Nov 14, 2006 at 10:31:40PM +1100, Reuben Farrelly wrote:
> 
> Hi Reuben,
> 
> > Oops:
> > 
> > (davej cc'd - I think it's his specialty)
> > 
> 
> [snip]
> 
> > ------------[ cut here ]------------
> > kernel BUG at drivers/cpufreq/cpufreq_userspace.c:138!
> > invalid opcode: 0000 [1] SMP
> > last sysfs file:
> > CPU 0
> > Modules linked in:
> > Pid: 1, comm: swapper Not tainted 2.6.19-rc5-mm2 #1
> > RIP: 0010:[<ffffffff80435299>]  [<ffffffff80435299>] 
> > cpufreq_governor_userspace+0x4e/0x1aa
> > RSP: 0000:ffff81003f61fb40  EFLAGS: 00010246
> > RAX: 0000000000000000 RBX: ffff81003ef4a0d8 RCX: 0000000000000003
> > RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff81003ef4a0d8
> > RBP: ffff81003f61fb60 R08: 0000000000000002 R09: 0000000000000001
> > R10: 0000000000000002 R11: 0000000000000001 R12: 0000000000000000
> > R13: 00000000ffffffea R14: 0000000000000000 R15: 0000000000000000
> > FS:  0000000000000000(0000) GS:ffffffff80652000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0018 ES: 0018 CR0: 000000008005003b
> > CR2: 0000000000000000 CR3: 0000000000201000 CR4: 00000000000006e0
> > Process swapper (pid: 1, threadinfo ffff81003f61e000, task ffff810037ff0040)
> > Stack:  ffff81003f61fb60 ffff81003ef4a0d8 0000000000000001 ffff81003ef4a0d8
> >  ffff81003f61fb90 ffffffff80433b11 ffffffff805d0e80 ffff81003f61fc20
> >  0000000000000000 ffff81003ef4a0d8 ffff81003f61fbc0 ffffffff80434278
> > Call Trace:
> >  [<ffffffff80433b11>] __cpufreq_governor+0x51/0x9b
> >  [<ffffffff80434278>] __cpufreq_set_policy+0xf8/0x13b
> >  [<ffffffff804343e9>] cpufreq_set_policy+0x3c/0x93
> >  [<ffffffff80435125>] cpufreq_add_dev+0x315/0x427
> >  [<ffffffff803b6f87>] sysdev_driver_register+0x87/0xdb
> >  [<ffffffff80434a8e>] cpufreq_register_driver+0x9e/0x120
> >  [<ffffffff806837b2>] acpi_cpufreq_init+0xbe/0xc9
> >  [<ffffffff802666c0>] init+0x160/0x31c
> >  [<ffffffff8025deb8>] child_rip+0xa/0x12
> > 
> > 
> 
> Hmmm.. The BUG indicates policy->cur i.e current frequency is 0.
> 
> In this scenario, policy->cur variable was last set inside 
> acpi_cpufreq_cpu_init when cpufreq_add_dev made a call to 
> cpufreq_driver->init(policy).
> 
> Are you able to reproduce this with 2.6.19-rc5-mm1? 
> 
> Because AFAICS, there ain't many changes w.r.t x86_64 acpi-cpufreq 
> from 2.6.19-rc5-mm1 to 2.6.19-rc5-mm2. 

maybe this helps? mostly guessing here, but when cpufreq_userspace is
the default governor we may hit this path and leave policy->cur
unset.

diff --git a/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c b/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
index 18f4715..94e6e86 100644
--- a/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
+++ b/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
@@ -706,7 +706,7 @@ static int acpi_cpufreq_cpu_init(struct
 		break;
 	case ACPI_ADR_SPACE_FIXED_HARDWARE:
 		acpi_cpufreq_driver.get = get_cur_freq_on_cpu;
-		get_cur_freq_on_cpu(cpu);
+		policy->cur = get_cur_freq_on_cpu(cpu);
 		break;
 	default:
 		break;

-- 
mattia
:wq!
