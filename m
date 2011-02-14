From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 18662] kondemand/1  stuck
Date: Mon, 14 Feb 2011 16:41:11 GMT
Message-ID: <201102141641.p1EGfBYf015457@demeter2.kernel.org>
References: <bug-18662-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-18662-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=18662


justincase@yopmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |justincase@yopmail.com




--- Comment #1 from justincase@yopmail.com  2011-02-14 16:41:10 ---
Seeing a similar issue on 2.6.18-194.32.1.el5. Appeared immediately after
upgrading kernel. Here is an example:

Feb  1 01:24:51 alpha kernel: BUG: soft lockup - CPU#1 stuck for 25s!
[swapper:0]
Feb  1 01:24:51 alpha kernel: CPU 1:
Feb  1 01:24:51 alpha kernel: Modules linked in: xt_conntrack iptable_mangle
ip_conntrack_ftp ipt_LOG xt_limit xt_multiport $
Feb  1 01:24:51 alpha kernel: Pid: 0, comm: swapper Not tainted
2.6.18-194.32.1.el5 #1
Feb  7 01:24:51 alpha kernel: RIP: 0010:[<ffffffff8000ca87>] 
[<ffffffff8000ca87>] __delay+0xa/0x10
Feb  1 01:24:51 alpha kernel: RSP: 0018:ffff8101043d7e20  EFLAGS: 00000212      
Feb  1 01:24:51 alpha kernel: RAX: 0000000000002eba RBX: ffffc2000006c000 RCX:
00000000460a8b27
Feb  1 01:24:51 alpha kernel: RDX: 0000000000062065 RSI: 0000000000000190 RDI:
00000000000061d7
Feb  1 01:24:51 alpha kernel: RBP: ffff8101043d7da0 R08: 000000000000000a R09:
0000000000002710
Feb  1 01:24:51 alpha kernel: R10: ffff8101043fc008 R11: 0000000000000008 R12:
ffffffff8005dc8e
Feb  1 01:24:51 alpha kernel: R13: 0000000000002706 R14: ffffffff80078225 R15:
ffff8101043d7da0
Feb  1 01:24:51 alpha kernel: FS:  0000000041582940(0000)
GS:ffff8101043937c0(0000) knlGS:00000000f7f01af0
Feb  1 01:24:51 alpha kernel: CS:  0010 DS: 0018 ES: 0018 CR0: 000000008005003b 
Feb  1 01:24:51 alpha kernel: CR2: 00002b2ff03f6010 CR3: 000000010d9ab000 CR4:
00000000000006e0
Feb  1 01:24:51 alpha kernel:
Feb  1 01:24:51 alpha kernel: Call Trace:
Feb  1 01:24:51 alpha kernel:  <IRQ>  [<ffffffff881ac979>]
:forcedeth:reg_delay+0x39/0x82      
Feb  1 01:24:51 alpha kernel:  [<ffffffff881acb5a>] :forcedeth:mii_rw+0x83/0xab 
Feb  1 01:24:51 alpha kernel:  [<ffffffff881acc8b>]
:forcedeth:nv_update_linkspeed+0x109/0x41b          
Feb  1 01:24:51 alpha kernel:  [<ffffffff881ae05f>]
:forcedeth:nv_linkchange+0x9/0x61          
Feb  1 01:24:51 alpha kernel:  [<ffffffff881afaa3>]
:forcedeth:nv_nic_irq_optimized+0x112/0x232           
Feb  1 01:24:51 alpha kernel:  [<ffffffff80010c3a>] handle_IRQ_event+0x51/0xa6
Feb  1 01:24:51 alpha kernel:  [<ffffffff800bb018>] __do_IRQ+0xa4/0x103
Feb  1 01:24:51 alpha kernel:  [<ffffffff8006ca0d>] do_IRQ+0xe7/0xf5
Feb  1 01:24:51 alpha kernel:  [<ffffffff8006b342>] default_idle+0x0/0x50
Feb  1 01:24:51 alpha kernel:  [<ffffffff8005d615>] ret_from_intr+0x0/0xa
Feb  1 01:24:51 alpha kernel:  <EOI>  [<ffffffff8006b36b>]
default_idle+0x29/0x50
Feb  1 01:24:51 alpha kernel:  [<ffffffff800492c4>] cpu_idle+0x95/0xb8
Feb  1 01:24:51 alpha kernel:  [<ffffffff80077991>] start_secondary+0x498/0x4a7

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
