From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: ACPI / cpufreq on Presario R3120
Date: Thu, 3 Jun 2004 19:25:11 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040603172511.GG13782@poupinou.org>
References: <40BF3686.6030701@pacific.edu>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <40BF3686.6030701@pacific.edu>
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
To: Ken Hughes <khughes@pacific.edu>
Cc: Cpufreq@www.linux.org.uk

Hi,

On Thu, Jun 03, 2004 at 07:32:38AM -0700, Ken Hughes wrote:
> I've got a Presario with an AMD XP-M 3000+ CPU (a 32-bit K8).

You have a AMD64 ?

> I can't get the acpi or powernow-k8 modules to load on the
> 2.6.6 kernel;  loading acpi gives this message:
> 
>  > acpi_processor_perf-0301 [1219] acpi_cpufreq_cpu_init : Unsupported 
> address space [127, 127]
> 
> and powernow-k8 (with and without Pavel's patches) gives this:
> 
>  > powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 
> 1.20.08b - March 20, 2004)
>  > powernow-k8: Too many lo freq table entries
>  > powernow-k8: BIOS error - no PSB

Then it's AMD64, not an XP-M (or else powernow-k8 would not print
that it found a AMD64 or an Opteron I believe).

To be sure, what say /proc/cpuinfo ?

Going back to your problem, can you send to me an acpidmp output, or post a
link to it?

wget ftp://ftp.kernel.org//pub/linux/kernel/people/lenb/acpi/utils/pmtools-20031210.tar.bz2
tar xjvfp pmtools-20031210.tar.bz2
cd pmtools-20031210/acpidmp
make
sudo ./acpidmp > acpidmp.out
bzip2 acpidmp.out 

> I dumped the DSDT but it doesn't seem to have much info on the CPU.

This may be on another ACPI table, likely in SSDT.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
