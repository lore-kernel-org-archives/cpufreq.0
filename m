From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: [PATCHSET] 0/3 A dynamic cpufreq governor
Date: Mon, 27 Oct 2003 17:19:05 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031027161905.GP28351@poupinou.org>
References: <88056F38E9E48644A0F562A38C64FB6007796A@scsmsx403.sc.intel.com>
	<yw1xfzhhhyhs.fsf@kth.se> <20031027151648.GD4210@brodo.de>
	<yw1xd6ciemc5.fsf@kth.se> <20031027155932.GO28351@poupinou.org>
	<yw1x8yn6ekc8.fsf@kth.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <yw1x8yn6ekc8.fsf@kth.se>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mru@kth.se>
Cc: cpufreq@www.linux.org.uk, Dominik Brodowski <linux@brodo.de>

On Mon, Oct 27, 2003 at 05:06:31PM +0100, M=E5ns Rullg=E5rd wrote:
> Ducrot Bruno <ducrot@poupinou.org> writes:
>=20
> >> >> Is there any way this thing can be made to work on a Pentium 4 M,
> >> >> using p4-clockmod for frequency changing?
> >> >
> >> > You should prefer the speedstep-ich driver for Pentium 4 M, as long =
as the
> >> > southbridge on your notebook is from Intel - p4-clockmod doesn't sav=
e you
> >>=20
> >> The problem is my chipset is SiS 650.
> >>=20
> >
> > Does the generic acpi P-state driver work?  If not, well, nobody can't
>=20
> I think so, but it only gives two different speeds to choose from,
> 1200 MHz and 2 GHz.  p4-clockmod give me speeds from 250 MHz to 2 GHz.
>=20

You have then voltage scaling with the acpi driver.
From my point-of-view, this is better than the p4-clockmod,
the speedstep-ich would give you no more states (if
it can be made to work with SiS southbridges), just that the acpi driver
will be a little bit slower (it work by calling some bios functions)
than direct access to IO like speedstep-ich does.
Note that p4-clockmod do *not* regulate voltage.  From power comsuptions
like, if you are at 1200 MHz, but via the acpi driver, you would be
like at 600MHz with the p4-clockmod, and actually it may be possible
that idle loops will be more power conservative with acpi (I am not sure for
that one though).  Dominik have better words than me to explain that.

--=20
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
