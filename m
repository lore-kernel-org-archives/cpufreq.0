From: Eduardo Gonzalez-Solares <eglez@ast.cam.ac.uk>
Subject: Cpufreq 2.4.22-pre6 & Pentium M
Date: Fri, 18 Jul 2003 22:09:37 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030718220937.09d2dc67.eglez@ast.cam.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: Jeremy Fitzhardinge <jeremy@goop.org>, Dominik Brodowski <linux@brodo.de>
Cc: cpufreq list <cpufreq@www.linux.org.uk>

Hi,

I downloaded the cpufreq patch from
http://www.codemonkey.org.uk/cpufreq/
against kernel 2.4.22-pre6. After compiling the kernel with Enhanced
Speedstep Support for the centrino I get next error when doing insmod:

Using
/lib/modules/2.4.22-pre6/kernel/arch/i386/kernel/speedstep-centrino.o/l
ib/modules/2.4.22-pre6/kernel/arch/i386/kernel/speedstep-centrino.o:
init_module: No such device 

Hint: insmod errors can be caused by
incorrect module parameters, including invalid IO or IRQ parameters.    
 You may find more information in syslog or the output from dmesg

Nothing in dmesg. It seems the problem is in:

       if (!cpu_has(cpu, X86_FEATURE_EST))
               return -ENODEV;

in the centrino_init function. If I remove those lines the
module loads, the processor is found:

speedstep-centrino: found "Intel(R) Pentium(R) M processor 1300MHz": max
frequency: 1300000kHz

and I can control the cpu speed.

Previous patches against kernel 2.4.21 worked ok.

Cheers,

	Eddie.

P.S. I am using a Dell D800 laptop with 1.3 MHz centrino in case that
matters.
