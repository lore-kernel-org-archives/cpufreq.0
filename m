From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: kernel: acpi-cpufreq: Transition failed
Date: Sat, 5 Feb 2005 11:53:59 +0100
Message-ID: <20050205105359.GA7917@dominikbrodowski.de>
References: <200502021158.26890.clemenso@sbox.tugraz.at>
	<200502041126.58413.clemenso@sbox.tugraz.at>
	<20050204202734.GA8030@dominikbrodowski.de>
	<200502050925.11480.clemenso@sbox.tugraz.at>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200502050925.11480.clemenso@sbox.tugraz.at>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Clemens Orthacker <clemenso@sbox.tugraz.at>
Cc: cpufreq@lists.linux.org.uk

On Sat, Feb 05, 2005 at 09:25:11AM +0100, Clemens Orthacker wrote:
> Am Freitag, 4. Februar 2005 21:27 schrieb Dominik Brodowski:
> 
> > Did it work correctly when you used earlier kernels than 2.6.10? Even if
> > using powernowd?
> 
> Yes. At least there were no error messages. (2.6.9)

This is most interesting. There have been the following changes between
2.6.9 and 2.6.10 relating to the acpi-cpufreq module:

- [core,drivers] add cpumask_t cpus for better SMT or CPU groups handling
	=> this is non-HT, so unrelated

- [acpi-io] rename acpi.c to acpi-cpufreq.c
	=> this _can't_ do any harm

- [acpi-cpufreq] debug modifications and advancements
	=> I doubt this has any effect

- [acpi-cpufreq] fix x86_64 symlink breakage [Dave Jones]
	=> wrong architecture

- [acpi-perflib] disable SMM access to SpeedStep using ACPI-FADT pstate_cnt
	=> so this is what's left over.

Could you remove the line in arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
which states:
        acpi_processor_notify_smm(THIS_MODULE);
recompile, re-install, and re-test, please?

> > If speedstep-ich works, you should use that module instead --
> 
> I don't have a Intel chipset, so I thought I should use acpi-cpufreq.

That's correct.

	Dominik
