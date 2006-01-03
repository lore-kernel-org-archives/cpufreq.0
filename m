From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: returning from .target before sending CPUFREQ_POSTCHANGE
Date: Tue, 3 Jan 2006 10:01:29 -0600
Message-ID: <84EA05E2CA77634C82730353CBE3A84303218A47@SAUSEXMB1.amd.com>
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
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@www.linux.org.uk

> On Tue, Dec 20, 2005 at 12:26:33PM -0600, Langsdorf, Mark wrote:
> > Is it legal to return from a .target
> > call without sending out a the=20
> > CPUFREQ_POSTCHANGE event? =20
> >=20
> > I'm thinking about restructuring the
> > powernow-k8 driver so that instead of=20
> > busywaiting while polling the pending=20
> > bit, the driver sets up a periodic timer=20
> > poll mechanism to check the pending bit
> > and signals the CPUFREQ_POSTCHANGE
> > when the bit clears.
> >=20
> > This would return control of execution
> > to other programs a little faster, but
> > I'm not sure if it's legal.
>=20
> That sounds like a good idea, also for the acpi-cpufreq=20
> driver. However, I don't really like .target returning, as=20
> then the instance calling .target (userspace or governor) may=20
> call target yet again -- and we do not want to have an old=20
> transition hanging between PRE- and POSTCHANGE when the next=20
> one starts. So, what about putting the thread in ->target()=20
> to sleep until the poll mechanism wakes it up?

That sounds good to me.

It will be a few months before we push the code out.
I will be going on an extended vacation shortly and
I do not expect the code to be ready until after I
return in April.

-Mark Langsdorf
AMD, Inc.
