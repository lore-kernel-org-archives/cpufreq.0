From: Len Brown <lenb@kernel.org>
Subject: Re: Power mgmt / CPUFREQ on Via C7 (Esther)
Date: Wed, 3 Jan 2007 15:41:07 -0500
Message-ID: <200701031541.07754.lenb@kernel.org>
References: <14588.195.215.10.251.1167819741.squirrel@195.41.226.86>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <14588.195.215.10.251.1167819741.squirrel@195.41.226.86>
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk
Cc: jorgen@greven.dk

On Wednesday 03 January 2007 05:22, jorgen@greven.dk wrote:
> >On Tue, Jan 02, 2007 at 11:16:49PM +0100, jorgen at greven.dk wrote:
> 
> > > # dmesg
> > > acpi_cpufreq: disagrees about version of symbol
> acpi_processor_notify_smm acpi_cpufreq: Unknown symbol
> acpi_processor_notify_smm

acpi_processor_notify_smm should get built into the processor module --
assuming CONFIG_ACPI and CONFIG_CPU_FREQ are enabled.

did you do a "make oldconfig" before building?
what do you see running
grep ACPI .config
grep CPU_FREQ .config

-Len
