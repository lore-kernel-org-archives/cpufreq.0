From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: [PATCH] Dual-core support for Opteron Processors
Date: Mon, 7 Feb 2005 16:06:20 -0600
Message-ID: <84EA05E2CA77634C82730353CBE3A84301CFBC67@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@ZenII.linux.org.uk

> On Mon, Feb 07, 2005 at 03:44:40PM -0600, Langsdorf, Mark wrote:
> > I tried to send this in a few days ago, but I don't think
> > it made it.
>=20
> It didn't make it.
>=20
> +       pol->cpus =3D cpu_sharedcore_map[data->cpu];
>=20
> I'm sorry but I can't find cpu_sharedcore_map in linus' latest.
>
I'll sync with Andi K. on that.  He was planning to add but I
don't know if he's pushed the patch out yet.

-Mark Langsdorf
AMD, Inc.
