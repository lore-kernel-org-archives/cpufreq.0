From: Dave Jones <davej@redhat.com>
Subject: Re: Which cpu-freq module to use for Intel(R) Xeon(R) CPU
Date: Mon, 18 Jun 2007 16:03:29 -0400
Message-ID: <20070618200329.GA13344@redhat.com>
References: <c583a31b0706181102x3c78a544he158c7fad49b29e8@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <c583a31b0706181102x3c78a544he158c7fad49b29e8@mail.gmail.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lei Yang <leiyang@google.com>
Cc: cpufreq@lists.linux.org.uk

On Mon, Jun 18, 2007 at 11:02:29AM -0700, Lei Yang wrote:
 > Dear list,
 > 
 > I'm a newbie on kernel cpu frequency scaling and I'm trying to get this work
 > on a Intel(R) Xeon(R) CPU workstation. The kernel version is 2.6.11.

There have been literally hundreds of changes to the cpufreq drivers
since 2.6.11.  I'll be surprised if anyone really remembers the quirks
of the various drivers in a > two year old kernel.

 > So far, I've looked into
 > /lib/modules/2.6.11/kernel/arch/x86_64/kernel/cpufreq and found four kernel
 > modules there: acpi-cpufreq.ko  powernow-k8.ko  speedstep-centrino.ko
 > speedstep-nocona.ko . However, when I tried to install them using modprobe,
 > they all reported an error like "FATAL: Module acpi_cpufreq.ko not found".
 > So please give me a hint on the right procedure to follow.

if your /proc/cpuinfo flags has 'est', then acpi-cpufreq is the way to
go, unless your BIOS doesn't have correct ACPI tables, in which case
speedstep-centrino is the answer.
In current kernels, speedstep-centrino is deprecated in favour of
acpi-cpufreq (and will disappear completely soon, possibly in .23)

 > Plus, I read from the kernel cpu-freq page on the supported hardware and
 > found that "Intel Pentium4/Xeon clock modulation (p4-clockmod)". Does this
 > mean that I need to install p4-clockmod for my workstation? Interestingly, I
 > also found on Dave Jones' page the following:
 > 
 > - P4 clock modulation. Note, that this driver does NOT save power. It
 > inserts 'waits' between clock cycles, so workloads take longer to complete,
 > but generate less heat whilst doing so.
 > 
 > I got confused, should I be using p4-clockmod or something else if I really
 > need to save power?

As my note reads, you'll be producing less overall heat, but as your workload
runs for a longer period, you're still using the same (possibly more)
amount of power.

	Dave

-- 
http://www.codemonkey.org.uk
