From: "Grover, Andrew" <andrew.grover@intel.com>
Subject: RE: [ACPI] _PDC method in DSDT
Date: Mon, 23 Jun 2003 00:11:49 -0700
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <F760B14C9561B941B89469F59BA3A84725A301@orsmsx401.jf.intel.com>
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
To: David Moore <dcm@acm.org>, "Adachi, Kenichi" <adachi@rd.scei.sony.co.jp>
Cc: acpi-devel@lists.sourceforge.net, cpufreq@www.linux.org.uk

> From: David Moore [mailto:dcm@acm.org]=20
> Given this document, I think I have enough information now to patch
> processor.c to support Enhanced Speedstep on Pentium M for=20
> those BIOSes
> that have a correctly written _PDC method in the DSDT.  Would the
> maintainers of the ACPI driver be willing to accept such a patch?

I don't think so, at least not right now.

_PDC is used for the OS to indicate to the firmware (the AML) if it
supports native CPU perf transitions or not. If it does, then _PCT/_PSS
returns one thing, if it doesn't, _PCT/_PSS returns something else.
Typically, if _PDC is not called, the platform will indicate ACPI 2.0
CPU perf state support instead of native support.

However, since the recently added non-vendor-supported Pentium M cpufreq
driver uses hardcoded tables and cpuid instead of relying on ACPI for
this information anyways, adding _PDC support to processor.c would not
affect its behavior. If that driver were changed to use ACPI for
determining platform capabilities, like Windows and our released binary
driver do, then yes, adding _PDC support would be important.

Regards -- Andy

btw my understanding is that _PDC will be actually in the ACPI spec in
the near future.
