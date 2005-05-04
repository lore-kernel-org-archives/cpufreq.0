From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: [PATCH] dual-core powernow-k8
Date: Wed, 4 May 2005 11:53:48 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A84301CFBFD0@SAUSEXMB1.amd.com>
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
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@lists.linux.org.uk

> On Mon, May 02, 2005 at 02:23:41PM -0500, Langsdorf, Mark wrote:
> > Update the driver to version 1.40.0 and provide support
> > for dual-core processors.
>=20
> Looks good to me, though it'd be great if you could provide=20
> step-by-step patches in future (e.g. split up printk=20
> cleanups, adding feature and so on...). One small bit, though:

Will do.
=20
> +cpumask_t cpu_sharedcore_mask[NR_CPUS];
>=20
> can be static, AFAICS.

I'll add it to my copy.  Do you want me to resubmit?

-Mark Langsdorf
AMD, Inc.
