From: omv <omv@danhartman.org>
Subject: Re: 2.4 patch and powernow-k8
Date: Fri, 03 Dec 2004 12:50:33 -0800
Message-ID: <41B0D199.9000309@danhartman.org>
References: <41AF938B.4080204@danhartman.org>
	<20041203090955.GC9288@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20041203090955.GC9288@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@www.linux.org.uk

Dominik Brodowski wrote:

>On Thu, Dec 02, 2004 at 02:13:31PM -0800, omv wrote:
>  
>
>>arch/i386/kernel/kernel.o(.data+0x1d80): In function `trampoline_end':
>>: undefined reference to `local symbols in discarded section .text.exit'
>>make: *** [vmlinux] Error 1
>>[root@queue38 linux-2.4.28]#
>>    
>>
>
>Could you try out removing the "__devexit_p" in 
>static struct cpufreq_driver cpufreq_amd64_driver = {
>        .verify = powernowk8_verify,
>        .target = powernowk8_target,
>        .init = powernowk8_cpu_init,
>        .exit = __devexit_p(powernowk8_cpu_exit),
>        .get = powernowk8_get,
>, i.e. modifying the .exit line to
>	.exit = powernowk8_cpu_exit
>
>and remove the __devexit from
>static int __devexit powernowk8_cpu_exit (struct cpufreq_policy *pol)
>
>in powernow-k8.c
>
>Thanks,
>	Dominik
>  
>
Dominik,

My version (from CVS on sunday, i think)  looked a bit different - the 
first block didn't have the __devexit at all, and the second was static 
int __exit drc_cpu_exit.   I modified the second block to remove the _exit.

That appeared to do the trick - built fine.  It now looks like

static int drv_cpu_exit (struct cpufreq_policy *pol)
...

static struct cpufreq_driver cpufreq_amd64_driver = {
    .verify = drv_verify,
    .target = drv_target,
    .init = drv_cpu_init,
    .exit = drv_cpu_exit,
    .name = "powernow-k8"


Thanks - I really appreciate the help!  It was kinda annoying only 
having 90 minutes of battery life on the plane.

-dan
