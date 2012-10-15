From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] cpufreq, powernow-k8: Remove usage of smp_processor_id()
 in preemptible code
Date: Mon, 15 Oct 2012 10:40:11 +0200
Message-ID: <20121015084011.GA5000@liondog.tnic>
References: <20121009193844.GC7724@alberich>
 <20121012151841.GA4571@alberich>
 <27008283.MeT6T60WP8@vostro.rjw.lan>
 <1395148.DypXQr3MdC@vostro.rjw.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1350290412; bh=nCMcZRDFaSAIvnqBcPzJkFaSsj0Q+/Nt8G9IcXLXKws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:In-Reply-To; b=SvOrnBS+6WZt
	xfnV9X5bxQpHUZ2Ex90y4pyEobeiPSajLuA07wZih+8ocjrfStq53KaI2hj5yJoQAer
	X68HWPOWJAcF2lPXlvXHXZGi1xz/no1z2hrk8BvIacbnhS2hb64x5pFMq/HfLx5sEo3
	zKnHY/PLB0pJGnSS/PF7gEexo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1350290412; bh=nCMcZRDFaSAIvnqBcPzJkFaSsj0Q+/Nt8G9IcXLXKws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:In-Reply-To; b=SvOrnBS+6WZt
	xfnV9X5bxQpHUZ2Ex90y4pyEobeiPSajLuA07wZih+8ocjrfStq53KaI2hj5yJoQAer
	X68HWPOWJAcF2lPXlvXHXZGi1xz/no1z2hrk8BvIacbnhS2hb64x5pFMq/HfLx5sEo3
	zKnHY/PLB0pJGnSS/PF7gEexo=
Content-Disposition: inline
In-Reply-To: <1395148.DypXQr3MdC@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Andreas Herrmann <andreas.herrmann3@amd.com>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Tejun Heo <tj@kernel.org>, linux-pm@vger.kernel.org

On Mon, Oct 15, 2012 at 07:50:13AM +0200, Rafael J. Wysocki wrote:
> Well, please don't tag patches for -stable, because -stable doesn't
> take _patches_.

Really, I didn't know that?! :-)

> It takes commits from the Linus' tree and backports them and that's
> maintainer's job to tag them for -stable, not yours.

You're not serious, right? This is not the case in at least 50% of the
cases.

And this is OK because maintainers don't always know whether the patch
should be tagged for stable. So yes, people should add the stable tag
and yes, committers still have a veto over it.

And yes, Andreas and I *know* how stable patches get applied, thank you
very much.

[ =E2=80=A6 ]

> Yes, they do, but that means it doesn't make sense to send them stuff
> before it's been merged, right?

Ok, I get it, you don't want people to send patches to stable@vger
*before* they've hit mainline.

Nothing in <Documentation/stable_kernel_rules.txt> states that
stable@vger shouldn't get CCed on submissions unless the patch is
upstream and besides, stable@vger gets CCed in a lot of discussions
anyway so there's other traffic just the same.

Bottomline: If you think people shouldn't spam stable@vger, then tough
luck - I don't think you can stop people from accidentally/due to the
automated nature of the process, CC stable. Even if it said so in the
above doc file.

As a result, stable maintainers simply rely on scripts which verify the
patch is actually upstream before applying it to stable.

--=20
Regards/Gruss,
    Boris.
