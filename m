From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: hid-core and cpufreq conflicts
Date: Sun, 16 May 2004 12:18:21 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040516101821.GA8762@dominikbrodowski.de>
References: <200405160201.38892.jeff@hagen.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200405160201.38892.jeff@hagen.org>
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
To: Jeff Hagen <jeff@hagen.org>
Cc: cpufreq@www.linux.org.uk, linux-usb-users@lists.sourceforge.net

Hi,

On Sun, May 16, 2004 at 02:01:38AM -0700, Jeff Hagen wrote:
> I have also noticed that the frequency of the processor will not scale below 
> 1196mhz (processor is a 2.0ghz P4 mobile) when ehci_hcd is loaded, but it 
> will scale all the way down to 130mhz when this module is not loaded...

If it's a P4 mobile, you should use either the acpi module or the
speedstep-ich module for frequency scaling, not p4-clockmod for frequency
throttling. Scaling down to 130Mhz sound strange anyway...

> Any ideas on what may be causing the problems?
p4clockmod may interfere with latencies as the CPU is stopped for short
periods of time. Maybe I should change arch/i386/kernel/cpu/cpufreq/Kconfig
to


config P4CLOCKMOD_ENABLE
bool "p4-clockmod"
	help
	Are you really sure you want to compile the p4-clockmod driver
	which in most cases does really nothing besides causing pain?

config P4CLOCKMOD_REALLY_ENABLE
bool "really p4-clockmod?"
depends on P4CLOCKMOD_ENABLE
	help
	Have you really thought about it?



	Dominik
