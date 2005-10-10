From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: Problem with Powernow-k8 - 2.6.13.3
Date: Mon, 10 Oct 2005 09:52:08 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A84303218846@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="iso-8859-1"
To: Andrea Ferrari <and_ferrari@virgilio.it>, cpufreq@lists.linux.org.uk

> Alle 15:11, sabato 8 ottobre 2005, Micha=B3 Pytasz ha scritto:
> > Hi,
> >
> > Hmmm... strange, is Your kernel config the same as before?
> > I have the same cpu and I don't seem  have this problem (powernow=20
> > works).
>=20
> Yes, 2.6.13.3 config, is the same that 2.6.12.4. With=20
> 2.6.12.4 powernow-k8 works with no problem. At boot i saw
> that the driver version is change. With 2.6.12.4 the version
> was 1.40 (it's right?) and now is 1.50.3.
>=20
> I attach my Kernel config.

That's weird.  There were some changes between 1.40 and 1.50,
but they were put into place to support future generations of
AMD processors.  Nothing in there should affect your system.

The PowerNow! driver depends rather heavily on the ACPI=20
subsystem, and I don't know how much that changed.

If you're willing to try an experiment, could you copy the
arch/i386/kernel/cpu/cpufreq/powernow-k8.c file from your=20
2.6.12.4 directory into the same 2.6.13.3 directory?  Then
recompile and reboot.  If it still doesn't work, it's an ACPI
or BIOS problem.  If it does work, it's a problem with the
driver.  Either way, tell me and I'll look into it more.

-Mark Langsdorf
K8 PowerNow! Maintainer
AMD, Inc.
