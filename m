From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: Re: [PATCH] (1/3) cpufreq_ondemand - 01_ignore-nice.diff
Date: Sun, 20 Feb 2005 17:14:32 +0100
Message-ID: <4218B768.8020401@tremplin-utc.net>
References: <20050220131518.GB4495@inskipp>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20050220131518.GB4495@inskipp>
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
Cc: davej@redhat.com, cpufreq@zenii.linux.org.uk, alex-kernel@digriz.org.uk, linux@dominikbrodowski.de

Alexander Clouter a =C3=A9crit :
> Adds support to cpufreq_ondemand to ignore 'nice' cpu time
>=20
IMO, this policy should be has lightweight as possible. Why not making=20
this feature just hard-coded? Don't count the load that nice'd tasks do,=20
period!

It would make the patch 5 lines instead of 50. Every userspace deamon=20
have this feature enabled by default, so this is a very reasonable=20
trade-off.

Eric
