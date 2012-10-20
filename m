From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] cpufreq: return early from __cpufreq_driver_getavg()
Date: Sat, 20 Oct 2012 10:12:07 +0530
Message-ID: <CAKohponGwhC_zmk1Whq56vmZMvjcxXKiSpdvMk4ZU8z0Wa2TBw@mail.gmail.com>
References: <32e5bed743cc6cc4e614291a7080299f5f0d0933.1350677395.git.viresh.kumar@linaro.org>
	<2737823.2JYE7UmLRN@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1622903276656541722=="
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <2737823.2JYE7UmLRN-sKB8Sp2ER+y1GS7QM15AGw@public.gmane.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cpufreq-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pdsw-power-team-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org

--===============1622903276656541722==
Content-Type: multipart/alternative; boundary=e89a8f2353f523620604cc763ece

--e89a8f2353f523620604cc763ece
Content-Type: text/plain; charset=ISO-8859-1

On Oct 20, 2012 3:37 AM, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org> wrote:
>
> On Saturday 20 of October 2012 01:42:05 Viresh Kumar wrote:
> > There is no need to do cpufreq_get_cpu() and cpufreq_put_cpu() for
drivers that
> > don't support getavg() routine.
> >
> > Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> The patch doesn't seem to follow the changelog or the other way around.

Sorry if my log isn't clear enough.
But i could still see it matching the code :)

I have moved the check for drivers capabilities at the top
of routine, so that there is no need to call mentioned routines.

>
> Thanks,
> Rafael
>
>
> > ---
> >  drivers/cpufreq/cpufreq.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> > index 85df538..f552d5f 100644
> > --- a/drivers/cpufreq/cpufreq.c
> > +++ b/drivers/cpufreq/cpufreq.c
> > @@ -1511,12 +1511,14 @@ int __cpufreq_driver_getavg(struct
cpufreq_policy *policy, unsigned int cpu)
> >  {
> >       int ret = 0;
> >
> > +     if (!(cpu_online(cpu) && cpufreq_driver->getavg))
> > +             return 0;
> > +
> >       policy = cpufreq_cpu_get(policy->cpu);
> >       if (!policy)
> >               return -EINVAL;
> >
> > -     if (cpu_online(cpu) && cpufreq_driver->getavg)
> > -             ret = cpufreq_driver->getavg(policy, cpu);
> > +     ret = cpufreq_driver->getavg(policy, cpu);
> >
> >       cpufreq_cpu_put(policy);
> >       return ret;
> >
> --
> I speak only for myself.
> Rafael J. Wysocki, Intel Open Source Technology Center.

--e89a8f2353f523620604cc763ece
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p><br>
On Oct 20, 2012 3:37 AM, &quot;Rafael J. Wysocki&quot; &lt;<a href=3D"mailt=
o:rjw-KKrjLPT3xs0@public.gmane.org">rjw-KKrjLPT3xs0@public.gmane.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Saturday 20 of October 2012 01:42:05 Viresh Kumar wrote:<br>
&gt; &gt; There is no need to do cpufreq_get_cpu() and cpufreq_put_cpu() fo=
r drivers that<br>
&gt; &gt; don&#39;t support getavg() routine.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@li=
naro.org">viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>
&gt;<br>
&gt; The patch doesn&#39;t seem to follow the changelog or the other way ar=
ound.</p>
<p>Sorry if my log isn&#39;t clear enough.<br>
But i could still see it matching the code :)</p>
<p>I have moved the check for drivers capabilities at the top<br>
of routine, so that there is no need to call mentioned routines.</p>
<p>&gt;<br>
&gt; Thanks,<br>
&gt; Rafael<br>
&gt;<br>
&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =A0drivers/cpufreq/cpufreq.c | 6 ++++--<br>
&gt; &gt; =A01 file changed, 4 insertions(+), 2 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.=
c<br>
&gt; &gt; index 85df538..f552d5f 100644<br>
&gt; &gt; --- a/drivers/cpufreq/cpufreq.c<br>
&gt; &gt; +++ b/drivers/cpufreq/cpufreq.c<br>
&gt; &gt; @@ -1511,12 +1511,14 @@ int __cpufreq_driver_getavg(struct cpufre=
q_policy *policy, unsigned int cpu)<br>
&gt; &gt; =A0{<br>
&gt; &gt; =A0 =A0 =A0 int ret =3D 0;<br>
&gt; &gt;<br>
&gt; &gt; + =A0 =A0 if (!(cpu_online(cpu) &amp;&amp; cpufreq_driver-&gt;get=
avg))<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 return 0;<br>
&gt; &gt; +<br>
&gt; &gt; =A0 =A0 =A0 policy =3D cpufreq_cpu_get(policy-&gt;cpu);<br>
&gt; &gt; =A0 =A0 =A0 if (!policy)<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;<br>
&gt; &gt;<br>
&gt; &gt; - =A0 =A0 if (cpu_online(cpu) &amp;&amp; cpufreq_driver-&gt;getav=
g)<br>
&gt; &gt; - =A0 =A0 =A0 =A0 =A0 =A0 ret =3D cpufreq_driver-&gt;getavg(polic=
y, cpu);<br>
&gt; &gt; + =A0 =A0 ret =3D cpufreq_driver-&gt;getavg(policy, cpu);<br>
&gt; &gt;<br>
&gt; &gt; =A0 =A0 =A0 cpufreq_cpu_put(policy);<br>
&gt; &gt; =A0 =A0 =A0 return ret;<br>
&gt; &gt;<br>
&gt; --<br>
&gt; I speak only for myself.<br>
&gt; Rafael J. Wysocki, Intel Open Source Technology Center.<br>
</p>

--e89a8f2353f523620604cc763ece--


--===============1622903276656541722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linaro-dev mailing list
linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
http://lists.linaro.org/mailman/listinfo/linaro-dev

--===============1622903276656541722==--

