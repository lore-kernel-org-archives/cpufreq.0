From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: More cpufreq breakage
Date: Sun, 24 Mar 2013 14:35:41 +0530
Message-ID: <CAKohpomGkY10eBakYOwAt5FVoq-UTNY4vwAUfg0YxTJVsPcU4A@mail.gmail.com>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
	<CAKohpokjpOepnuj3dny+j0UYurVHBZci=BdFa5OxR+e7k-512w@mail.gmail.com>
	<20130323134541.GA10811@pd.tnic>
	<5152799.d8sLDQMJWT@vostro.rjw.lan>
	<CAKohpomTBEu1ByjnSw1mbyBhXKTrj=Qte7fBuyaKp+TcOb8d_w@mail.gmail.com>
	<CAKohpok-75YSAwdni5O07PtmEZbSKF9YrJjpHtG+r0T-aVn6ww@mail.gmail.com>
	<20130323160644.GC10811@pd.tnic>
	<CAKohpokYqU4HsC0=GY1OxvWpz-Cb-x0p6zKmTOe86JfKyiS+GQ@mail.gmail.com>
	<20130323185045.GA4801@pd.tnic>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20130323185045.GA4801@pd.tnic>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>
Cc: 1i5t5.duncan@cox.net, "Rafael J. Wysocki" <rjw@sisk.pl>, bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Thomas Renninger <trenn@suse.de>

[Forgot to add all in previous mail, reply-all now]

On 24 March 2013 00:20, Borislav Petkov <bp@alien8.de> wrote:
> On Sat, Mar 23, 2013 at 10:34:28PM +0530, Viresh Kumar wrote:
>> And that is already caused recently?

Ahh!! s/already/also

> 3.8.3 is fine and there are no cpufreq patches in v3.8..v3.8.3. Which
> would mean, plain v3.8 is also fine. Which means, the breakage must've
> come in during the merge window.

I didn't get a complete picture of your problem, can you elaborate a bit
with all your observations?

It might be related to the problem reported by Duncan and might be solved
by the patch i sent yesterday.
