From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: 2.6.11 cpufreq: Device or resource busy
Date: Tue, 8 Mar 2005 23:28:36 +0100
Message-ID: <20050308222836.GA19920@isilmar.linta.de>
References: <20050308222516.GA20370@carfax.org.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050308222516.GA20370@carfax.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hugo Mills <hugo-lkml@carfax.org.uk>, davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk

On Tue, Mar 08, 2005 at 10:25:16PM +0000, Hugo Mills wrote:
>    I've just upgraded my laptop (ASUS M3000 -- see below) from 2.6.10
> to 2.6.11. It now seems to be unable to load the acpi_cpufreq module:
> 
> hrm@joshua:hrm $ sudo modprobe acpi-cpufreq
> FATAL: Error inserting acpi_cpufreq (/lib/modules/2.6.11-plain/kernel/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.ko): Device or resource busy

Possibly there is already speedstep-centrino up and running? Is there a
/sys/devices/system/cpu/cpu0/cpufreq/ directory?

	Dominik
