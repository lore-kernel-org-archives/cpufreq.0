From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: [PATCHSET] 0/3 A dynamic cpufreq governor
Date: Mon, 27 Oct 2003 16:59:32 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031027155932.GO28351@poupinou.org>
References: <88056F38E9E48644A0F562A38C64FB6007796A@scsmsx403.sc.intel.com>
	<yw1xfzhhhyhs.fsf@kth.se> <20031027151648.GD4210@brodo.de>
	<yw1xd6ciemc5.fsf@kth.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <yw1xd6ciemc5.fsf@kth.se>
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

On Mon, Oct 27, 2003 at 04:23:22PM +0100, M=E5ns Rullg=E5rd wrote:
> Dominik Brodowski <linux@brodo.de> writes:
>=20
> >> > This is the "new and improved" version of the patch =20
> >> > that was sent out earlier this week. Thanks for all the=20
> >> > feedback/suggestions.
> >> > (lkml subject line reference for previous thread -
> >> > "Dynamic cpufreq governor and updates to ACPI P-state driver")
> >>=20
> >> Is there any way this thing can be made to work on a Pentium 4 M,
> >> using p4-clockmod for frequency changing?
> >
> > You should prefer the speedstep-ich driver for Pentium 4 M, as long as =
the
> > southbridge on your notebook is from Intel - p4-clockmod doesn't save y=
ou
>=20
> The problem is my chipset is SiS 650.
>=20

Does the generic acpi P-state driver work?  If not, well, nobody can't
help you, if no one work for the reverse engeenering part for SiS.
It was so long for the PIIX4 case (but probably the SiS should be a little
bit more easy like the ich case I hope).

--=20
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
