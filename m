From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: cpufreq-stats oops
Date: Tue, 17 Jan 2006 10:20:37 +0100
Message-ID: <20060117092037.GA26006@dominikbrodowski.de>
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

current 2.6.15 oopses when issuing the command "rmmod cpufreq-stats". Any
ideas?

# CONFIG_SMP is not set
# CONFIG_PREEMPT_NONE is not set
# CONFIG_PREEMPT_VOLUNTARY is not set
CONFIG_PREEMPT=y
CONFIG_PREEMPT_BKL=y
CONFIG_DEBUG_PREEMPT=y

Thanks,
	Dominik

[4296180.471000] Unable to handle kernel paging request at virtual address f01bf000
[4296180.471000]  printing eip:
[4296180.471000] f01bf000
[4296180.471000] *pde = 016c9067
[4296180.471000] *pte = 00000000
[4296180.471000] Oops: 0000 [#1]
[4296180.471000] PREEMPT 
[4296180.471000] Modules linked in: cpufreq_stats iptable_filter uhci_hcd ehci_hcd ipw2100 ieee80211 ieee80211_crypt cpufreq_ondemand pcmcia yenta_socket rsrc_nonstatic pcmcia_core speedstep_centrino freq_table processor
[4296180.471000] CPU:    0
[4296180.471000] EIP:    0060:[<f01bf000>]    Not tainted VLI
[4296180.471000] EFLAGS: 00010246   (2.6.15-gfae11103) 
[4296180.471000] EIP is at 0xf01bf000
[4296180.471000] eax: f01bd26c   ebx: f01bd2c0   ecx: 00000000   edx: 00000007
[4296180.471000] esi: 00000880   edi: 00000000   ebp: cae27f5c   esp: cae27f58
[4296180.471000] ds: 007b   es: 007b   ss: 0068
[4296180.471000] Process rmmod (pid: 25996, threadinfo=cae27000 task=cd150550)
[4296180.471000] Stack: <0>f01bc5bf cae27fb4 c012afa4 00000000 66757063 5f716572 74617473 e3200073 
[4296180.471000]        b7f65000 cae27fa4 c014180a b7f64000 b7f65000 b7f65000 ee6bcdd8 e2e01da0 
[4296180.471000]        ee6bcdd8 ee6bce08 00000000 cae27fb4 bfb76310 00000880 bfb76310 cae27000 
[4296180.471000] Call Trace:
[4296180.471000]  [<c0103211>] show_stack_log_lvl+0xa8/0xb0
[4296180.471000]  [<c0103330>] show_registers+0xf1/0x159
[4296180.471000]  [<c01034e9>] die+0xdc/0x150
[4296180.471000]  [<c0110e88>] do_page_fault+0x39c/0x4da
[4296180.471000]  [<c0102ebf>] error_code+0x4f/0x54
[4296180.471000]  [<c012afa4>] sys_delete_module+0x13c/0x176
[4296180.471000]  [<c0102c3b>] sysenter_past_esp+0x54/0x75
[4296180.471000] Code:  Bad EIP value.
