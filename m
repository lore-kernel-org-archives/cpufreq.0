From: Hilbert Mostert <hilbert.mostert@tadis.nl>
Subject: Re: Processor speed way above specs
Date: Sun, 12 Dec 2004 20:56:33 +0100
Message-ID: <200412122056.33929.hilbert.mostert@tadis.nl>
References: <200412102342.58060.hilbert.mostert@tadis.nl>
	<200412110019.04763.hilbert.mostert@tadis.nl>
	<20041212092823.GB9142@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20041212092823.GB9142@dominikbrodowski.de>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Hi,

It was running the acpi-cpufreq driver, I have fixed the problem yesterday by 
using an other driver which i found on the web yesterday, it was a driver for 
the intel pentium M 745 (1800MHz) and capped it at 1500, and i have also 
changed the voltages according to the specs from intel.

I'll try to compile a few kernels tomorrow and send you the output of the 
performance file.

Are there other reports of this with Intel Pentium M 715 chips?

-Hilbert 

The file performance does not exist on my system at this moment
On Sunday 12 December 2004 10:28, Dominik Brodowski wrote:
> Hi,
>
> Can you post the output of "/proc/acpi/processor/*/performance", please?
> Also, which is the driver you're using at the moment
> ("/sys/devices/system/cpu/cpu0/cpufreq/scaling_driver")?
>
>  Dominik
