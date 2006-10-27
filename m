From: "Miroslav Vasic" <miroslav.vasic@gmail.com>
Subject: Problem with CPU frequency and booting from the FLASH
Date: Fri, 27 Oct 2006 14:28:24 +0200
Message-ID: <b6cb966c0610270528x55e43dd7k3931f148d8bcd3de@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

Hi everyone.

Few months ago I got evaluation version of RT Linux (from FSMLabs) for the
Viper board I have (the board  has Xscale PXA255) . I managed to boot the RT
Linux via Network File System and to make several little applications, which
were functioning without any problem. Each one of them was working with
different CPU clock values, because I made a thread which was changing CPU
clock from time to time in order to see how does it make influence on idle
times of micro. After that, I tried to boot the RT Linux via flash and it
works, but not the way I expected. If I enter in the RedBoot and set the CPU
clock to 133MHz (clock -l 36 -m 1 -n 10) it will not run. To be more exact,
it will not run each time when the Memory clock is different from 99 MHz (It
boots with l=27, m=1/2/4, n=1, any other combination with l=36/45 doesn't
work). The problem is that the File System can not be mounted (I can see
that message on my screen), and it is the consequence of an earlier error,
the RedBoot partition table can not be detected. Following is the output of
command fis list (to show Flash Image System), part of the output messages
when RT Linux boots correctly, and the messages I receive when RT Linux does
not boot.

RedBoot> fis list
Name              FLASH addr  Mem addr    Length      Entry point
FIS directory     0x00000000  0x00000000  0x0001F000  0x00000000
RedBoot config    0x0001F000  0x0001F000  0x00001000  0x00000000
filesystem        0x00020000  0x00400000  0x01FE0000  0x00400000

Probing VIPER flash device at physical address 0x04000000
Probing flash at physical address 0x04000000
flash: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
cmdlinepart partition parsing not available
Searching for RedBoot partition table in flash at offset 0x0
3 RedBoot partitions found on MTD device flash
Creating 3 MTD partitions on "flash":
0x00000000-0x0001f000 : "FIS directory"
0x0001f000-0x00020000 : "RedBoot config"
0x00020000-0x02000000 : "filesystem"
i2c /dev entries driver
...
VFS: Mounted root (jffs2 filesystem).

Probing VIPER flash device at physical address 0x04000000
Probing flash at physical address 0x04000000
flash: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
cmdlinepart partition parsing not available
Searching for RedBoot partition table in flash at offset 0x0
No RedBoot partition table detected in flash
Using static partition definition
Creating 2 MTD partitions on "flash":
0x00000000-0x000a0000 : "kernel"
0x000a0000-0x02000000 : "filesystem"
i2c /dev entries driver
...
Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0)

When I want to boot Arcom's version of Linux, which I received with my
board, with different CPU clock speeds it works.
Do you, maybe know what could be the problem?
Do you know what part of the kernel is in charge for communication between
CPU and FLASH memory?
Maybe there is a bug in that part of the kernel I am trying to boot on the
Viper board. Do you know how does frequency change make influence to
communication between FLASH memory and CPU?
Code for frequency changes (you can find it in cpu-pxa.c, function
pxa_set_target) is the same in both kernels (RTLinux and Arcom's version of
kernel). Is there any other function which I should check because of the
side effects?

The problem can be seen in one more way. I boot the RT Linux, and then I
insert a module which changes the CPU frequency during initialization. If I
give a command: lsmod or rmmod I receive following message (this happens
only if the memory clock is changed to value different then 99MHz):

Node header CRC failed at 01908c68. But it must have been OK earlier.
Node was: { 1985, 2185, 00920002, 01122f52 }
Node totlen on flash (0x00920002) != totlen from node ref (0x000001d4)
Node header CRC failed at 01908684. But it must have been OK earlier.
Node was: { 19bf, 2185, 00a205e2, 772f0000 }
Node totlen on flash (0x00a205e2) != totlen from node ref (0x000005e4)
Node header CRC failed at 01907eb4. But it must have been OK earlier.
Node was: { 19bf, 2185, 018d07cd, 04290000 }
Node totlen on flash (0x018d07cd) != totlen from node ref (0x000007d0)
Node header CRC failed at 019075b0. But it must have been OK earlier.
Node was: { 1985, 2185, 00020802, 0173c773 }
Node totlen on flash (0x00020802) != totlen from node ref (0x00000904)
Node header CRC failed at 01906d80. But it must have been OK earlier.
Node was: { 1985, 2185, 00100800, 116e9d6e }
Node totlen on flash (0x00100800) != totlen from node ref (0x00000830)
jffs2_do_read_inode(): No data nodes found for ino #6192
-bash: lsmod: command not found

In cpu-pxa.c there is a function which has a task to start frequency change
(if I understand very well), pxa_set_target. In this function there is a
part of code which is written in assembly, see line below, and if I put this
part of code as a comment, my system "works" (I want to say, that I change
voltage, but I do not change frequency. System works with minimal frequency
of 99MHz) Because of that, I have doubts, that maybe this part is doing
something wrong, although I can not see what.

__asm__ __volatile__("                                  \
        ldr r4, [%1] ;  /* load MDREFR */                   \
        b   2f ;                                            \
        .align  5 ;                                         \
1:                                                          \
        str %4, [%1] ;          /* preset the MDREFR */     \
        mcr p14, 0, %2, c6, c0, 0 ; /* set CCLKCFG[FCS] */  \
        str %5, [%1] ;          /* postset the MDREFR */    \
                                                            \
        b   3f       ;                                      \
2:      b   1b       ;                                      \
3:      nop          ;                                      \

"

        : "=&r"
(unused)
        : "r" (&MDREFR), "r" (CCLKCFG_TURBO|CCLKCFG_FCS), "r" (ramstart), \
          "r" (preset_mdrefr), "r" (postset_mdrefr)
        : "r4", "r5");


Does anybody have idea what can be the problem?
Has anybody seen something similar?

Thanks in advance.

Miroslav Vasic
