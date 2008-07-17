From: Thomas Renninger <trenn@suse.de>
Subject: Re: Core 2 Duo E8400 stepping 6 not recognised
Date: Thu, 17 Jul 2008 14:44:25 +0200
Message-ID: <200807171444.26396.trenn@suse.de>
References: <20080717001145.122c97b7.ldarby@tuffmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20080717001145.122c97b7.ldarby@tuffmail.com>
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
To: cpufreq@lists.linux.org.uk

Hi,

sorry this is a bit unrelated...

On Thursday 17 July 2008 01:11:45 Laurence Darby wrote:
> Hi,
>
> I booted linux 2.6.26 with cpufreq.debug=3, and it gives the following:
>
> [    0.391292] cpufreq-core: CPU 0: _PPC is 0 - frequency not limited
> [    0.391623] ACPI: ACPI0007:00 is registered as cooling_device0
> [    0.391623] ACPI: Processor [CPU0] (supports 8 throttling states)
> [    0.391623] cpufreq-core: CPU 1: _PPC is 0 - frequency not limited
> [    0.391292] ACPI: ACPI0007:01 is registered as cooling_device1
> [    0.391292] ACPI: Processor [CPU1] (supports 8 throttling states)

Wow, _PPC is evaluated before cpufreq is activated even the initial _PPC call 
got removed some time ago.
This could be related to the ThinkPads get stuck on lowest freq problem.
Ingo Molnar already sent something similar, but did not fully ensure that _PPC 
is only called after cpufreq has been initialized:
git commit e4233dec749a3519069d9390561b5636a75c7579
I send something to the related bug...

> [    8.228001] acpi-cpufreq: acpi_cpufreq_init
> [    8.228001] acpi-cpufreq: acpi_cpufreq_early_init
_PPC should not be called before these...

       Thomas
