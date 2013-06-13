From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v3 1/3] cpufreq: ondemand: Change the calculation of
 target frequency
Date: Fri, 14 Jun 2013 00:37:41 +0200
Message-ID: <20130613223740.GE32112@pd.tnic>
References: <q46r5iepl3sunqe5eemv66hk.1370694869222@email.android.com>
 <51BA380A.1040009@semaphore.gr>
 <20130613214007.GA32127@pd.tnic>
 <1645236.hTWQPUhyIx@vostro.rjw.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1371163062; bh=MucI1YjK23jqObZc/ytL6tTOVlyrFOKX2gqJ2ChIKnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:In-Reply-To; b=Dhxwf0j49PVS
	vmsDsGGHC0MY9d/Ny6FtZ+/neaDJvxrCJy7Bquu1VU+0HOi2jgNuRVtwzILZ/B7Atra
	D0pWaTBaplQatwi9/Cyv/AIklQiAUssbObx/3v+u8U0l5TZBkBMfVjbVpdCd8oq4H9C
	2VapHX67Ex7KHyn+VBJG/9if0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1371163062; bh=MucI1YjK23jqObZc/ytL6tTOVlyrFOKX2gqJ2ChIKnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:In-Reply-To; b=Dhxwf0j49PVS
	vmsDsGGHC0MY9d/Ny6FtZ+/neaDJvxrCJy7Bquu1VU+0HOi2jgNuRVtwzILZ/B7Atra
	D0pWaTBaplQatwi9/Cyv/AIklQiAUssbObx/3v+u8U0l5TZBkBMfVjbVpdCd8oq4H9C
	2VapHX67Ex7KHyn+VBJG/9if0=
Content-Disposition: inline
In-Reply-To: <1645236.hTWQPUhyIx@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Stratos Karafotis <stratosk@semaphore.gr>, Borislav Petkov <bp@suse.de>, Viresh Kumar <viresh.kumar@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jun 14, 2013 at 12:15:36AM +0200, Rafael J. Wysocki wrote:
> On Thursday, June 13, 2013 11:40:08 PM Borislav Petkov wrote:

[ =E2=80=A6 ]

> > Not bad. However, exec_test and fork_test are kinda unexpected with=
 such
> > a high improvement percentage. Happen to have an explanation?
> >=20
> > FWIW, if we don't find any serious perf/power regressions with
> > this patch, I'd say it is worth applying even solely for the code
> > simplification it brings.
>=20
> May I take this as an ACK? ;-)
>=20
> Well, that's my opinion too, actually.

I know - you told me and I like that aspect :-). And from the test
results so far, the code simplification is maybe the most persuasive
one. The slight improvements in perf/power are then the cherry on top.

Although, I'm not sure we're exhaustive with the benchmarks and we
should maybe run a couple more. Although, judging by the results,
generally no serious outliers should be expected (except exec_test and
fork_test funsies above), which are actually positive outliers.

Judging by the code change, the only worry we should have, AFAIU, is
any raise in power consumption due to spending longer periods in the
intermediary P-states now and not going straight to the lowest P-state.
But this compensates with improvement in runtime of the workloads.

Hmm, I dunno - I'm just thinking out loud here...

--=20
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
