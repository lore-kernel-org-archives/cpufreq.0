From: Russell King <rmk@arm.linux.org.uk>
Subject: Fwd: Fw: Re: 2.6.0-test7-mm1
Date: Thu, 16 Oct 2003 09:49:04 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031016094904.A7696@flint.arm.linux.org.uk>
Reply-To: Andrew Morton <akpm@osdl.org>, cpufreq@www.linux.org.uk
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

I've cut out the .config attachment since its overly large.  Please
reply to Andrew (ie obeying the reply-to header), thanks.

----- Forwarded message from Andrew Morton <akpm@osdl.org> -----

Date: Wed, 15 Oct 2003 14:47:08 -0700
From: Andrew Morton <akpm@osdl.org>
To: cpufreq@www.linux.org.uk
Subject: Fw: Re: 2.6.0-test7-mm1


Guys,

cpufreq_register_notifier is downing a semaphore early in boot, and
generating an in_atomic() warning.

Can we move the registration out of time_init() context and into an
initcall?


Begin forwarded message:

Date: 15 Oct 2003 23:10:04 +0200
From: Alexander Hoogerhuis <alexh@ihatent.com>
To: Andrew Morton <akpm@osdl.org>
Subject: Re: 2.6.0-test7-mm1


Kernel command line: root=/dev/discs/disc0/part3 ro psmouse_noext=1
No local APIC present or hardware disabled
current: c03a9b40
current->thread_info: c0422000
Initializing CPU#0
PID hash table entries: 4096 (order 12: 32768 bytes)
Debug: sleeping function called from invalid context at include/linux/rwsem.h:66in_atomic():1, irqs_disabled():1
Call Trace:
 [<c012a40f>] __might_sleep+0xa0/0xbd
 [<c02d109f>] cpufreq_register_notifier+0x2e/0x8e
 [<c0107000>] rest_init+0x0/0xf4
 [<c042d169>] init_tsc+0x4c/0x167
 [<c0107000>] rest_init+0x0/0xf4
 [<c011bf40>] select_timer+0x31/0x51
 [<c0428a83>] time_init+0x50/0x62
 [<c0424699>] start_kernel+0x124/0x280
 [<c042444a>] unknown_bootoption+0x0/0xf8
 
Detected 1694.879 MHz processor.
Console: colour VGA+ 80x25




mvh,
A
-- 
Alexander Hoogerhuis                               | alexh@ihatent.com
CCNP - CCDP - MCNE - CCSE                          | +47 908 21 485
"You have zero privacy anyway. Get over it."  --Scott McNealy



----- End forwarded message -----

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 PCMCIA      - http://pcmcia.arm.linux.org.uk/
                 2.6 Serial core
