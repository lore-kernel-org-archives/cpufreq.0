From: Ian McConnell <ian@emit.demon.co.uk>
Subject: Re: longhaul gives /proc/sys/cpu/0/speed-m{in,max} = 0
Date: Fri, 02 Jan 2004 16:33:49 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <87znd6l382.fsf@emit.demon.co.uk>
References: <87n09aa0j2.fsf@emit.demon.co.uk>
	<20040101185556.3354db6e.frx@firenze.linux.it>
Reply-To: Ian McConnell <ian@emit.demon.co.uk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20040101185556.3354db6e.frx@firenze.linux.it> (Francesco
	Poli's message of "Thu, 1 Jan 2004 18:55:56 +0100")
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
To: CpuFreq <cpufreq@www.linux.org.uk>

Francesco Poli <frx@firenze.linux.it> writes:

> On Tue, 30 Dec 2003 13:38:25 +0000 Ian McConnell wrote:
>
>> Is this right? speed-min and speed-max are both zero so I can't use
>> any of the userspace speed throttling programs such as cpuspeed-1.1.
>
> With 2.4.x kernels, I think you must set the `userspace' governor in
> order to have the CPU clock frequency (and voltage) assigned by a
> userspace process: issue the following command (as root)
>
>     # echo -n "0%0%100%userspace" > /proc/cpufreq
>
> and then you should be able to enjoy cpuspeed or whatever...

Aha, that was the piece of information I was missing.

$ cat /proc/cpufreq 
          minimum CPU frequency  -  maximum CPU frequency  -  policy
CPU  0          399 kHz ( 50 %)  -        798 kHz (100 %)  -  userspace
$ cat /proc/sys/cpu/0/speed-min
399
$ cat /proc/sys/cpu/0/speed-max 
798
$ cat /proc/sys/cpu/0/speed     
798

which all seem good.

Unfortunately, I can't set anything
$ cat /proc/sys/cpu/0/speed-min > /proc/sys/cpu/0/speed
$ cat /proc/sys/cpu/0/speed
798

Even trying

$ echo -n "0%0%50%powersave" > /proc/cpufreq 
$  cat /proc/cpufreq 
          minimum CPU frequency  -  maximum CPU frequency  -  policy
CPU  0          399 kHz ( 50 %)  -        399 kHz ( 50 %)  -  powersave
$ cat /proc/sys/cpu/0/speed
798

$ x86info  -mhz
x86info v1.12b.  Dave Jones 2001-2003
Feedback to <davej@redhat.com>.

Found 1 CPU
--------------------------------------------------------------------------
Family: 6 Model: 7 Stepping: 8
CPU Model : VIA C3 (Samuel 2) [C5B]
800MHz processor (estimate).

I also tried "userspace" and "performance" without any change.


>> Also if /proc/sys/cpu/0/speed = 0, how do I tell what speed my machine
>> is running at?
>
> The following command
>
>     $ cat /proc/cpuinfo
>
> should show the actual CPU clock frequency (among the other things).

I don't think it does. If I remove longhaul.o and install
   http://www3.sympatico.ca/howlettfamily/epia/longhaul-1.2.tar.gz
    (which lets me change the speed, but doesn't give me
    /proc/sys/cpu/0/speed or a working speed governor) 

to change the speed, then /proc/cpuinfo doesn't change (though this may be a
bug in the longhaul-1.2 code)

$ cd longhaul; insmod ./longhaul.o
$ echo 0 > /proc/longhaul
$ cat /proc/longhaul
CPU 6.7.8 
CPU Speed: 399000
FSB: 133
CPU Mult:  30
Longhaul version: 2
Driver version: 1.2
last command: 0
                            7 6 5 4 3 2 1 0
MSR_VIA_LONGHAUL:        0x0000000b000001f0 
MSR_IA32_EBL_CR_POWERON: 0x00000000c0440000 
clock 0x0  399000
clock 0x1  465500
clock 0x2  532000
clock 0x3  598500
clock 0x4  665000
clock 0x5  731500
clock 0x6  798000

$ x86info  -mhz
x86info v1.12b.  Dave Jones 2001-2003
Feedback to <davej@redhat.com>.

Found 1 CPU
--------------------------------------------------------------------------
Family: 6 Model: 7 Stepping: 8
CPU Model : VIA C3 (Samuel 2) [C5B]
400MHz processor (estimate).

However
$ cat  /proc/cpuinfo 
processor       : 0
vendor_id       : CentaurHauls
cpu family      : 6
model           : 7
model name      : VIA Ezra
stepping        : 8
cpu MHz         : 800.047
cache size      : 64 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu de tsc msr cx8 mtrr pge mmx 3dnow
bogomips        : 1595.80
