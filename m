From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Dell Latitude C400 - is this SpeedSetp capable?
Date: Wed, 14 Jul 2004 23:41:46 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040714214146.GA21128@dominikbrodowski.de>
References: <200407131212.17298.m.watts@eris.qinetiq.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200407131212.17298.m.watts@eris.qinetiq.com>
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
To: Mark Watts <m.watts@eris.qinetiq.com>
Cc: cpufreq@www.linux.org.uk

On Tue, Jul 13, 2004 at 12:12:17PM +0100, Mark Watts wrote:
> I do know that if I boot with no AC power it runs at ~800MHz, but plugging the 
> AC back in changes nothing.

'cause the Linux kernel doesn't do this automagically as it wants to stay
lean and mean, so you need an userspace tool [*] to monitor AC status and set
cpufreq accordingly.

> model name      : Intel(R) Pentium(R) III Mobile CPU      1200MHz

You should try out the following cpufreq drivers in the stated order, and
check whether /sys/devices/system/cpu/cpu0/cpufreq/ shows up, and -- if the
USERSPACE governor is selected -- whether echo'ing the two different speeds
into /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed does the desired
effects.

CONFIG_X86_SPEEDSTEP_ICH	speedstep-ich.ko
CONFIG_X86_ACPI_CPUFREQ		acpi.ko
CONFIG_X86_SPEEDSTEP_SMI	speedstep-smi.ko

	Dominik

[*] and there are many different tools available... though I won't state
any of them here as I don't know the details of any of them.
