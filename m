From: mru@kth.se (=?iso-8859-1?q?M=E5ns_Rullg=E5rd?=)
Subject: Re: [PATCHSET] 0/3 A dynamic cpufreq governor
Date: Mon, 27 Oct 2003 17:06:31 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <yw1x8yn6ekc8.fsf@kth.se>
References: <88056F38E9E48644A0F562A38C64FB6007796A@scsmsx403.sc.intel.com>
	<yw1xfzhhhyhs.fsf@kth.se> <20031027151648.GD4210@brodo.de>
	<yw1xd6ciemc5.fsf@kth.se> <20031027155932.GO28351@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20031027155932.GO28351@poupinou.org> (Ducrot Bruno's message
	of "Mon, 27 Oct 2003 16:59:32 +0100")
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
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk, Dominik Brodowski <linux@brodo.de>

Ducrot Bruno <ducrot@poupinou.org> writes:

>> >> Is there any way this thing can be made to work on a Pentium 4 M,
>> >> using p4-clockmod for frequency changing?
>> >
>> > You should prefer the speedstep-ich driver for Pentium 4 M, as long =
as the
>> > southbridge on your notebook is from Intel - p4-clockmod doesn't sav=
e you
>>=20
>> The problem is my chipset is SiS 650.
>>=20
>
> Does the generic acpi P-state driver work?  If not, well, nobody can't

I think so, but it only gives two different speeds to choose from,
1200 MHz and 2 GHz.  p4-clockmod give me speeds from 250 MHz to 2 GHz.

--=20
M=E5ns Rullg=E5rd
mru@kth.se
