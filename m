From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] (1/3) cpufreq_ondemand - 01_ignore-nice.diff
Date: Mon, 21 Feb 2005 16:54:06 +0100
Message-ID: <20050221155406.GB16665@isilmar.linta.de>
References: <20050220131518.GB4495@inskipp> <4218B768.8020401@tremplin-utc.net>
	<4219B603.8050403@tremplin-utc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
In-Reply-To: <4219B603.8050403@tremplin-utc.net>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Piel <Eric.Piel@tremplin-utc.net>
Cc: davej@redhat.com, cpufreq@zenii.linux.org.uk, alex-kernel@digriz.org.uk, Alexander Clouter <alex@digriz.org.uk>

On Mon, Feb 21, 2005 at 11:20:51AM +0100, Eric Piel wrote:
> Eric Piel a =E9crit :
> >Alexander Clouter a =E9crit :
> >
> >>Adds support to cpufreq_ondemand to ignore 'nice' cpu time
> >>
> >IMO, this policy should be has lightweight as possible. Why not making=20
> >this feature just hard-coded? Don't count the load that nice'd tasks do,=
=20
> >period!
> >
> >It would make the patch 5 lines instead of 50. Every userspace deamon=20
> >have this feature enabled by default, so this is a very reasonable=20
> >trade-off.
> >
> Here is the patch, it does exactly the same functionality but it's=20
> completly static and therefore much smaller. Just tested on my computer, =

> it does the trick.

IMO it was a wise decision to do this as a tuneable parameter.

	Dominik
