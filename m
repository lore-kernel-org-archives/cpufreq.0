From: Dave Jones <davej@redhat.com>
Subject: Re: post-OLS pending cpufreq patches
Date: Tue, 3 Aug 2004 14:37:24 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040803133724.GM12724@redhat.com>
References: <88056F38E9E48644A0F562A38C64FB600283BD34@scsmsx403.amr.corp.intel.com>
	<20040803124223.GB8574@dominikbrodowski.de>
	<20040803131729.GL12724@redhat.com>
	<20040803133010.GA9447@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040803133010.GA9447@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>, cpufreq@www.linux.org.uk

On Tue, Aug 03, 2004 at 03:30:10PM +0200, Dominik Brodowski wrote:
 > On Tue, Aug 03, 2004 at 02:17:29PM +0100, Dave Jones wrote:
 > > In file included from arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:25:
 > 
 >  #include <acpi/processor.h>
 > 
 > is only included around ~300, AFAICS [even in Venki's patch]... and if you 
 > move that above to line ~25 [but please only #ifdef'ed], you need to
 > 
 >  #include <linux/acpi.h>
 > 
 > first.
 > 
 > Could you try that out, please?

getting closer. just some missing defs introduced by this patch now.

  CC      arch/i386/kernel/cpu/cpufreq/speedstep-centrino.o
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c: In function `centrino_cpu_init_acpi':
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:348: error: `ACPI_PDC_EST_CAPABILITY_SMP' undeclared (first use in this function)
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:348: error: (Each undeclared identifier is reported only once
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:348: error: for each function it appears in.)
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c:348: error: `ACPI_PDC_EST_CAPABILITY_MSR' undeclared (first use in this function)
make[1]: *** [arch/i386/kernel/cpu/cpufreq/speedstep-centrino.o] Error 1
make: *** [arch/i386/kernel/cpu/cpufreq/speedstep-centrino.o] Error 2

		Dave
