From: Borislav Petkov <bp@alien8.de>
Subject: Re: More cpufreq breakage
Date: Sun, 24 Mar 2013 11:35:20 +0100
Message-ID: <20130324103520.GB18601@pd.tnic>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
 <CAKohpokjpOepnuj3dny+j0UYurVHBZci=BdFa5OxR+e7k-512w@mail.gmail.com>
 <20130323134541.GA10811@pd.tnic>
 <5152799.d8sLDQMJWT@vostro.rjw.lan>
 <CAKohpomTBEu1ByjnSw1mbyBhXKTrj=Qte7fBuyaKp+TcOb8d_w@mail.gmail.com>
 <CAKohpok-75YSAwdni5O07PtmEZbSKF9YrJjpHtG+r0T-aVn6ww@mail.gmail.com>
 <20130323160644.GC10811@pd.tnic>
 <CAKohpokYqU4HsC0=GY1OxvWpz-Cb-x0p6zKmTOe86JfKyiS+GQ@mail.gmail.com>
 <20130323185045.GA4801@pd.tnic>
 <CAKohpomGkY10eBakYOwAt5FVoq-UTNY4vwAUfg0YxTJVsPcU4A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1364121321; bh=YQEsqDdhWhlg0hHwLN9182TnV9Irvl6SBKX3cbb8n7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=VZBqHzFDix7iG3bUHr8sLIWmXuyDlarm9DOLNe
	BGAoVSu53mvqBSMWY/2YmAMBDTW4jfeXLRLvJTXn8qfmGJ6K7bYxvxFamRmYt3Lbghd
	pK4UJtiHyRspWeYNX6tNcp8m5XBX0+rIrbwvXQ76TLtkRGHl6Mk3wv2kHfScFQmnjw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1364121321; bh=YQEsqDdhWhlg0hHwLN9182TnV9Irvl6SBKX3cbb8n7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=VZBqHzFDix7iG3bUHr8sLIWmXuyDlarm9DOLNe
	BGAoVSu53mvqBSMWY/2YmAMBDTW4jfeXLRLvJTXn8qfmGJ6K7bYxvxFamRmYt3Lbghd
	pK4UJtiHyRspWeYNX6tNcp8m5XBX0+rIrbwvXQ76TLtkRGHl6Mk3wv2kHfScFQmnjw=
Content-Disposition: inline
In-Reply-To: <CAKohpomGkY10eBakYOwAt5FVoq-UTNY4vwAUfg0YxTJVsPcU4A@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: 1i5t5.duncan@cox.net, "Rafael J. Wysocki" <rjw@sisk.pl>, bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Thomas Renninger <trenn@suse.de>

On Sun, Mar 24, 2013 at 02:35:41PM +0530, Viresh Kumar wrote:
> I didn't get a complete picture of your problem, can you elaborate a
> bit with all your observations?

It is basically the same observation. Some of the even cores are not
handled by any cpufreq driver anymore, i.e. in the cpufreq-info output.
And thus they remain in P0 which is max freq. And this happens because
I'm suspending my workstation at night which takes the cores offline, so
it is the same trigger as Duncan's.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
