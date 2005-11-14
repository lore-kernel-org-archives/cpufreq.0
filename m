From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: kernel hang powernow-k8 SMP
Date: Mon, 14 Nov 2005 11:20:48 -0600
Message-ID: <84EA05E2CA77634C82730353CBE3A8430321892F@SAUSEXMB1.amd.com>
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@mnlist.ml1.net, cpufreq@lists.linux.org.uk

> Irrespective of which govenor I run my system is locking up. =20
> I've seen a few general protection faults.  It locks even
> with the userspace govenor and an attempted manual frequency change.
>=20
> The problens cease when I recompile without SMP, however, this is not=20
> really a solution.
>=20
> I'm not a developer, and was hoping someone would be able to help me=20
> debug this.  I'm running 64 bit Gentoo 2.614 kernel

I'm the powernow-k8 maintainer, and I'd be happy to look into
this.  First off, could you send me the output of the dmesg
command immediately after the machine boots?  That would help
a lot.

-Mark Langsdorf
AMD, Inc.
