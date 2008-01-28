From: Christian Krafft <krafft@de.ibm.com>
Subject: Re: [Cbe-oss-dev] Subject: cell: add spu aware cpufreq governor
Date: Mon, 28 Jan 2008 19:03:41 +0100
Message-ID: <20080128190341.21c8fc97@de.ibm.com>
References: <20080118171119.3faa4a6a@de.ibm.com>
	<200801192238.45636.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1948765514=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200801192238.45636.arnd@arndb.de>
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: cpufreq@lists.linux.org.uk, cbe-oss-dev@ozlabs.org

--===============1948765514==
Content-Type: multipart/signed; boundary="Sig_/YdLCBlWjpHy7tV8DeBrlHk7";
	protocol="application/pgp-signature"; micalg=PGP-SHA1

--Sig_/YdLCBlWjpHy7tV8DeBrlHk7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

first of all, sorry for the late answer.
Here are my comments:

On Sat, 19 Jan 2008 22:38:44 +0100
Arnd Bergmann <arnd@arndb.de> wrote:

> On Friday 18 January 2008, Christian Krafft wrote:
> > +#include <linux/cpufreq.h>
> > +#include <linux/sched.h>
> > +#include <linux/timer.h>
> > +#include <asm/atomic.h>
> > +#include <asm/machdep.h>
> > +#include <asm/spu.h>
> > +
> > +#include "asm/cell-regs.h"
> > +
> > +#define DEBUG		1
>=20
> You should have the '#define DEBUG' _before_ the #includes, otherwise pr_=
debug
> and friends don't do what you think they do.

sure, DEBUG should have been removed anyway.

> > +static void spu_gov_init_work(struct spu_gov_info_struct *info);
>=20
> Try to avoid forward declarations for static functions, instead reorder
> the functions in call order.

Forward declaration was not a good idea at all, cause multiple calls to the
init_work function seems a bit odd. Fixed with next version.

> > +static void spu_gov_timer(struct work_struct *work)
>=20
> 'timer' is a bad name for a work function, because it suggests
> you're working on a timer_list.

this was a relic from a timer based version, renamed.

> > +static void spu_gov_init_work(struct spu_gov_info_struct *info)
> > +{
> > +	int delay =3D usecs_to_jiffies(info->poll_int * 1000);
> > +	delay -=3D jiffies % delay;
> > +	INIT_DELAYED_WORK_DEFERRABLE(&info->work, spu_gov_timer);
> > +	queue_delayed_work_on(info->policy->cpu, kspugov_wq, &info->work,
> > delay); +}
>=20
> I think you shouldn't call INIT_DELAYED_WORK_DEFERRABLE() more than once.
> While I'm not sure if it's actually broken like you do it, it's certainly
> not how this interface was meant to be used.

fixed with the removal of that odd forward declaration

> What's the point of the computation, can't you just always queue the
> work to be run in info->poll_int miliseconds from the time you call it?

This code is from the ondemand governor. It should cause the timer to be
triggered at the same jiffy. As our polling intervall is much higher I guess
this makes no sense here -> removed.

It was also a stupid idea to use usecs_to_jiffies instead of msecs ;-)

> > +static void spu_gov_cancel_work(struct spu_gov_info_struct *info)
> > +{
> > +	cancel_delayed_work(&info->work);
> > +}
>=20
> Doesn't that need to be cancel_delayed_work_sync() for rearming work queu=
es?

Jep.

> > +static int __init spu_gov_init(void)
> > +{
> > +	if (!machine_is(cell))
> > +		return -ENODEV;
>=20
> This seems wrong, why would you only allow that on cell platforms,
> but e.g. not celleb or even ps3 (assuming they had a cpufreq
> backend)? I think the only dependency is on spufs being loaded and
> that should work using module dependencies.

Sure.
I added the dependency to CONFIG_SPUFS.
I also removed the dependency to CBE_CPUFREQ and replaced it by a select
CBE_CPUFREQ.

> > +	kspugov_wq =3D create_workqueue("kspugov");
> > +	if (!kspugov_wq) {
> > +		printk(KERN_ERR "creation of kspugov failed\n");
> > +		return -EFAULT;
> > +	}
> > +
> > +	return cpufreq_register_governor(&spu_governor);
> > +}
> > +
> > +static void __exit spu_gov_exit(void)
> > +{
> > +	cpufreq_unregister_governor(&spu_governor);
> > +	destroy_workqueue(kspugov_wq);
> > +}
>=20
> What happens when the work functions is called after unregistering?

This can not happen, as module can only be unloaded if the spu_gov_govern g=
ot
CPUFREQ_GOV_STOP for all cpus it has been started for. When getting
CPUFREQ_GOV_STOP the cancel_delayed_work_SYNC function gets called.
After spu_gov_govern processed the last CPUFREQ_GOV_STOP, no work function =
gets
called. I added a BUG_ON with a comment to make that clear.


Thanks for the review,
Hope next version is clean ...


--=20
Mit freundlichen Gruessen,
kind regards,

Christian Krafft
IBM Systems & Technology Group,
Linux Kernel Development
IT Specialist


Vorsitzender des Aufsichtsrats:	Martin Jetter
Geschaeftsfuehrung:		Herbert Kircher
Sitz der Gesellschaft:		Boeblingen
Registriergericht:		Amtsgericht Stuttgart, HRB 243294

--Sig_/YdLCBlWjpHy7tV8DeBrlHk7
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.7 (GNU/Linux)

iD8DBQFHnhkJ6rqK4qDx+dcRAlccAJ4pP1ucYjihUNpcvoCCz0AjAjJlCwCgn78g
w3gJVIqUcEoEhFwc4Tc1Iw0=
=PNVp
-----END PGP SIGNATURE-----

--Sig_/YdLCBlWjpHy7tV8DeBrlHk7--


--===============1948765514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1948765514==--

