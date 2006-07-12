From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: [discuss] Re: [PATCH] Allow all Opteron processors to
 change pstate at same time
Date: Wed, 12 Jul 2006 11:14:27 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A84303218EB7@SAUSEXMB1.amd.com>
References: <B3870AD84389624BAF87A3C7B831499302935A76@SAUSEXMB2.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <B3870AD84389624BAF87A3C7B831499302935A76@SAUSEXMB2.amd.com>
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
To: "shin, jacob" <jacob.shin@amd.com>, "Deguara, Joachim" <joachim.deguara@amd.com>, Andi Kleen <ak@suse.de>
Cc: discuss@x86-64.org, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

> > Here are the further findings after letting the machine=20
> toggle between
> > 1GHz and 2.2Ghz every two seconds for roughly 24 hours. =20
> Unfortunately
> > there is an oops after bringing CPU2 online and CPU3 will not come
> > online.  Still the differences in TSC are not bad:
>=20
> Can I get more information on how to reproduce the Oops?=20
> Kernel version?
> .config? your hardware?
>=20
> I have run basic set of CPU Hotplug on/offline tests, and I could not
> reproduce it..

There's probably something in my patch that is causing it.
Are you testing with that?

Joachim -

Have you had a chance to measure TSC drift without=20
PN?  I'd like to know if the patch is making the problem
worse or not.

-Mark Langsdorf
AMD, Inc.
