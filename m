From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] ondemand put processors at full speed at startup
Date: Thu, 16 Dec 2004 11:51:00 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB6003958FA6@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk


Looks good to me. Dave/Dominik: Can you please add this to your patch
queue.

Thanks,
Venki=20

>-----Original Message-----
>From: Bruno Ducrot [mailto:ducrot@poupinou.org]=20
>Sent: Thursday, December 16, 2004 2:54 AM
>To: Pallipadi, Venkatesh
>Cc: cpufreq@www.linux.org.uk
>Subject: [PATCH] ondemand put processors at full speed at startup
>
>Hi,
>
>dbs_timer_init() will schedule_work(&dbs_work) so that do_dbs_timer()
>is likely called very early at same time slice scheduler, and
>for each cpu, dbs_check_cpu(cpu) will be called, likely at the=20
>same time
>slice than dbs_timer_init().
>So far, we will get total_idle_ticks =3D=3D idle_ticks =3D=3D 0 =
unconditonaly,
>and the processor will be put at full speed even though it's not needed
>at startup.
>
>Signed-off-by: Bruno Ducrot <ducrot@poupinou.org>
>
> drivers/cpufreq/cpufreq_ondemand.c |    3 ++-
> 1 files changed, 2 insertions(+), 1 deletion(-)
>
>--- linux-2.6.10-rc3/drivers/cpufreq/cpufreq_ondemand.c=09
>2004/12/16 10:19:29	1.1
>+++ linux-2.6.10-rc3/drivers/cpufreq/cpufreq_ondemand.c=09
>2004/12/16 10:21:02
>@@ -359,7 +359,8 @@ static void do_dbs_timer(void *data)
> static inline void dbs_timer_init(void)
> {
> 	INIT_WORK(&dbs_work, do_dbs_timer, NULL);
>-	schedule_work(&dbs_work);
>+	schedule_delayed_work(&dbs_work,
>+		=09
>sampling_rate_in_HZ(dbs_tuners_ins.sampling_rate));
> 	return;
> }
>=20
>
>--=20
>Bruno Ducrot
>
>--  Which is worse:  ignorance or apathy?
>--  Don't know.  Don't care.
>
