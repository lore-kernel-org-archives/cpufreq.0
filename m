From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: Re: [PATCH] (1/3) cpufreq_ondemand - 01_ignore-nice.diff
Date: Mon, 21 Feb 2005 13:58:34 +0100
Message-ID: <4219DAFA.2040103@tremplin-utc.net>
References: <20050220131518.GB4495@inskipp>
	<4218B768.8020401@tremplin-utc.net>	<4219B603.8050403@tremplin-utc.net>
	<20050221102756.GA4404@inskipp>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20050221102756.GA4404@inskipp>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Alexander Clouter <alex@digriz.org.uk>
Cc: davej@redhat.com, cpufreq@zenii.linux.org.uk, linux@dominikbrodowski.de

Alexander Clouter a =C3=A9crit :
> On Feb 21, Eric Piel wrote:
>=20
>>Here is the patch, it does exactly the same functionality but it's=20
>>completly static and therefore much smaller. Just tested on my computer=
,=20
>>it does the trick.
>>
>=20
> I'm happy for this to go ahead as I will want it on always by default,=20
> however you pretty much kill the folk who prefer to 'nice' tasks to pre=
vent=20
> interuption to other applications rather than using it to say "I do not=
 care=20
> how long this task takes".
>=20
> I know on our proxy server there are a few rebuilds which we run at a n=
ice'd
> level, not because we do not care how long they take (we want the rebui=
lds to
> finish as soon as possible) but rather so that squid's performance is n=
ot
> affected.
>=20
That's very unusual cases. You cannot take care of all unusual case with=20
a governor that tries to be as simple as possible. Probably in the case=20
you cite either you want to use a userspace governor which can be much=20
more complex and sofisticated or maybe just:
renice -5 $(pidof) squid

Eric
