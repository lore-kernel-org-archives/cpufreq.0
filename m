From: Borislav Petkov <bp@alien8.de>
Subject: Re: More cpufreq breakage
Date: Sat, 23 Mar 2013 19:50:45 +0100
Message-ID: <20130323185045.GA4801@pd.tnic>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
 <CAKohpokjpOepnuj3dny+j0UYurVHBZci=BdFa5OxR+e7k-512w@mail.gmail.com>
 <20130323134541.GA10811@pd.tnic>
 <5152799.d8sLDQMJWT@vostro.rjw.lan>
 <CAKohpomTBEu1ByjnSw1mbyBhXKTrj=Qte7fBuyaKp+TcOb8d_w@mail.gmail.com>
 <CAKohpok-75YSAwdni5O07PtmEZbSKF9YrJjpHtG+r0T-aVn6ww@mail.gmail.com>
 <20130323160644.GC10811@pd.tnic>
 <CAKohpokYqU4HsC0=GY1OxvWpz-Cb-x0p6zKmTOe86JfKyiS+GQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1364064646; bh=6+DRrH4H6kVymljuE7N4BSNDc5MQp3hS+lHnmaWUBto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=Kah+eGNLEUfxLfJhHQV1b6qPS3d+s2FwVBgyaE
	fXmXmqbqzfQp8MAmK9X9XRUr4a4pRDzFPQB5+6z1RPbrEBIs48ttXfu6/GXEh54ZcC7
	zk11CNe3W+4a04NWdLnMO0U9BmmtShzD/DRqbLlZPmwie/R5VijF0XvqAY1hZmdAYA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1364064646; bh=6+DRrH4H6kVymljuE7N4BSNDc5MQp3hS+lHnmaWUBto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=Kah+eGNLEUfxLfJhHQV1b6qPS3d+s2FwVBgyaE
	fXmXmqbqzfQp8MAmK9X9XRUr4a4pRDzFPQB5+6z1RPbrEBIs48ttXfu6/GXEh54ZcC7
	zk11CNe3W+4a04NWdLnMO0U9BmmtShzD/DRqbLlZPmwie/R5VijF0XvqAY1hZmdAYA=
Content-Disposition: inline
In-Reply-To: <CAKohpokYqU4HsC0=GY1OxvWpz-Cb-x0p6zKmTOe86JfKyiS+GQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: 1i5t5.duncan@cox.net, "Rafael J. Wysocki" <rjw@sisk.pl>, bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Thomas Renninger <trenn@suse.de>

On Sat, Mar 23, 2013 at 10:34:28PM +0530, Viresh Kumar wrote:
> And that is already caused recently?

3.8.3 is fine and there are no cpufreq patches in v3.8..v3.8.3. Which
would mean, plain v3.8 is also fine. Which means, the breakage must've
come in during the merge window.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
