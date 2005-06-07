From: "Devriendt, Paul" <paul.devriendt@amd.com>
Subject: RE: powernow-k8 and stuck change-pending bit
Date: Tue, 7 Jun 2005 00:07:22 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A843028F4CC5@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: John Belmonte <john@neggie.net>, cpufreq@lists.linux.org.uk

> symptoms:
>=20
>     After working fine for a while (several minutes to several hours),
> cpufreq seems to get into a bad state where:
>=20
>      * change pending bit set / stuck kernel messages appear
>=20
>      * reloading powernow-k8 module fails, with "change=20
> pending bit stuck"

I have seen a very small number of reports of this over the past
couple of years. Perhaps 3 or 4. I can tell you what is happening, but
it may not be much help.

The processor has to communicate externally during a frequency or
a voltage change. On a frequency change, all devices on the=20
HyperTransport fabric will see a LDT_STOP. On a voltage change, the=20
new vid (voltage code) has to be driven out to the external VRM=20
(voltage regulator module) which actually supplies the correct=20
voltage. Obviously, this external activity takes a little while.

The software interface to this is via a register, and there is a bit
to warn the software that a change is in progress. This is the pending=20
bit. A change should never fail to complete. It can fail if the change
request was invalid, but it should not fail to complete.

The driver is written to timeout (i.e. not hang the system) if the
pending bit should ever fail to clear.

It is also written to never attempt to make a change if the pending
bit is set.

This is what you are seeing. A transition was attempted, it never
completed, and the driver is not happy about it.

The most likely scenario here is the VRM was unable to change
voltage, and that means flaky hardware as it has previously been
able to successfully do so. The reason I pick on the VRM and not
some sort of issue with the HyperTransport fabric is that it is
unlikely anything would still be alive if there was some sort of=20
problem coming back from the LDT_STOP.

Assuming the VRM continues to supply the current voltage within=20
spec, the system will stay up indefinitely, at the current
voltage and frequency.

The best path to follow would be to investigate warrantee replacement
of the board.

Paul.
