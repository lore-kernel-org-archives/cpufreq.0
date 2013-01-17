From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] powernow-k8: Add a kconfig dependency on acpi-cpufreq
Date: Thu, 17 Jan 2013 15:17:58 +0100
Message-ID: <20130117141758.GA3386@pd.tnic>
References: <1357780161-30581-1-git-send-email-Aravind.Gopalakrishnan@amd.com>
 <20130117115436.GA3853@pd.tnic>
 <20130117115844.GB3853@pd.tnic>
 <7359167.GTsCEtNASI@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358432279; bh=qfZJ6XG1EzPvPa7fzqXil3NoAbGqi6joviogmiAgFi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=iCph7vSto6+JPF3X+JhVsVdYRjNnnURRQ+uP6G
	lt1YpiZNAbQAp/APnZXEmsorP8eqBH8BN+UoxZmogP2v+AbXM8cMcbzoCrFQOGzdPVF
	VOKfxtKqHcxJpZ+Q0qb02UK7R6nNm6LHFN0T0JCljL36QYesjoRfosKTOrFaV/9s9w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358432279; bh=qfZJ6XG1EzPvPa7fzqXil3NoAbGqi6joviogmiAgFi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=iCph7vSto6+JPF3X+JhVsVdYRjNnnURRQ+uP6G
	lt1YpiZNAbQAp/APnZXEmsorP8eqBH8BN+UoxZmogP2v+AbXM8cMcbzoCrFQOGzdPVF
	VOKfxtKqHcxJpZ+Q0qb02UK7R6nNm6LHFN0T0JCljL36QYesjoRfosKTOrFaV/9s9w=
Content-Disposition: inline
In-Reply-To: <7359167.GTsCEtNASI@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: "Gopalakrishnan, Aravind" <Aravind.Gopalakrishnan@amd.com>, Andre Przywara <andre@andrep.de>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andreas <linuxuser330250@gmx.net>

On Thu, Jan 17, 2013 at 01:53:55PM +0100, Rafael J. Wysocki wrote:
> Do we need that in -stable?

Yes, please.

Thanks.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
