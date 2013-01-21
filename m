From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 0/6] acpi-cpufreq and powernow-k8 fixes
Date: Mon, 21 Jan 2013 01:04:02 +0100
Message-ID: <20130121000402.GA19343@pd.tnic>
References: <1358677470-17394-1-git-send-email-bp@alien8.de>
 <1838903.lYvY4Nk4I1@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358726483; bh=Ny0S/ekVeyiYUC4I7jFtdyUDr20PZ0oue+D81KyxsL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=fsctNcHRStUNgpLaXSLIqqOEu7Z98ulfJRCQh1
	aANNt6fpvGD3CBN9ov3/DqAFZ3LamWjGZt632Ec/+aSmm90C+1JsTpHOk06krbTY7s0
	2TY0OYZInNmAxvOmyQatxE3BRNsZgQAmwMfv/o5EQAwqdV+dowOM6wavmu8ve1CA1U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358726483; bh=Ny0S/ekVeyiYUC4I7jFtdyUDr20PZ0oue+D81KyxsL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=fsctNcHRStUNgpLaXSLIqqOEu7Z98ulfJRCQh1
	aANNt6fpvGD3CBN9ov3/DqAFZ3LamWjGZt632Ec/+aSmm90C+1JsTpHOk06krbTY7s0
	2TY0OYZInNmAxvOmyQatxE3BRNsZgQAmwMfv/o5EQAwqdV+dowOM6wavmu8ve1CA1U=
Content-Disposition: inline
In-Reply-To: <1838903.lYvY4Nk4I1@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: =?utf-8?B?QW5kcsOp?= Przywara <andre@andrep.de>, Leonid Isaev <lisaev@umail.iu.edu>, Tom Gundersen <teg@jklm.no>, cpufreq@vger.kernel.org, linux-acpi@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@suse.de>

On Sun, Jan 20, 2013 at 03:18:11PM +0100, Rafael J. Wysocki wrote:
> Well, it all looks reasonable to me.
>
> I suppose you'd like it to go into v3.8 plus v3.7-stable, right?

Well, sort of.

Patch 0001 which you've already taken and tagged for 3.7-stable and is
on its way to 3.8 is fine since it fixes a bug.

The rest are, IMHO, more or less annoyances fixes which could easily
wait for 3.9 and maybe be backported if there really is an issue. Also,
they'd see a lot more testing this way. Because in at least 99% of the
cases, acpi-cpufreq and powernow-k8 are modules and the handoff works
there.

This is at least how I see it, you tell me whether it makes sense or
not.

Thanks.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
