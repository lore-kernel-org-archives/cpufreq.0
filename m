From: "shin, jacob" <jacob.shin@amd.com>
Subject: RE: [PATCH] 2/2 fix driver removal code to clean up all
 governors
Date: Mon, 21 Nov 2005 11:48:05 -0600
Message-ID: <B3870AD84389624BAF87A3C7B831499302935310@SAUSEXMB2.amd.com>
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
To: Dave Jones <davej@redhat.com>, "Langsdorf, Mark" <mark.langsdorf@amd.com>
Cc: cpufreq@lists.linux.org.uk

oops sorry about that.. will create patches for -p1 in the future.

when running on SMP setup, powernow-k8 as module:
- we unload powernow-k8 module,
- powernow calls cpufreq_unregister_driver
- which calls cpufreq_remove_device per cpu
- cpu0 will CPUFREQ_GOV_STOP and set cpufreq_driver->target =3D NULL
- cpu1.. and all following cpus will see NULL and not call =
CPUFREQ_GOV_STOP

result is that we have module dependancy left over in lsmod.  which is =
not critical when running trivial governors that doesn't DECLARE_WORK.

however, when running with cpufreq_ondemand governor, which does =
DECLARE_WORK, the work scheduled is not destroyed properly, because of =
the left over module dependancies, and kernel goes kaboom.

this is actually fixed already in the latest 2.6.15 rc (probably =
indirectly) by Ashok Raj getting cpufreq to work w/ cpu hotplug:

http://kernel.org/git/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3Dco=
mmit;h=3Dc32b6b8e524d2c337767d312814484d9289550cf

so I think we're good here.

-Jacob Shin
AMD, Inc.

On Monday, November 21, 2005 9:36 AM Dave Jones wrote:
> On Thu, Nov 10, 2005 at 04:53:57PM -0600, Langsdorf, Mark wrote:
>  > This patch fixes a bug that causes a segfault when the
>  > powernow-k8 driver is removed while the ondemand  > governor is =
running.
>  >
>  > Signed-off-by: Jacob Shin <jacob.shin@amd.com>
>  > Signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>
>=20
> Can you elaborate on this one a little ?
>=20
> (Also: Please make your patches so that they apply with -p1
>  I fixed up the other one by hand adding in the full pathname,
>  but I'm far too lazy to do that for every patch :-)
>=20
> 		Dave
