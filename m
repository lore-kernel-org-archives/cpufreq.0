From: Robert Vollmert <rvollmert@gmx.net>
Subject: oops when inserting 'acpi' on 2.6.0-test5
Date: Thu, 18 Sep 2003 10:57:29 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030918085729.GA2653@krikkit>
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

Hello,

apopologies if this has been discussed here, but I wasn't able to read
the archive due to not being subscribed.

When inserting the 'acpi' cpufreq module, I get a reproducible oops.
This is on an Asus M2400N (Pentium M 1300).

In the cases I tested, the normal ACPI modules (processor, battery,
...) were loaded. If it matters, I use a slightly modified DSDT from
http://acpi.sf.net/dsdt/.

The speedstep-centrino module seems to work flawlessly. It wasn't
loaded when I tried inserting acpi.

Also, on kernel 2.4.22 with the current ACPI patch,
/proc/acpi/processor/CPU1/performance exists and shows sensible
information, though I don't know whether it actually does anything.

The included oops was run through ksymoops, though that doesn't seem
to work too well with current kernels. I hope it helps anyway. If
there's any more info you'd like, let me know.

Please CC: me on replies.

Cheers
Robert


logged right before oops (similar to output of /proc/.../performance
on 2.4):

cpufreq: CPU1 - ACPI performance management activated.
cpufreq: *P0: 1300 MHz, 26000 mW, 10 uS
cpufreq:  P1: 1300 MHz, 26000 mW, 10 uS
cpufreq:  P2: 1300 MHz, 26000 mW, 10 uS
cpufreq:  P3: 1300 MHz, 26000 mW, 10 uS
cpufreq:  P4: 1300 MHz, 26000 mW, 10 uS
cpufreq:  P5: 1300 MHz, 26000 mW, 10 uS
cpufreq:  P6: 1200 MHz, 24000 mW, 10 uS
cpufreq:  P7: 1000 MHz, 20000 mW, 10 uS

oops:

ksymoops 2.4.9 on i686 2.6.0-test5.  Options used
     -V (default)
     -k /proc/kallsyms (specified)
     -l /proc/modules (default)
     -o /lib/modules/2.6.0-test5/ (default)
     -m /boot/System.map-2.6.0-test5 (default)

Warning (read_ksyms): no kernel symbols in ksyms, is /proc/kallsyms a valid ksyms file?
No modules in ksyms, skipping objects
No ksyms, skipping lsmod
Unable to handle kernel NULL pointer dereference at virtual address 0000019c
d0198489
*pde = 00000000
Oops: 0000 [#1]
CPU:    0
EIP:    0060:[<d0198489>]    Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010286
eax: 00000008   ebx: ce8ca400   ecx: 00000000   edx: ce113ecc
esi: 000003e8   edi: ce113ecc   ebp: ce366e94   esp: ce113e58
ds: 007b   es: 007b   ss: 0068
Stack: ce366e94 00000014 c01d848b ce366e94 ce366e60 00000246 ce366e60 00000000 
       ce113ecc ce366e94 c023b999 ce113ecc ce366e64 0000000c ce366e84 ce366e60 
       00000000 ce112000 ce366e94 c023b184 ce113ecc c02b09f6 00000014 ce366e84 
Call Trace:
 [<c01d848b>] create_dir+0x3b/0x50
 [<c023b999>] cpufreq_set_policy+0x69/0x1c0
 [<c023b184>] cpufreq_add_dev+0x194/0x2b0
 [<c01f7d9b>] acpi_ut_update_ref_count+0x44/0x54
 [<c01f7e9a>] acpi_ut_update_object_reference+0xef/0x12d
 [<d005c510>] acpi_processor_get_platform_limit+0x27/0x4c [processor]
 [<c0213975>] sysdev_driver_register+0x95/0xf0
 [<c023bcec>] cpufreq_register_driver+0x7c/0xa0
 [<d009d108>] acpi_cpufreq_init+0x108/0x1b3 [acpi]
 [<c0136cb9>] sys_init_module+0x119/0x230
 [<c010b3cb>] syscall_call+0x7/0xb
Code: 8b 80 94 01 00 00 89 14 24 8d 84 c3 90 01 00 00 89 44 24 04 


>>EIP; d0198489 <_end+fe328a9/3fc98420>   <=====

>>ebx; ce8ca400 <_end+e564820/3fc98420>
>>edx; ce113ecc <_end+ddae2ec/3fc98420>
>>edi; ce113ecc <_end+ddae2ec/3fc98420>
>>ebp; ce366e94 <_end+e0012b4/3fc98420>
>>esp; ce113e58 <_end+ddae278/3fc98420>

Trace; c01d848b <create_dir+3b/50>
Trace; c023b999 <cpufreq_set_policy+69/1c0>
Trace; c023b184 <cpufreq_add_dev+194/2b0>
Trace; c01f7d9b <acpi_ut_update_ref_count+44/54>
Trace; c01f7e9a <acpi_ut_update_object_reference+ef/12d>
Trace; d005c510 <_end+fcf6930/3fc98420>
Trace; c0213975 <sysdev_driver_register+95/f0>
Trace; c023bcec <cpufreq_register_driver+7c/a0>
Trace; d009d108 <_end+fd37528/3fc98420>
Trace; c0136cb9 <sys_init_module+119/230>
Trace; c010b3cb <syscall_call+7/b>

Code;  d0198489 <_end+fe328a9/3fc98420>
00000000 <_EIP>:
Code;  d0198489 <_end+fe328a9/3fc98420>   <=====
   0:   8b 80 94 01 00 00         mov    0x194(%eax),%eax   <=====
Code;  d019848f <_end+fe328af/3fc98420>
   6:   89 14 24                  mov    %edx,(%esp,1)
Code;  d0198492 <_end+fe328b2/3fc98420>
   9:   8d 84 c3 90 01 00 00      lea    0x190(%ebx,%eax,8),%eax
Code;  d0198499 <_end+fe328b9/3fc98420>
  10:   89 44 24 04               mov    %eax,0x4(%esp,1)


1 warning issued.  Results may not be reliable.
