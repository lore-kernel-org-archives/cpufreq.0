From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: Re: [PATCH] AMD Elan SC520 cpufreq driver
Date: Mon, 04 Apr 2005 01:53:04 +0200
Message-ID: <425081E0.6070205@tremplin-utc.net>
References: <20050329213658.GA12868@levin.pad.mess.org>	<20050329220432.GA4018@isilmar.linta.de>
	<20050403162700.GA21169@levin.pad.mess.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20050403162700.GA21169@levin.pad.mess.org>
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
To: Sean Young <sean@mess.org>
Cc: cpufreq@zenii.linux.org.uk, Dominik Brodowski <linux@dominikbrodowski.net>

Sean Young a =E9crit :
> -	policy->cpuinfo.transition_latency =3D CPUFREQ_ETERNAL;
> +	policy->cpuinfo.transition_latency =3D 1000; /* 1ms */

transition_latency is expressed in nanoseconds, so it should be 1000000.
I guess the confusion comes from cpufreq.h, where there are two comments=20
about it, one saying it's nanosecond, another one (older) saying it's=20
microseconds. Dominik, maybe this typo should be fixed, do you want me=20
to send a patch?

Eric
