From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: Re: [PATCH] (1/3) cpufreq_ondemand - 01_ignore-nice.diff
Date: Mon, 21 Feb 2005 14:31:51 +0100
Message-ID: <4219E2C7.1050505@tremplin-utc.net>
References: <20050220131518.GB4495@inskipp> <4218B768.8020401@tremplin-utc.net>
	<20050221105055.GD15599@message-id.gmane0305.slipkontur.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20050221105055.GD15599@message-id.gmane0305.slipkontur.de>
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
To: Stefan Seyfried <seife@gmane0305.slipkontur.de>
Cc: cpufreq@zenii.linux.org.uk

Stefan Seyfried a =C3=A9crit :
> On Sun, Feb 20, 2005 at 05:14:32PM +0100, Eric Piel wrote:
> =20
>=20
>>It would make the patch 5 lines instead of 50. Every userspace deamon=20
>>have this feature enabled by default, so this is a very reasonable=20
>>trade-off.
>=20
>=20
> I'm sure that you cannot imagine how much beating i have gotten for mak=
ing
> CONSIDER_NICE=3Dno the default for the powersaved on SUSE 9.1... :-)
> It took man-weeks of debating what could be a sensible default for this.
> This has to be tweakable.
Well, my point was that if people want different things from the simple=20
and normal behaviour, they use a userspace deamon... for instance=20
powersaved .

Eric
