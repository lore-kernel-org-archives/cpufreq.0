From: Dominik Brodowski <linux@brodo.de>
Subject: Re: [PATCHSET] 0/3 A dynamic cpufreq governor
Date: Mon, 27 Oct 2003 16:16:48 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031027151648.GD4210@brodo.de>
References: <88056F38E9E48644A0F562A38C64FB6007796A@scsmsx403.sc.intel.com>
	<yw1xfzhhhyhs.fsf@kth.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <yw1xfzhhhyhs.fsf@kth.se>
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
Cc: cpufreq@www.linux.org.uk

On Sat, Oct 25, 2003 at 10:07:59PM +0200, M=E5ns Rullg=E5rd wrote:
> "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com> writes:
>=20
> > This is the "new and improved" version of the patch =20
> > that was sent out earlier this week. Thanks for all the=20
> > feedback/suggestions.
> > (lkml subject line reference for previous thread -
> > "Dynamic cpufreq governor and updates to ACPI P-state driver")
>=20
> Is there any way this thing can be made to work on a Pentium 4 M,
> using p4-clockmod for frequency changing?

You should prefer the speedstep-ich driver for Pentium 4 M, as long as th=
e
southbridge on your notebook is from Intel - p4-clockmod doesn't save you
anything if either APM or ACPI "idling" works correctly.

	Dominik
