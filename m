From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: [Bug 8081] New: Conservative governor sets wrong and too high
 sampling rates
Date: Sun, 25 Feb 2007 21:23:58 +0100
Message-ID: <45E1F05E.40104@interia.pl>
References: <200702251628.l1PGS3YC021654@fire-2.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200702251628.l1PGS3YC021654@fire-2.osdl.org>
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
Content-Type: text/plain; charset="iso-8859-9"
To: ferriste@libero.it
Cc: cpufreq@lists.linux.org.uk

> Distribution: Slackware 11.0
Distribution: Gentoo
> Hardware Environment: Asus laptop with amd athlon xp-m 2800+
Hardware Environment: Modified VIA EPIA M10000
> [...]
> most of users=20
> will find the conservative governor useless if they don't know how to mod=
ify=20
> it, because the system will not respond to a rapid increasing load.
NACK. I find it usefull. Can these users read?
"2.5 Conservative
----------------
The CPUfreq governor "conservative", much like the "ondemand"
governor, sets the CPU depending on the current usage.  It differs in
behavior in that it gracefully increases and decreases the CPU speed
rather than jumping to max speed the moment there is any load on the
CPU.  This behavior more suitable in a battery powered environment. [...]"
Response to rapidly increasing load is "ondemand" job if I remember right.
> [...]
> You can also load the cpufreq_stats module and look in the stats folder=20
> (/sys/.../cpufreq/stats). You will see that ondemand causes a lot of=20
> transitions, while conservative does not.
Great! Exacly what I need.

Rafa=B3


----------------------------------------------------------------------
Przedluz domene.PL za 75 z=B3 >> http://link.interia.pl/f1a19
