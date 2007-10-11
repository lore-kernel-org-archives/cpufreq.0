From: Andy Whitcroft <apw@shadowen.org>
Subject: Re: [PATCH][try 2] architectural pstate driver for powernow-k8
Date: Thu, 11 Oct 2007 08:59:58 +0100
Message-ID: <20071011075958.GK1130@shadowen.org>
References: <200710091446.38432.mark.langsdorf@amd.com> <p73fy0k3ve8.fsf@bingen.suse.de> <200710091543.21350.mark.langsdorf@amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756894AbXJKIAr@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200710091543.21350.mark.langsdorf@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mark Langsdorf <mark.langsdorf@amd.com>
Cc: Andi Kleen <andi@firstfloor.org>, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

On Tue, Oct 09, 2007 at 03:43:20PM -0500, Mark Langsdorf wrote:
> On Tuesday 09 October 2007 15:06, Andi Kleen wrote:
> > "Mark Langsdorf" <mark.langsdorf@amd.com> writes:
> >=20
> > > This patch should apply cleanly to the 2.6.22.6 kernel.
> >=20
> > Isn't that a little old? The earliest this could be merged
> > is the upcomming 2.6.24 tree. Best you submit it against .23
> > or better -mm.
>=20
> Good point.
>=20
> This patch should apply cleanly to the 2.6.23-rc8-mm2 kernel. =A0It c=
hanges=20
> the powernow-k8 driver code that deals with 3rd generation Opteron, P=
henom,
> and later processors to match the architectual pstate driver describe=
d
> in the AMD64 Architecture Programmer's Manual Volume 2 Chapter 18. =A0=
The
> initial implementation of the hardware pstate driver for PowerNow!
> used some processor-version specific features, and would not be
> maintainable in the long term as the processor features changed.
> This architectural driver should work on all future AMD processors.
>=20
> -Mark Langsdorf
> Operating System Resarch Center
> AMD
>=20
> Signed-off-by <mark.langsdorf@amd.com>
> Acked-by <andreas.herrmann3@amd.com>
[...]
>  	/* get fid did for hardware pstate transition */
>  	pstate =3D index & HW_PSTATE_MASK;
> -	if (pstate > MAX_HW_PSTATE)
> +	if (pstate > data->max_hw_pstate);
>  		return 0;

checkpatch picked up this dodgy if.  I suspect that the ';' is wrong
from the context.

> -	fid =3D (index & HW_FID_INDEX_MASK) >> HW_FID_INDEX_SHIFT;
> -	did =3D (index & HW_DID_INDEX_MASK) >> HW_DID_INDEX_SHIFT;
> -	freqs.old =3D find_khz_freq_from_fiddid(data->currfid, data->currdi=
d);
> -	freqs.new =3D find_khz_freq_from_fiddid(fid, did);
> +	freqs.old =3D find_khz_freq_from_pstate(data->powernow_table, data-=
>currpstate);
> +	freqs.new =3D find_khz_freq_from_pstate(data->powernow_table, pstat=
e);

-apw
