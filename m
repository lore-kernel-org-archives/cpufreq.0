From: "Miles Lane" <miles.lane@gmail.com>
Subject: Re: 2.6.18-mm1 -- CPUFreq not working
Date: Fri, 29 Sep 2006 02:46:22 -0700
Message-ID: <a44ae5cd0609290246w646ad782h4078f59dcbd1ad14@mail.gmail.com>
References: <a44ae5cd0609261051i6dc03777l6646899624a62d5a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <a44ae5cd0609261051i6dc03777l6646899624a62d5a@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Morton <akpm@osdl.org>, LKML <linux-kernel@vger.kernel.org>, cpufreq@lists.linux.org.uk

> I am wondering whether the following warning indicates a problem that
> prevents CPUFreq from working, because no matter how I play with the
> CPUFreq kernel config options, I always get a message from the power
> management applet that CPUFreq isn't working.
> WARNING: arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.o - Section
> mismatch: reference to .init.data:sw_any_bug_dmi_table from .text
> between 'acpi_cpufreq_cpu_init' (at offset 0x360) and
> 'acpi_cpufreq_target'
> WARNING: arch/i386/kernel/cpu/cpufreq/speedstep-centrino.o - Section
> mismatch: reference to .init.text: from .data between
> 'sw_any_bug_dmi_table' (at offset 0x40) and 'models

With 2.6.18-git11, I still get this one:
WARNING: drivers/acpi/processor.o - Section mismatch: reference to
.init.data: from .text between 'acpi_processor_power_init' (at offset
0xf4f) and 'acpi_safe_halt'
