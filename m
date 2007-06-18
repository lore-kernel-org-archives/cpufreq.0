From: "Lei Yang" <leiyang@google.com>
Subject: Which cpu-freq module to use for Intel(R) Xeon(R) CPU
Date: Mon, 18 Jun 2007 11:02:29 -0700
Message-ID: <c583a31b0706181102x3c78a544he158c7fad49b29e8@mail.gmail.com>
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

Dear list,

I'm a newbie on kernel cpu frequency scaling and I'm trying to get this work
on a Intel(R) Xeon(R) CPU workstation. The kernel version is 2.6.11.

So far, I've looked into
/lib/modules/2.6.11/kernel/arch/x86_64/kernel/cpufreq and found four kernel
modules there: acpi-cpufreq.ko  powernow-k8.ko  speedstep-centrino.ko
speedstep-nocona.ko . However, when I tried to install them using modprobe,
they all reported an error like "FATAL: Module acpi_cpufreq.ko not found".
So please give me a hint on the right procedure to follow.

Plus, I read from the kernel cpu-freq page on the supported hardware and
found that "Intel Pentium4/Xeon clock modulation (p4-clockmod)". Does this
mean that I need to install p4-clockmod for my workstation? Interestingly, I
also found on Dave Jones' page the following:

- P4 clock modulation. Note, that this driver does NOT save power. It
inserts 'waits' between clock cycles, so workloads take longer to complete,
but generate less heat whilst doing so.

I got confused, should I be using p4-clockmod or something else if I really
need to save power?

Thanks a lot!!!

Lei
