From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Mobile Celeron with Speedstep ? - speedstep-centrino freezes
	machine
Date: Tue, 21 Sep 2004 18:33:57 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040921163357.GA8593@dominikbrodowski.de>
References: <414EDDF1.90506@renninger.de>
	<20040920170957.GC7952@dominikbrodowski.de>
	<41504EE9.6000403@renninger.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <41504EE9.6000403@renninger.de>
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
To: Thomas Renninger <mail@renninger.de>
Cc: cpufreq@www.linux.org.uk

On Tue, Sep 21, 2004 at 05:55:21PM +0200, Thomas Renninger wrote:
> modprobe cpufreq_acpi_pdump
> FATAL: Error inserting cpufreq_acpi_pdump 
> (/lib/modules/2.6.8-7-default/kernel/drivers/acpi/cpufreq-acpi_pdump.ko): 
> Input/output error
> ibm9:/usr/src/linux/arch/i386/kernel/cpu/cpufreq #
> 
> -> Freeze.
> Anyone an idea what exactly could cause the freeze, or how to analyse it?

Do I understand it correctly that the system freezes _after_ modprobing
cpufreq_acpi_pdump fails??? The -EIO result itself isn't strange, it means
the call to acpi_processor_register_performance() failed which happens on
several systems.

	Dominik
