From: "Grover, Andrew" <andrew.grover@intel.com>
Subject: RE: [ACPI] _PDC method in DSDT
Date: Mon, 23 Jun 2003 02:19:27 -0700
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <F760B14C9561B941B89469F59BA3A84725A303@orsmsx401.jf.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-admin@www.linux.org.uk>
content-class: urn:content-classes:message
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: David Moore <dcm@acm.org>
Cc: "Adachi, Kenichi" <adachi@rd.scei.sony.co.jp>, acpi-devel@lists.sourceforge.net, cpufreq@www.linux.org.uk

> From: David Moore [mailto:dcm@acm.org]=20
> My intention was not for processor.c and cpufreq to cooperate, but
> rather for processor.c to be able to control Enhanced Speedstep solely
> with P-states -- no cpufreq necessary.  Cpufreq is certainly=20
> useful for
> those systems not running the ACPI driver, but in the long=20
> run, ACPI and
> processor.c seem to be the right way to get maximum compatibility with
> many platforms.

> I only have two concerns:
> 1) If the processor is an AMD or a Transmeta, it looks like _PCT may
> also return FixedHardware registers for their respective power
> management systems.  Do we need to read cpuid to treat these cases
> differently in processor.c, or will the blind wrmsr() do the trick?

The spec intended FixedFunctionalHW registers to be an "escape hatch".
FFH means that while ACPI is used for perf state enumeration, the
transitions will be handled in a CPU-specific driver, not via methods
described in the ACPI spec. This division (use ACPI for enum, x for
control) isn't currently supported by cpufreq; ACPI either does both
enum and control, or neither.

It is not safe to assume the CPU-specific mechanism will be the same
across vendors, or even across models from the same vendor. Indeed, the
whole point of all this was so these mechanisms could be different, and
remain proprietary.

> 2) If this capability is open-source, do you personally have=20
> a conflict
> of interest between protecting the binary-only module vs.=20
> accepting the
> patch?

Response #1 (practical):
What patch? The patch you haven't written yet? That may or may not be
against files I maintain (as opposed to
arch/i386/kernel/cpu/cpufreq/acpi.c)?

Response #2 (philosophical):
Do you really think a maintainer really has any power? Or just
responsibility?

Regards -- Andy
