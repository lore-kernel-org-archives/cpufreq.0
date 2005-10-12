From: Dave Jones <davej@redhat.com>
Subject: Re: Problem with Powernow-k8 - 2.6.13.3
Date: Tue, 11 Oct 2005 22:42:28 -0400
Message-ID: <20051012024228.GA25258@redhat.com>
References: <84EA05E2CA77634C82730353CBE3A84303218846@SAUSEXMB1.amd.com>
	<200510101916.41365.and_ferrari@virgilio.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200510101916.41365.and_ferrari@virgilio.it>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: Andrea Ferrari <and_ferrari@virgilio.it>
Cc: cpufreq@lists.linux.org.uk

On Mon, Oct 10, 2005 at 07:16:31PM +0200, Andrea Ferrari wrote:
 > Alle 16:52, luned=EC 10 ottobre 2005, Langsdorf, Mark ha scritto:
 >=20
 > > If you're willing to try an experiment, could you copy the
 > > arch/i386/kernel/cpu/cpufreq/powernow-k8.c file from your
 > > 2.6.12.4 directory into the same 2.6.13.3 directory?  Then
 > > recompile and reboot.  If it still doesn't work, it's an ACPI
 > > or BIOS problem.  If it does work, it's a problem with the
 > > driver.  Either way, tell me and I'll look into it more.
 >=20
 > I try it, but when i recompile 2.6.13.3, i have this error:
 >=20
 > arch/i386/kernel/cpu/cpufreq/powernow-k8.c: In function `check_supported=
_cpu':
 > arch/i386/kernel/cpu/cpufreq/powernow-k8.c:470: error: `CPUID_XMOD_REV_E=
'=20
 > undeclared (first use in this function)
 > arch/i386/kernel/cpu/cpufreq/powernow-k8.c:470: error: (Each undeclared =

 > identifier is reported only once
 > arch/i386/kernel/cpu/cpufreq/powernow-k8.c:470: error: for each function=
 it=20
 > appears in.)
 > make[3]: *** [arch/i386/kernel/cpu/cpufreq/powernow-k8.o] Error 1
 > make[2]: *** [arch/i386/kernel/cpu/cpufreq] Error 2
 > make[1]: *** [arch/i386/kernel/cpu] Error 2
 > make: *** [arch/i386/kernel] Error 2
 >=20
=20
You'll need to copy arch/i386/kernel/cpu/cpufreq/powernow-k8.h too.

		Dave
