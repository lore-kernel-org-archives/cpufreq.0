From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: Sempron 2800+
Date: Tue, 12 Sep 2006 09:42:32 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A8430321907D@SAUSEXMB1.amd.com>
References: <ee6f7d$7hc$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <ee6f7d$7hc$1@sea.gmane.org>
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
Content-Type: text/plain; charset="us-ascii"
To: Arik Raffael Funke <arik.funke@gmx.de>, cpufreq@lists.linux.org.uk

> I am using kernel version 2.6.17.11 with built-in cpufreq=20
> support on a AMD Sempron 2800+. However, I do not have the=20
> directory /sys/devices/system/cpu/cpu0/cpufreq/
>=20
> Can anybody tell me why? Does my cpu not support cpufreq or=20
> have i forgotten to select some kernel modules/configuration?

What does `dmesg | grep powern` report?

I suspect that your Sempron doesn't have the bit enabled=20
that tells the driver it supports PowerNow!.  Thus, the
driver doesn't load.  I haven't had a chance to determine
if there's a large batch of Sempron 2800s that don't
support PN!, or if they just use a different bit to=20
indicate that support.

-Mark Langsdorf
AMD, Inc.
